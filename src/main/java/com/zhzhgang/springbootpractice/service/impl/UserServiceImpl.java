package com.zhzhgang.springbootpractice.service.impl;

import com.zhzhgang.springbootpractice.dao.UserDao;
import com.zhzhgang.springbootpractice.domain.User;
import com.zhzhgang.springbootpractice.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by zhangzhonggang
 * 2017-09-28 19:54
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;
    /**
     * 根据用户名，查询用户信息。
     *
     * @param username
     * @return
     */
    @Override
    public List<User> findUserByUsername(String username) {
        return userDao.findUserByUsername(username);
    }

    @Override
    public Long saveUser(User user) {
        return userDao.saveUser(user);
    }
}
