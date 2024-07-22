package com.xxx.service;

import com.xxx.pojo.Admin;
import com.xxx.pojo.User;

public interface UserService {
    Admin getAdminByName(String name);
    User getUserByName(String name);

    void insertUser(User user);
}
