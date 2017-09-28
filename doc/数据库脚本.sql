-- 创建数据库 springboot_practice
CREATE DATABASE springboot_practice;

-- 用户表 user
DROP TABLE IF EXISTS `user`;
CREATE TABLE `springboot_practice`.`user` (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` VARCHAR(32) NOT NULL COMMENT '用户名',
  `password` VARCHAR(32) NOT NULL COMMENT '密码',
  `name` VARCHAR(32) DEFAULT NULL COMMENT '真实姓名',
  `status` CHAR(1) NOT NULL DEFAULT 'a' COMMENT '状态',
  `cdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `edate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `editor` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '修改者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户表';

INSERT INTO `user`(`username`,`password`,`name`) VALUES ('zhangsan','123','张三');
INSERT INTO `user`(`username`,`password`,`name`) VALUES ('zhangsan','123','张三');
INSERT INTO `user`(`username`,`password`,`name`) VALUES ('lisi','123','李四');
INSERT INTO `user`(`username`,`password`,`name`) VALUES ('wangwu','123','王五');


-- 角色表 role
DROP TABLE IF EXISTS `role`;
CREATE TABLE `springboot_practice`.`role` (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` VARCHAR(32) NOT NULL COMMENT '角色名称',
  `description` VARCHAR(32) DEFAULT NULL COMMENT '角色描述',
  `status` CHAR(1) NOT NULL DEFAULT 'a' COMMENT '状态',
  `cdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `edate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `editor` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '修改者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- 资源表 resource
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `springboot_practice`.`resource` (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` VARCHAR(16) NOT NULL COMMENT '资源类型【MENU：菜单，ELEMENT：页面元素】',
  `code` VARCHAR(16) NOT NULL COMMENT '资源编号，按000,001,002编号',
  `name` VARCHAR(32) NOT NULL COMMENT '资源名称',
  `url` VARCHAR(64) NOT NULL COMMENT '资源定位',
  `parent_id` BIGINT(10) DEFAULT NULL COMMENT '父节点ID，一级节点为空',
  `status` CHAR(1) NOT NULL DEFAULT 'a' COMMENT '状态',
  `cdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `edate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `editor` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '修改者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- 用户角色表 user_role
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `springboot_practice`.`user_role` (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `id_user` BIGINT(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `id_role` BIGINT(10) UNSIGNED NOT NULL COMMENT '角色ID',
  `status` CHAR(1) NOT NULL DEFAULT 'a' COMMENT '状态',
  `cdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `edate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `editor` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '修改者',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `springboot_practice`.`user` (`id`),
  CONSTRAINT `fk_role` FOREIGN KEY (`id_role`) REFERENCES `springboot_practice`.`role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户角色表';


-- 角色资源表 role_resource
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `springboot_practice`.`role_resource` (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `id_role` BIGINT(10) UNSIGNED NOT NULL COMMENT '角色ID',
  `id_resource` BIGINT(10) UNSIGNED NOT NULL COMMENT '资源ID',
  `status` CHAR(1) NOT NULL DEFAULT 'a' COMMENT '状态',
  `cdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `edate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `editor` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '修改者',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_role` FOREIGN KEY (`id_role`) REFERENCES `springboot_practice`.`role` (`id`),
  CONSTRAINT `fk_resource` FOREIGN KEY (`id_resource`) REFERENCES `springboot_practice`.`resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='角色资源表';