package com.zhzhgang.springbootpractice.service.impl;


import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * Created by zhangzhonggang
 * 2017-09-28 19:55
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class UserServiceImplTest {

    @Autowired
    private UserServiceImpl userService;

    @Test
    public void findUserByUsername() throws Exception {
        Assert.assertEquals(2, userService.findUserByUsername("zhangsan").size());
    }

}