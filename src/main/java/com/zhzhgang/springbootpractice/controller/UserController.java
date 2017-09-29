package com.zhzhgang.springbootpractice.controller;

import com.zhzhgang.springbootpractice.VO.HttpResultVo;
import com.zhzhgang.springbootpractice.domain.User;
import com.zhzhgang.springbootpractice.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by zhangzhonggang
 * 2017-09-28 17:47
 */
@RestController
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping(value = "/practice/user", method = RequestMethod.POST)
    public HttpResultVo<Map<String, String>> createUser(@RequestBody User user) {
        String result = String.valueOf(userService.saveUser(user));

        Map map = new HashMap<String, String>();
        map.put("userId", result);

        HttpResultVo httpResultVo = new HttpResultVo();
        httpResultVo.setCode(0);
        httpResultVo.setMsg("成功");
        httpResultVo.setData(map);

        return httpResultVo;
    }

}
