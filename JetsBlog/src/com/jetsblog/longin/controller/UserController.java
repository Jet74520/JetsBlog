package com.jetsblog.longin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.jetsblog.user.dao.User;
import com.jetsblog.user.service.UserService;

@Controller
public class UserController {
    @Autowired
    @Qualifier("userService")
    private UserService userService;
    /**
     * 处理/login请求
     */
    @RequestMapping(value="/login")
    public ModelAndView login(String loginname,String password,ModelAndView mv,HttpSession session){
        User user=userService.login(loginname, password);
        if(user!=null){
            //登录成功，将user对象设置到HttpSession作用范围域中
            session.setAttribute("user", user);
            //转发到main请求
            mv.setView(new RedirectView("index"));
        }else {
            //登录失败，设置失败信息，并调转到登录页面
            
            mv.addObject("message","登录名和密码错误，请重新输入");
            mv.setViewName("login");
        }
        return mv;
    }
}
