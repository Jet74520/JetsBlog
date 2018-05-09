package com.jetsblog.user.service;

import com.jetsblog.user.dao.User;

public interface UserService {
    
    /**
     * 判断用户登录
     * @param String loginname
     * @param String password
     * @return 找到返回User对象，没有找到返回null
     * */
    User login(String loginname,String password);

}