package com.xxx.controller;

import com.xxx.pojo.Hotel;
import com.xxx.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class IndexController {
    @Autowired
    private HotelService hotelService;

    @RequestMapping("/list")
    public String order(@RequestParam(value = "hotelid", defaultValue = "") String hotelid,
                        @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                        Model model) {

        // 定义每页显示的记录数
        int pageSize = 5;

        // 调用服务层方法获取当前页的酒店列表
        List<Hotel> allHotel = hotelService.findAllHotel(pageNum, pageSize, hotelid);
        model.addAttribute("allHotels", allHotel);

        // 获取符合条件的酒店总数，并计算总页数
        int totalCount = hotelService.getTotalHotelCount(hotelid);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);

        // 定义可见页码的数量
        int visiblePages = 10;

        // 计算可见页码的起始页
        int startPage = Math.max(1, pageNum - (visiblePages / 2));

        // 计算可见页码的结束页
        int endPage = Math.min(totalPages, startPage + visiblePages - 1);

        // 如果可见页码范围不足，调整起始页以确保可见页码数量
        if (endPage - startPage + 1 < visiblePages) {
            startPage = Math.max(1, endPage - visiblePages + 1);
        }

        // 将分页信息添加到模型中，以便在视图中使用
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("currentPage", pageNum);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalCount", totalCount);

        // 返回视图名称，渲染酒店列表页面
        return "list";
    }


}
