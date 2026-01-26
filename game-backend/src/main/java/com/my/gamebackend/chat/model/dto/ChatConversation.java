package com.my.gamebackend.chat.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatConversation {
    private Long id;  // 대화방 ID
    private  String userId; // 사용자 ID
    private LocalDateTime createdAt; // 대화방 생성시간
    private LocalDateTime updatedAt; // 대화방 마지막 업데이트 시간
}
