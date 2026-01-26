package com.my.gamebackend.common.aop;

import org.aspectj.lang.annotation.Pointcut;

public class PointcutBundle {

    @Pointcut("execution(* com.my.todo..*Controller*.*(..))")
    public void controllerPointCut(){}

    @Pointcut("execution(* com.my.todo..*ServiceImpl*.*(..))")
    public void serviceImplPointCut(){}
}

