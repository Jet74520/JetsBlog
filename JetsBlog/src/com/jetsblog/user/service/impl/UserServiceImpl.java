package com.jetsblog.user.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jetsblog.user.dao.User;
import com.jetsblog.user.mapper.UserMapper;
import com.jetsblog.user.service.UserService;
@Service("userService")

public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String loginname, String password) {
        // TODO Auto-generated method stub
        return userMapper.findWithLoginAndPassword(loginname, password);
    }

}
