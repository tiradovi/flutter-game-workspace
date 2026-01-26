package com.my.gamebackend.common.aop;

import org.aspectj.lang.annotation.Pointcut;
/*
    id 'org.springframework.boot' version '3.2.1'  모듈 문제 없는 경우 버전 확인 필요 최신 버전은 지원안하는 경우 존재
    따라서 대중화된 버전 사용 필요
 */
public class PointcutBundle {

    @Pointcut("execution(* com.my.gamebackend..*Controller*.*(..))")
    public void controllerPointCut(){}

    @Pointcut("execution(* com.my.gamebackend..*ServiceImpl*.*(..))")
    public void serviceImplPointCut(){}
}

