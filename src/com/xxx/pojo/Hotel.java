package com.xxx.pojo;

import java.sql.Date;


public class Hotel {
    private int hotelid;
    private String hotelname;
    private String introduction;
    private int price;
    private String image;
    private Date ordertime;

    public int getHotelid() {
        return hotelid;
    }

    public void setHotelid(int hotelid) {
        this.hotelid = hotelid;
    }

    public String getHotelname() {
        return hotelname;
    }

    public void setHotelname(String hotelname) {
        this.hotelname = hotelname;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Hotel{" +
                "hotelid=" + hotelid +
                ", hotelname='" + hotelname + '\'' +
                ", introduction='" + introduction + '\'' +
                ", price=" + price +
                ", image='" + image + '\'' +
                ", ordertime=" + ordertime +
                '}';
    }
}
