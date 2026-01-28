package com.my.gamebackend.user.model.mapper;

import com.my.gamebackend.user.model.dto.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    User findByUserId(String userId);
    List<User> findAllUsers();
    int updateProfileImage(String userId, String profileImageUrl);
    int insertUser(User user);
}
