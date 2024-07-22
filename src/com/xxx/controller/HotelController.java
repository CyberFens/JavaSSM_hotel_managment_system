package com.xxx.controller;

import com.xxx.pojo.Hotel;
import com.xxx.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

@Controller
public class HotelController {
    @Autowired
    private ServletContext servletContext;
    @Autowired
    private HotelService   hotelService;

    @RequestMapping(value = "/findAllHotel")
    public ModelAndView FindAllHotel(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum
            ,@RequestParam(value = "hotelid",defaultValue = "") String hotelid) {

        int pageSize = 5;
        List<Hotel> allHotel = hotelService.findAllHotel(pageNum, pageSize, hotelid);

        ModelAndView model = new ModelAndView("findall");
        model.addObject("message", "新增信息失败!");

        model.addObject("allHotels", allHotel);
        //model.addAttribute("pageInfo", page);

        int totalCount = hotelService.getTotalHotelCount(hotelid);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        int visiblePages = 5; // 假设一次显示5个页码
        int startPage = Math.max(1, pageNum - (visiblePages / 2));
        int endPage = Math.min(totalPages, startPage + visiblePages - 1);
        if (endPage - startPage + 1 < visiblePages) {
            startPage = Math.max(1, endPage - visiblePages + 1);
        }

        // 将分页信息添加到模型中
        model.addObject("startPage", startPage);
        model.addObject("endPage", endPage);

        model.addObject("currentPage", pageNum);
        model.addObject("pageSize", pageSize);
        model.addObject("totalPages", totalPages);
        model.addObject("totalCount", totalCount);
        return model;
    }

    @RequestMapping(value = "findOneHotel")
    public String findOneHotel(Integer id, Model model) {
        Hotel oneHotel = hotelService.findOneHotel(id);
        model.addAttribute("hotel", oneHotel);
        return "update";
    }

    @RequestMapping(value = "updateHotel")
    public ModelAndView updateHotel(Hotel hotel,@RequestParam("imageFile") MultipartFile file) {
        if (!file.isEmpty()) {
            try {
                String fileName = (new Date()).getTime() + "_" + file.getOriginalFilename();
//                生成唯一文件名
                String uploadDirectory = servletContext.getRealPath("") + File.separator + "images";
//                确定上传目录
                File uploadFile = new File(uploadDirectory + File.separator + fileName);
                if (!uploadFile.getParentFile().exists()) {
                    uploadFile.getParentFile().mkdirs();
                }
//                检查父目录是否存在，如果不存在，则创建该目录。
                Path filePath = Paths.get(uploadFile.getPath());
                Files.write(filePath, file.getBytes());
                hotel.setImage(fileName);
                hotelService.updateHotel(hotel);
                return new ModelAndView("redirect:/findAllHotel");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        // 文件上传失败，返回错误视图
        ModelAndView modelAndView = new ModelAndView("findall");
        modelAndView.addObject("message", "新增信息失败!");
        return modelAndView;
    }

    @RequestMapping(value = "addHotel")
    public String add(Model model) {
        return "add";
    }

    @PostMapping(value = "saveHotel")
    public ModelAndView insertHotel(Hotel hotel, @RequestParam("imageFile") MultipartFile file) {
        if (!file.isEmpty()) {
            try {
                String fileName = (new Date()).getTime() + "_" + file.getOriginalFilename();
                String uploadDirectory = servletContext.getRealPath("") + File.separator + "images";
                File uploadFile = new File(uploadDirectory + File.separator + fileName);
                if (!uploadFile.getParentFile().exists()) {
                    uploadFile.getParentFile().mkdirs();
                }
                Path filePath = Paths.get(uploadFile.getPath());
                Files.write(filePath, file.getBytes());
                hotel.setImage(fileName);
                hotelService.insertHotel(hotel);
                return new ModelAndView("redirect:/findAllHotel");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        // 文件上传失败，返回错误视图
        ModelAndView modelAndView = new ModelAndView("findall");
        modelAndView.addObject("message", "新增信息失败!");
        return modelAndView;
    }

    @RequestMapping(value = "deleteHotel")
    public String deleteHotel(int id) {
        try {
            hotelService.deleteHotel(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:findAllHotel";
    }

}
