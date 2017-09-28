-- �������ݿ� springboot_practice
CREATE DATABASE springboot_practice;

-- �û��� user
DROP TABLE IF EXISTS `user`;
CREATE TABLE `springboot_practice`.`user` (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '����',
  `username` VARCHAR(32) NOT NULL COMMENT '�û���',
  `password` VARCHAR(32) NOT NULL COMMENT '����',
  `name` VARCHAR(32) DEFAULT NULL COMMENT '��ʵ����',
  `status` CHAR(1) NOT NULL DEFAULT 'a' COMMENT '״̬',
  `cdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `edate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `creator` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '������',
  `editor` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '�޸���',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='�û���';

INSERT INTO `user`(`username`,`password`,`name`) VALUES ('zhangsan','123','����');
INSERT INTO `user`(`username`,`password`,`name`) VALUES ('zhangsan','123','����');
INSERT INTO `user`(`username`,`password`,`name`) VALUES ('lisi','123','����');
INSERT INTO `user`(`username`,`password`,`name`) VALUES ('wangwu','123','����');


-- ��ɫ�� role
DROP TABLE IF EXISTS `role`;
CREATE TABLE `springboot_practice`.`role` (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '����',
  `name` VARCHAR(32) NOT NULL COMMENT '��ɫ����',
  `description` VARCHAR(32) DEFAULT NULL COMMENT '��ɫ����',
  `status` CHAR(1) NOT NULL DEFAULT 'a' COMMENT '״̬',
  `cdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `edate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `creator` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '������',
  `editor` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '�޸���',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='��ɫ��';

-- ��Դ�� resource
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `springboot_practice`.`resource` (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '����',
  `type` VARCHAR(16) NOT NULL COMMENT '��Դ���͡�MENU���˵���ELEMENT��ҳ��Ԫ�ء�',
  `code` VARCHAR(16) NOT NULL COMMENT '��Դ��ţ���000,001,002���',
  `name` VARCHAR(32) NOT NULL COMMENT '��Դ����',
  `url` VARCHAR(64) NOT NULL COMMENT '��Դ��λ',
  `parent_id` BIGINT(10) DEFAULT NULL COMMENT '���ڵ�ID��һ���ڵ�Ϊ��',
  `status` CHAR(1) NOT NULL DEFAULT 'a' COMMENT '״̬',
  `cdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `edate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `creator` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '������',
  `editor` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '�޸���',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='��Դ��';

-- �û���ɫ�� user_role
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `springboot_practice`.`user_role` (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '����',
  `id_user` BIGINT(10) UNSIGNED NOT NULL COMMENT '�û�ID',
  `id_role` BIGINT(10) UNSIGNED NOT NULL COMMENT '��ɫID',
  `status` CHAR(1) NOT NULL DEFAULT 'a' COMMENT '״̬',
  `cdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `edate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `creator` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '������',
  `editor` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '�޸���',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `springboot_practice`.`user` (`id`),
  CONSTRAINT `fk_role` FOREIGN KEY (`id_role`) REFERENCES `springboot_practice`.`role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='�û���ɫ��';


-- ��ɫ��Դ�� role_resource
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `springboot_practice`.`role_resource` (
  `id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '����',
  `id_role` BIGINT(10) UNSIGNED NOT NULL COMMENT '��ɫID',
  `id_resource` BIGINT(10) UNSIGNED NOT NULL COMMENT '��ԴID',
  `status` CHAR(1) NOT NULL DEFAULT 'a' COMMENT '״̬',
  `cdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `edate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `creator` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '������',
  `editor` VARCHAR(50) NOT NULL DEFAULT 'system' COMMENT '�޸���',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_role` FOREIGN KEY (`id_role`) REFERENCES `springboot_practice`.`role` (`id`),
  CONSTRAINT `fk_resource` FOREIGN KEY (`id_resource`) REFERENCES `springboot_practice`.`resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='��ɫ��Դ��';