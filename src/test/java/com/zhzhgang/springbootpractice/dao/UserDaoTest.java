package com.zhzhgang.springbootpractice.dao;

import com.zhzhgang.springbootpractice.domain.User;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * Created by zhangzhonggang
 * 2017-09-28 18:31
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class UserDaoTest {

    @Autowired
    private UserDao userDao;

    @Before
    public void setUp() throws Exception {
    }

    @Test
    public void findUserByUsername() throws Exception {
        List<User> userList = userDao.findUserByUsername("zhangsan");
        Assert.assertEquals(1, userList.size());
    }

    @Test
    public void saveUser() throws Exception {
        User user = new User();
        user.setUsername("sunqi");
        user.setPassword("123");
        user.setName("孙七");
        Long result = userDao.saveUser(user);
        Assert.assertNotNull(result);
    }
}