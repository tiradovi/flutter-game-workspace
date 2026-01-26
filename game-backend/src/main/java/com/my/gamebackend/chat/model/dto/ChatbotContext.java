package com.my.gamebackend.chat.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 기존 사용자와 이전 대화 내용을 기억해서 문맥에 맞는 응답 제공
 * - 대화의 흐름을 기억
 * - 사용자 정보 임시 저장
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatbotContext {
    private Long id;
    private Long conversationId; // 어느 대화방의 맥락인지
    private String contextKey; // 맥락 키 "last_topic" "user_name"
    private String contextValue; // 맥락 값 "greeting" "홍길동"
    private LocalDateTime expiresAt; // 만료 시간 (시간 지나면 자동 삭제)
    private LocalDateTime createdAt; // 생성 시간
}

/*
예상 흐름
유저 A
대화 1:
User : "상담사 호출"
Bot : "안녕하세요! 무엇을 도와드릴까요?"
-> contextKey : "last_topic", contextValue : "greeting" 저장

대화 2:
User : "오늘 날씨 좋다면서 어떻게 생각해?"
Bot : "네 오늘 날씨는..."

Context 확인 : "이전대화가 존재하는가, 어떻게 진행되었는가?"
Intent 검색 : "키워드 파악"
자연스러운 응답 유도
 */