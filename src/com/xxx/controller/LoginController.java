package com.xxx.controller;

import com.xxx.pojo.Admin;
import com.xxx.pojo.User;
import com.xxx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;


    @RequestMapping("index")
    public String t() {
        return "/index";
    }

    @RequestMapping("userlogin")
    public String userlogin() {
        return "userlogin";
    }

    @RequestMapping("userLogout")
    public String userLogout(HttpServletRequest request) {
        request.getSession().removeAttribute("LoginUser");
        return "redirect:/userlogin";
    }

    /**
     * user登录提交
     * @param userName
     * @param password
     * @return
     */
    @PostMapping("/userlogin")
    public String userLogin(@RequestParam(value = "username") String userName,
                            @RequestParam(value = "userpassword") String password, HttpServletRequest request) {
        if (StringUtils.isEmpty(userName) || StringUtils.isEmpty(password)) {
            request.setAttribute("message", "账号或者密码错误!");
            return "userlogin";
        }
        User user = userService.getUserByName(userName);
//        调用 userService 的方法 getUserByName，根据用户名从数据库中获取用户信息。
        if (user == null || !user.getUpwd().equals(password)) {
            request.setAttribute("message", "账号或者密码错误!");
            return "userlogin";
        }
        request.getSession().setAttribute("LoginUser",user);
        //创建一个新的会话对象
        request.setAttribute("message", "登录成功!");
        //在当前请求中设置一个名为 "message" 的属性，其值为 "登录成功!"。
        return "index";
    }


    @RequestMapping("adminlogin")
    public String admin() {
        return "/adminlogin";
    }

    @PostMapping("/adminLogin") //用于简化只处理POST请求的方法映射
    public ModelAndView adminLogin(@RequestParam(value = "username") String userName,
                                   @RequestParam(value = "userpassword") String password, HttpServletRequest request) {
        ModelAndView modelAndView = null;
        if (StringUtils.isEmpty(userName) || StringUtils.isEmpty(password)) {
            modelAndView = new ModelAndView("adminlogin");
            modelAndView.addObject("message", "账号或者密码错误!");
            return modelAndView;
        }
        Admin admin = userService.getAdminByName(userName);
        if (admin == null || !admin.getAdmin_pwd().equals(password)) {
            modelAndView = new ModelAndView("adminlogin");
            modelAndView.addObject("message", "账号或者密码错误!");
            return modelAndView;
        }
        request.getSession().setAttribute("LoginAdmin", admin);
        modelAndView = new ModelAndView("redirect:findAllHotel");
        modelAndView.addObject("message", "登录成功!");
        return modelAndView;
    }

    @RequestMapping("register")
    public String register() {
        return "register";
    }

    @PostMapping("register")
    public ModelAndView register(com.xxx.pojo.User user) {
        System.out.println(user.toString());
        userService.insertUser(user);
        ModelAndView modelAndView = null;
        modelAndView = new ModelAndView("register");
        modelAndView.addObject("message", "注册成功!");
        return modelAndView;
    }

}
