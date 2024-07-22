package com.xxx.service;

import com.xxx.pojo.Hotel;

import java.util.List;

public interface HotelService {
    List<Hotel> findAllHotel(int pageNum, int pageSize, String hotelid);

    Hotel findOneHotel(int id);

    void insertHotel(Hotel Hotel);

    void updateHotel(Hotel Hotel);

    void deleteHotel(int hid);

    int getTotalHotelCount(String hotelid);
}
