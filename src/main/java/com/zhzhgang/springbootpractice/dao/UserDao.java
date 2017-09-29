package com.zhzhgang.springbootpractice.dao;

import com.zhzhgang.springbootpractice.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by zhangzhonggang
 * 2017-09-28 18:06
 */
public interface UserDao {

    /**
     * 根据用户名，查询用户信息。
     * @param username
     * @return
     */
    List<User> findUserByUsername(@Param("username") String username);

    /**
     * 保存用户
     * @param user
     */
    Long saveUser(User user);
}
