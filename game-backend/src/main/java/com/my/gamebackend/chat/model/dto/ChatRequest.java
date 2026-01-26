package com.my.gamebackend.chat.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatRequest {
    private  String userId; // 요청한 사용자 ID
    private  Long conversationId; // 기존 대화방 ID
    private  String message;    // 사용자가 보낸 메세지

}
