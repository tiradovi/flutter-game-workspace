package com.my.gamebackend.common.aop;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Arrays;

@Component
@Aspect
@Slf4j
public class LoggingAspect {

    @Before("PointcutBundle.controllerPointCut()")
    public void beforeController(JoinPoint jp) {
        String className = jp.getTarget().getClass().getSimpleName();
        String methodName = jp.getSignature().getName() + "()";
        HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        String ip = getRemoteAddr(req);
        StringBuilder sb = new StringBuilder();
        sb.append(String.format("[%s.%s] 요청 / ip : %s", className, methodName, ip));


        log.info(sb.toString());
    }

    @Around("PointcutBundle.serviceImplPointCut()")
    public Object aroundServiceImpl(ProceedingJoinPoint pjp) throws Throwable {
        String className = pjp.getTarget().getClass().getSimpleName();
        String methodName = pjp.getSignature().getName() + "()";
        log.info("========== {}.{} 서비스 호출 ==========", className, methodName);
        log.info("Parameter : {}", Arrays.toString(pjp.getArgs()));
        long startMs = System.currentTimeMillis();
        Object obj = pjp.proceed();
        long endMs = System.currentTimeMillis();
        log.info("Running Time : {}ms", endMs - startMs);
        log.info("===================================================================================");
        return obj;
    }



    @AfterThrowing(pointcut = "@annotation(org.springframework.transaction.annotation.Transactional)",
            throwing = "ex")
    public void transactionRollback(JoinPoint jp, Throwable ex) {
        log.info("***** 트랜잭션이 롤백됨 {} *****", jp.getSignature().getName());
        log.error("[롤백 원인] : {}", ex.getMessage());
    }


    private String getRemoteAddr(HttpServletRequest request) {
        String ip = null;
        ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Real-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-RealIP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("REMOTE_ADDR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
}
