package com.my.gamebackend.chat.controller;

import com.my.gamebackend.chat.model.dto.ChatConversation;
import com.my.gamebackend.chat.model.dto.ChatMessage;
import com.my.gamebackend.chat.model.dto.ChatRequest;
import com.my.gamebackend.chat.model.dto.ChatResponse;
import com.my.gamebackend.chat.model.service.ChatService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/chat")
@RequiredArgsConstructor
public class ChatController {
    private final ChatService chatService;

    /**
     * 메세지 전송 API
     * POST /api/chat/message
     */
    @PostMapping("/message")
    public ResponseEntity<ChatResponse> sendMessage(@RequestBody ChatRequest request) {
        try {
            log.info("메세지 요청 수신 - 사용자 : {}, 메세지:{}", request.getUserId(), request.getMessage());
            if (request.getUserId() == null || request.getUserId().isEmpty()) {
                log.warn("사용자 ID가 없습니다.");
                return ResponseEntity.badRequest().build();
            }
            if (request.getMessage() == null || request.getMessage().isEmpty()) {
                log.warn("메세지가 비어있습니다.");
                return ResponseEntity.badRequest().build();
            }

            ChatResponse response = chatService.sendMessage(request);
            log.info("메세지 처리 완료 - 대화방 ID :{}", response.getConversationId());

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            log.error("메세지 전송중 오류 발생", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    /**
     * 사용자의 모든 대화방 기록 조회
     * GET /api/chat/conversations/1
     */
    @GetMapping("/conversations/{userId}")
    public ResponseEntity<List<ChatConversation>> getConversations(@PathVariable String userId) {
        try {
            log.info("사용자 대화 목록 조회 요청 - 사용자 ID: {}", userId);
            List<ChatConversation> conversations = chatService.getUserConversations(userId);
            log.info("사용자 대화 목록 조회 완료 - 대화 수 :{}", conversations.size());
            return ResponseEntity.ok(conversations);
        } catch (Exception e) {
            log.error("사용자 대화 목록 조회 중 오류 발생", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    /**
     * 대화방 기록 메세지 조회
     * GET /api/chat/conversations/1
     */
    @GetMapping("/conversations/{conversationId}")
    public ResponseEntity<List<ChatMessage>> getConversations(@PathVariable Long conversationId) {
        try {
            log.info("대화방 기록 메세지 조회요청 - 사용자 ID: {}", conversationId);
            List<ChatMessage> messages = chatService.getConversationHistory(conversationId);

            if (messages == null || messages.isEmpty()) {
                log.info("대화 기록이 없습니다. - 대화방 ID : {}",conversationId);
            }
            return ResponseEntity.ok(messages);
        } catch (Exception e) {
            log.error("대화방 기록 메세지 조회 중 오류 발생", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

}
