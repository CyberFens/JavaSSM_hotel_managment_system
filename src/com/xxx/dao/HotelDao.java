package com.xxx.dao;
import com.xxx.pojo.Hotel;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface HotelDao {
    List<Hotel> findAllHotel(@Param("offset") int offset, @Param("limit") int limit, @Param("hotelid") String hotelid);

    Hotel findOneHotel(int id);

    void insertHotel(Hotel hotel);

    void updateHotel(Hotel hotel);

    void deleteHotel(int hid);

    int getCount(@Param("hotelid") String hotelid);
}
