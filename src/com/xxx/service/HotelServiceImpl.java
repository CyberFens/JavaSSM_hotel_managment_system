package com.xxx.service;

import com.xxx.dao.HotelDao;
import com.xxx.pojo.Hotel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HotelServiceImpl implements HotelService {
    @Autowired
    private HotelDao hotelDao;

    @Override
    public List<Hotel> findAllHotel(int pageNum, int pageSize, String hotelid){
        int offset = (pageNum - 1) * pageSize;
        return hotelDao.findAllHotel(offset, pageSize, hotelid);
    }

    @Override
    public Hotel findOneHotel(int hid) {
        return hotelDao.findOneHotel(hid);
    }

    @Override
    public void insertHotel(Hotel hotel) {
        hotelDao.insertHotel(hotel);
    }

    @Override
    public void updateHotel(Hotel hotel) {
        hotelDao.updateHotel(hotel);
    }

    @Override
    public void deleteHotel(int hid) {
        hotelDao.deleteHotel(hid);
    }

    @Override
    public int getTotalHotelCount(String hotelid) {
        return hotelDao.getCount(hotelid);
    }

}
