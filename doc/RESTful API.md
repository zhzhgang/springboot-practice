# Restful API

### 根据用户名查找用户

```
GET /practice/user/{username}
```

参数

```
无
```

返回


```
{
    "code": 0,
    "msg": "成功",
    "data": [
        {
            "id": 1,
            "username": "zhangsan",
            "password": "123",
            "name": "张三",
            "status": "a",
            "cdate": "system",
            "edate": "system",
            "creator": "2017-03-30 20:42:10",
            "editor": "2017-03-30 20:42:10"
        },
        {
            "id": 2,
            "username": "lisi",
            "password": "123",
            "name": "李四",
            "status": "a",
            "cdate": "system",
            "edate": "system",
            "creator": "2017-03-30 20:42:10",
            "editor": "2017-03-30 20:42:10"
        }
    ]
}
```