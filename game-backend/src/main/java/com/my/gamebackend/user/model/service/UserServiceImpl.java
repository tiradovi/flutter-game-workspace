package com.my.gamebackend.user.model.service;

import com.my.gamebackend.user.model.dto.User;
import com.my.gamebackend.user.model.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
    private final UserMapper userMapper;

    /**
     * 사용자 ID로 조회
     *
     * @param userId 매개변수로 선택한 유저의 아이디를 가져와서
     * @return 해당 유저아이디가 DB에 존재하면 데이터 전달
     */
    @Override
    public User getUserById(String userId) {
        log.info("사용자조회: {}", userId);
        return userMapper.findByUserId(userId);
    }

    /**
     * 모든 사용자 조회
     * 클라이언트가 모든 유저 정보 조회를 UI에서 요청하고
     *
     * @return 결과 전달
     */
    @Override
    public List<User> getAllUsers() {
        log.info("모든 사용자조회");
        return userMapper.findAllUsers();
    }

    /**
     * 프로필 이미지 업데이트
     *
     * @param userId          사용자 ID
     * @param profileImageUrl 이미지 URL
     * @return 결과 유무
     */
    @Override
    public boolean updateProfileImage(String userId, String profileImageUrl) {
        log.info("프로필 이미지 업데이트 -사용자: {}, URL:{}", userId, profileImageUrl);
        int result = userMapper.updateProfileImage(userId, profileImageUrl);

        return result > 0;
    }

    /**
     * 새 사용자 추가
     *
     * @param user Flutter 에서 유저가 작성한 유저 정보 받아오고
     * @return 저장 결과 유무를 전달
     */
    @Override
    public boolean createUser(User user) {
        log.info("사용자 생성 -사용자: {}", user);
        int result = userMapper.insertUser(user);
        return result > 0;
    }
}
