package com.xxx.dao;

import com.xxx.pojo.Admin;
import com.xxx.pojo.Hotel;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminDao {
    Admin getByName(@Param("adminName") String adminName);
}
