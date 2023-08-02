package com.itmk.web.sys_user.service;

import com.itmk.web.sys_user.entity.SysUser;
import com.itmk.web.sys_user.entity.UserParm;

import java.util.List;

public interface SysUserService {
     //查询所有的用户
    List<SysUser> getUserList();
    //新增用户
    boolean addUser(SysUser sysUser);
    //查询用户名是否被占用
    SysUser getUserByName(String username);
    //分页查询用户列表
    List<SysUser> getUserTableList(UserParm parm);
      //根据用户id查询用户
    SysUser getUserById(Integer userId);
    //更新用户
    boolean updateById(SysUser user);
    //删除用户
    boolean deleteById(String userId);
    //根据用户名和密码查询
    SysUser login(SysUser user);
}
