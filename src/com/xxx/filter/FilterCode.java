package com.xxx.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//1.实现javax.servlet.Filter接口
//2、实现接口的三个方法
//3.在doFilter方法中写代码实现拦截处理
//4.实现拦截器的配置或部署
@WebFilter("/*")
public class FilterCode implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req =(HttpServletRequest) servletRequest;
        HttpServletResponse resp =(HttpServletResponse) servletResponse;
        //解决请求的中文乱码问题
        req.setCharacterEncoding("utf-8");
        //解决响应中的中文乱码问题
        resp.setContentType("text/html;charset=utf-8");
        //放行
        filterChain.doFilter(req,resp);
    }
}
