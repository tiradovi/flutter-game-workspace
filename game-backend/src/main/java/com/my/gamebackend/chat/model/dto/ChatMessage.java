package com.my.gamebackend.chat.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 채팅 메세지를 하나하나 담은 객체
 * 대화 기록 조회, 메세지 저장
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatMessage {
    private  Long id;
    private  Long conversationId; // 어느 대화방의 메세지인가
    private  String message;    // 메세지 내용
    private  Boolean isUserMessage; // 사용자 메세지(true), 봇 메세지(false)
    private LocalDateTime createdAt; // 메세지 전송 시간
}
