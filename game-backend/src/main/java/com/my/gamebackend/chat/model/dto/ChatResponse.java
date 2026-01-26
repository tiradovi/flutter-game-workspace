package com.my.gamebackend.chat.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatResponse {
    private  Long conversationId; // 대화방 ID(새로 생성된 경우 포함)
    private  String message;    // 챗봇의 응답 메세지
    private LocalDateTime timestamp; // 응답 시간
}
