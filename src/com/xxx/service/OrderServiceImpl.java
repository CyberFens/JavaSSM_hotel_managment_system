package com.xxx.service;

import com.xxx.dao.OrderDao;
import com.xxx.pojo.Hotel;
import com.xxx.pojo.Order;
import com.xxx.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

    @Override
    public List<Order> list(int pageNum, int pageSize, Integer userId) {
        int offset = (pageNum - 1) * pageSize;
        return orderDao.list(offset, pageSize,userId);
    }

    @Override
    public void insert(Hotel hotel, User user) {
        Order order = new Order();
        order.setUserid(user.getId());
        order.setHotelid(hotel.getHotelid());
        order.setHotelname(hotel.getHotelname());
        order.setAmount(hotel.getPrice());
        order.setQty(1);
        order.setPrice(hotel.getPrice());
        orderDao.insert(order);
    }

    @Override
    public Integer getTotalOrderCount(Integer userId) {
        return orderDao.count(userId);
    }
}
