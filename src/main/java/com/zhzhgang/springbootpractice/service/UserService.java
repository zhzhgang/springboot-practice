package com.zhzhgang.springbootpractice.service;

import com.zhzhgang.springbootpractice.domain.User;

import java.util.List;

/**
 * Created by zhangzhonggang
 * 2017-09-28 19:51
 */
public interface UserService {

    /**
     * 根据用户名，查询用户信息。
     * @param username
     * @return
     */
    List<User> findUserByUsername(String username);

    Long saveUser(User user);
}
