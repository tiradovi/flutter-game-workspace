package com.my.gamebackend.chat.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 사용자의 의도 분류
 *
 * 사용자의 의도를 파악하고 다양한 응답 제공
 * pattern 에서 사용자 메세지와 매칭
 * responses 중 랜덤으로 하나 선택(자연스러운 대화)
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatbotIntent {
    private  Long id; //고유 Id
    private String intentName; // 인텐트 이름
    private String description;
    private String[] patterns;
    private String[] responses;
    private Boolean isActive;
    private LocalDateTime createdAt;
}
/*
예상 흐름
intentName : greeting
patterns : ["안녕","안녕하세요","hi", "hello"]
response : ["안녕하세요", "반갑습니다","안녕하세요. 무엇을 도와드릴까요?"]
-> 같은 패턴에서 매번 다른 응답으로 자연스러움 더하기
 */
