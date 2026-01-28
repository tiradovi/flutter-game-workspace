package com.my.gamebackend.user.controller;

import com.my.gamebackend.user.model.dto.User;
import com.my.gamebackend.user.model.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    /**
     * 모든 사용자 조회
     *
     * @return 서비스에서 작업한 결과를 반환하고, 반환된 결과 상태를 프론트로 전달
     */
    @GetMapping
    public ResponseEntity<List<User>> getAllUsers() {
        log.info("전체 사용자 목록 조회");
        List<User> users = userService.getAllUsers();
        return ResponseEntity.ok(users);
    }

    /**
     * 특정 사용자 조회
     * @param userId 사용자 ID
     * @return 사용자 객체
     */
    @GetMapping("/{userId}")
    public ResponseEntity<User> getUserById(@PathVariable String userId) {
        log.info("사용자 조회 :{}", userId);
        User user = userService.getUserById(userId);
        if (user == null) {
            log.warn("사용자 찾을 수 없음");
            return ResponseEntity.notFound().build();
        }
        log.info("조회성공 {}", user.getUserName());
        return ResponseEntity.ok(user);
    }
}
