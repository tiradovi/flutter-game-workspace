package com.my.gamebackend.user.model.service;

import com.my.gamebackend.user.model.dto.User;

import java.util.List;

public interface UserService {

    User getUserById(String userId);
    List<User> getAllUsers();
    boolean updateProfileImage(String userId, String profileImageUrl);
    boolean createUser(User user);

}
