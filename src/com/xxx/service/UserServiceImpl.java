package com.xxx.service;

import com.xxx.dao.AdminDao;
import com.xxx.dao.UsersDao;
import com.xxx.pojo.Admin;
import com.xxx.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private AdminDao adminDao;
    @Autowired
    private UsersDao usersDao;

    @Override
    public Admin getAdminByName(String name) {
        return adminDao.getByName(name);
    }

    @Override
    public User getUserByName(String name) {
        return usersDao.getByName(name);
    }

    @Override
    public void insertUser(User user) {
        usersDao.insertUser(user);
    }
}
