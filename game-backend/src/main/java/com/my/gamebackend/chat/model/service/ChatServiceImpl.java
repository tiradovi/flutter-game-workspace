package com.my.gamebackend.chat.model.service;

import com.my.gamebackend.chat.model.dto.*;
import com.my.gamebackend.chat.model.mapper.ChatKnowMapper;
import com.my.gamebackend.chat.model.mapper.ChatMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Random;

@Slf4j
@Service
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService {

    private final ChatKnowMapper chatKnowMapper;
    private final ChatMapper chatMapper;
    private final Random random = new Random();

    @Override
    @Transactional
    public ChatResponse sendMessage(ChatRequest request) {
        log.info("메시지 수신 - 사용자: {}, 메시지: {}", request.getUserId(), request.getMessage());

        Long conversationId = request.getConversationId();

        // 새 대화인 경우 생성
        if (conversationId == null) {
            ChatConversation conversation = new ChatConversation();
            conversation.setUserId(request.getUserId());
            chatMapper.createConversation(conversation);
            conversationId = conversation.getId();
            log.info("새 대화방 생성 - ID: {}", conversationId);
        } else {
            chatMapper.updateConversation(conversationId);
            log.info("기존 대화방 업데이트 - ID: {}", conversationId);
        }

        // 사용자 메시지 저장
        ChatMessage userMessage = new ChatMessage();
        userMessage.setConversationId(conversationId);
        userMessage.setMessage(request.getMessage());
        userMessage.setIsUserMessage(true);
        chatMapper.saveMessage(userMessage);

        // AI 응답 생성 (지식 베이스 활용)
        String botResponse = generateIntelligentResponse(request.getMessage(), conversationId);
        log.info("봇 응답 생성: {}", botResponse);

        // 봇 응답 저장
        ChatMessage botMessage = new ChatMessage();
        botMessage.setConversationId(conversationId);
        botMessage.setMessage(botResponse);
        botMessage.setIsUserMessage(false);
        chatMapper.saveMessage(botMessage);

        // 응답 생성
        ChatResponse response = new ChatResponse();
        response.setConversationId(conversationId);
        response.setMessage(botResponse);
        response.setTimestamp(LocalDateTime.now());

        return response;
    }

    @Override
    public List<ChatMessage> getConversationHistory(Long conversationId) {
        log.info("대화 기록 조회 - 대화방 ID: {}", conversationId);
        return chatMapper.getMessages(conversationId);
    }

    @Override
    public List<ChatConversation> getUserConversations(String userId) {
        log.info("사용자 대화 목록 조회 - 사용자 ID: {}", userId);
        return chatMapper.getUserConversations(userId);
    }

    /**
     * 지식 베이스와 인텐트를 활용한 지능형 응답 생성
     */
    private String generateIntelligentResponse(String message, Long conversationId) {
        String normalizedMessage = message.toLowerCase().trim();

        log.info("문자 확인 - {}", normalizedMessage);

        // 1단계: 인텐트 기반 응답 시도
        ChatbotIntent intent = matchIntent(normalizedMessage);
        if (intent != null) {
            log.info("인텐트 매칭 성공 - {}", intent.getIntentName());
            // 컨텍스트 저장
            saveContext(conversationId, "last_topic", intent.getIntentName());
            return getRandomResponse(intent.getResponses());
        }

        // 2단계: 키워드 기반 지식 베이스 검색
        ChatbotKnowledge knowledge = matchKnowledge(normalizedMessage);
        if (knowledge != null) {
            log.info("지식 베이스 매칭 성공 - 카테고리: {}", knowledge.getCategory());

            // 특수 처리가 필요한 응답
            if ("time".equals(knowledge.getCategory())) {
                return getCurrentTimeResponse();
            }

            // 컨텍스트 저장
            saveContext(conversationId, "last_topic", knowledge.getCategory());
            return knowledge.getAnswer();
        }

        // 3단계: 컨텍스트 기반 응답
        String contextResponse = getContextBasedResponse(conversationId, normalizedMessage);
        if (contextResponse != null) {
            log.info("컨텍스트 기반 응답 사용");
            return contextResponse;
        }

        // 4단계: 기본 응답
        log.info("기본 응답 사용");
        return getDefaultResponse();
    }

    /**
     * 인텐트 매칭
     */
    private ChatbotIntent matchIntent(String message) {
        List<ChatbotIntent> intents = chatKnowMapper.findAllIntents();

        for (ChatbotIntent intent : intents) {
            if (intent.getPatterns() != null) {
                for (String pattern : intent.getPatterns()) {
                    if (message.contains(pattern.toLowerCase())) {
                        return intent;
                    }
                }
            }
        }
        return null;
    }

    /**
     * 지식 베이스 매칭
     */
    private ChatbotKnowledge matchKnowledge(String message) {
        List<ChatbotKnowledge> knowledgeList = chatKnowMapper.findAllActive();

        ChatbotKnowledge bestMatch = null;
        int highestPriority = -1;

        for (ChatbotKnowledge knowledge : knowledgeList) {
            if (knowledge.getKeywords() != null) {
                for (String keyword : knowledge.getKeywords()) {
                    if (message.contains(keyword.toLowerCase())) {
                        if (knowledge.getPriority() > highestPriority) {
                            bestMatch = knowledge;
                            highestPriority = knowledge.getPriority();
                        }
                        break;
                    }
                }
            }
        }

        return bestMatch;
    }

    /**
     * 컨텍스트 기반 응답
     */
    private String getContextBasedResponse(Long conversationId, String message) {
        ChatbotContext context = chatKnowMapper.getContext(conversationId, "last_topic");

        if (context != null) {
            String lastTopic = context.getContextValue();
            log.info("이전 대화 주제: {}", lastTopic);

            // 인사 후 질문에 대한 자연스러운 응답
            if ("greeting".equals(lastTopic)) {
                if (message.contains("날씨") || message.contains("시간")) {
                    ChatbotKnowledge knowledge = matchKnowledge(message);
                    if (knowledge != null) {
                        return "네, " + knowledge.getAnswer();
                    }
                }
            }
        }

        return null;
    }

    /**
     * 컨텍스트 저장
     */
    private void saveContext(Long conversationId, String key, String value) {
        try {
            ChatbotContext context = new ChatbotContext();
            context.setConversationId(conversationId);
            context.setContextKey(key);
            context.setContextValue(value);
            context.setExpiresAt(LocalDateTime.now().plusHours(24));
            chatKnowMapper.saveContext(context);
            log.info("컨텍스트 저장 - 키: {}, 값: {}", key, value);
        } catch (Exception e) {
            log.error("컨텍스트 저장 실패", e);
        }
    }

    /**
     * 현재 시간 응답
     */
    private String getCurrentTimeResponse() {
        LocalDateTime now = LocalDateTime.now();
        return String.format("현재 시간은 %d시 %d분입니다.", now.getHour(), now.getMinute());
    }

    /**
     * 배열에서 랜덤 응답 선택
     */
    private String getRandomResponse(String[] responses) {
        if (responses == null || responses.length == 0) {
            return getDefaultResponse();
        }
        return responses[random.nextInt(responses.length)];
    }

    /**
     * 기본 응답
     */
    private String getDefaultResponse() {
        String[] defaultResponses = {
                "죄송합니다. 질문을 이해하지 못했습니다. 다시 말씀해 주시겠어요?",
                "잘 이해하지 못했습니다. 다른 방식으로 질문해 주실 수 있나요?",
                "죄송하지만 그 부분은 잘 모르겠습니다. 다른 질문을 해주세요.",
                "무엇을 도와드릴까요? 좀 더 구체적으로 말씀해 주시면 감사하겠습니다."
        };
        return defaultResponses[random.nextInt(defaultResponses.length)];
    }
}