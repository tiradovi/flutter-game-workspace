package com.my.gamebackend.chat.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 챗봇 지식 FAQ 데이터
 * 사용자가 안녕이라고 했을 때 keywords 내에서 검색
 * 매칭되면 answer 를 응답으로 반환 priority가 높은 것을 우선 선택
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatbotKnowledge {
    /*
    Long, Integer = 클래스 형태로 숫자 데이터를 받지 못하면 null 형태로 전달 받는다.
    int = 기본 예약어 형태로 숫자 데이터를 받지 못하면 null을 구분하지 못하여 0으로 받음
    id가 0일 때 0번째 존재하는 데이터인지, 오류인지 알 수 없음

    Primary Key(id) Long
    우선순위 Integer
    카운터, 반복문 int
    나이, 수량 Integer
     */

    private Long id; // 지식 고유 Id
    private String category; // 카테고리(인사, 날씨, 시간)
    private String[] keywords; // 키워드 배열 ["안녕", "하이", "헬로"]
    private String question; // 질문 안녕하세요와 같은 응답 잠시 보유
    private String answer; // 답변 안녕하세요와 같은 응답 잠시 보유
    private Integer priority; // 우선순위
    private Boolean isActive; // 활성화 여부
    private LocalDateTime createdAt; // 생성 시간
    private LocalDateTime updatedAt; // 수정 시간

}
/*
예상 흐름
category : 인사
keywords : ["안녕","하이", "헬로","ㅎㅇ", "gm"]
question : "안녕하지 않아"
answer : "안녕하세요! 무엇을 도와드릴까요?"
priority : 10
 */