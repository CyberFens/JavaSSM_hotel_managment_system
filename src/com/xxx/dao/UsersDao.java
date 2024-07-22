package com.xxx.dao;

import com.xxx.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UsersDao {
    User getByName(@Param("name") String name);
    void insertUser(User user);
}
