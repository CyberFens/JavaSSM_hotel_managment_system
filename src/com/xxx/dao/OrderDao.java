package com.xxx.dao;

import com.xxx.pojo.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OrderDao {
    List<Order> list(@Param("offset") int offset, @Param("limit") int limit,@Param("userId") Integer userId);
    Integer count(@Param("userId") Integer userId);
    void insert(Order user);
}
