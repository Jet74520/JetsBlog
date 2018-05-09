package com.jetsblog.user.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jetsblog.user.dao.User;


//持久层包括数据库表映射的User.java的JavaBean对象，并使用了MyBatis的注解映射了对应的SQL语句

public interface UserMapper {
    @Select("select * from tbl_blog_user where loginname=#{loginname} and password=#{password}")
    User findWithLoginAndPassword(@Param("loginname")String loginname,@Param("password")String password);

}
