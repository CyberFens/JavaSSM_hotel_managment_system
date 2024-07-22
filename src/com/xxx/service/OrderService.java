package com.xxx.service;

import com.xxx.pojo.Hotel;
import com.xxx.pojo.Order;
import com.xxx.pojo.User;

import java.util.List;

public interface OrderService {
    List<Order> list(int pageNum, int pageSize, Integer userId);
    Integer getTotalOrderCount(Integer userId);
    void insert(Hotel hotel, User user);
}
