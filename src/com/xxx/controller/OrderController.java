package com.xxx.controller;

import com.xxx.pojo.Hotel;
import com.xxx.pojo.Order;
import com.xxx.pojo.User;
import com.xxx.service.HotelService;
import com.xxx.service.OrderService;
import com.xxx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    private UserService userService;
    @Autowired
    private HotelService hotelService;
    @Autowired
    private OrderService orderService;

    @RequestMapping("/orderList")
    public String order(HttpServletRequest request
            , @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum
            , Model model) {

        Object loginAdmin = request.getSession().getAttribute("LoginAdmin");
        if (loginAdmin == null) {
            return "redirect:/userlogin";
        }
        int pageSize = 5;
        List<Order> orderList = orderService.list(pageNum, pageSize,null);
        model.addAttribute("orderList", orderList);

        int totalCount = orderService.getTotalOrderCount(null);
//        调用 orderService 的 getTotalOrderCount 方法获取订单总数。
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
//        计算总页数，使用 Math.ceil 向上取整。
        int visiblePages = 10;
        int startPage = Math.max(1, pageNum - (visiblePages / 2));
        int endPage = Math.min(totalPages, startPage + visiblePages - 1);
        if (endPage - startPage + 1 < visiblePages) {
            startPage = Math.max(1, endPage - visiblePages + 1);
        }

        // 将分页信息添加到模型中
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);

        model.addAttribute("currentPage", pageNum);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalCount", totalCount);
        return "orderall";
    }

    @RequestMapping("/orderHotel")
    public String orderHotel(HttpServletRequest request, Integer id,
                             @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, Model model) {

        Object loginUser = request.getSession().getAttribute("LoginUser");
        if (loginUser == null) {
            return "redirect:/userlogin";
        }
        Hotel oneHotel = hotelService.findOneHotel(id);

        orderService.insert(oneHotel, (User)loginUser);
        model.addAttribute("message", "预定成功!");
        return "order_success";
    }
}
