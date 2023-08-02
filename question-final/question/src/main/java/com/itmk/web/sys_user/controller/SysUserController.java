package com.itmk.web.sys_user.controller;

import com.github.pagehelper.PageInfo;
import com.google.code.kaptcha.Constants;
import com.itmk.common.ResultMap;
import com.itmk.common.ResultUtils;
import com.itmk.common.ResultVo;
import com.itmk.common.StatusCode;
import com.itmk.web.sys_user.entity.LoginParm;
import com.itmk.web.sys_user.entity.SysUser;
import com.itmk.web.sys_user.entity.UpdatePasswordParm;
import com.itmk.web.sys_user.entity.UserParm;
import com.itmk.web.sys_user.service.SysUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 系统用户控制器
 */
@Controller
@RequestMapping("/api/sysUser")
public class SysUserController {
    @Autowired
    private SysUserService sysUserService;

    /**
     * 获取全部用户
     */
    @GetMapping("/getUserList")
    @ResponseBody //JSON
    public ResultVo getUserList() {
        List<SysUser> userList = sysUserService.getUserList();
        //构造返回值
//        ResultVo vo = new ResultVo("查询成功",200,userList);
//        vo.setMsg("查询成功");
//        vo.setCode(200);
//        vo.setData(userList);

        return ResultUtils.success("查询成功", userList);
    }

    /**
     * 用户管理页面
     */
    @GetMapping("/index")
    public String index() {
        return "system/user/user";
    }
//
//    /**
//     * 新增用户页面
//     */
    @GetMapping("/addUI")
    public String addUI() {
        return "system/user/add";
    }

    /**
     * 新增用户
     * SysUser sysUser :通过sysUser对象接收前端传来的参数
     * 前端表单提交的字段，需要跟这个对象的属性一一对应
     */
    @PostMapping("/add")
    @ResponseBody
    public ResultVo add(SysUser sysUser) {
        //验证参数是否为空
        if (StringUtils.isEmpty(sysUser.getUsername()) || StringUtils.isEmpty(sysUser.getPassword())) {
            return ResultUtils.error("参数不能为空!");
        }
        //根据用户账户查询该账户是否被占用
        SysUser user = sysUserService.getUserByName(sysUser.getUsername());
        if (user != null) {
            return ResultUtils.error("该账户已经被占用!");
        }
        sysUser.setIsAdmin(1);
        boolean save = sysUserService.addUser(sysUser);
        if (save) { //返回true，说明新增成功
            return ResultUtils.success("新增用户成功!");
        }
        return ResultUtils.error("新增用户失败!");
    }

    /**
     * 获取列表
     * 1、返回json
     * 2、返回值需要满足 layui table的数据格式
     */
    @GetMapping("/list")
    @ResponseBody
    public ResultMap list(UserParm parm) {
        List<SysUser> list = sysUserService.getUserTableList(parm);
        //接收分页返回的数据
        PageInfo<SysUser> page = new PageInfo<>(list);
        //设置符合layui表格的数据
        return ResultUtils.pageResult(StatusCode.SUCCESS_LAYUI_CODE, "查询成功", page.getList(), page.getTotal());
    }

    /**
     * 编辑用户页面
     */
    @GetMapping("/editUI")
    public String editUI(Integer userId, ModelMap map) {
        //查询要编辑的用户信息
        SysUser user = sysUserService.getUserById(userId);
        //把数据返回前端展示
        map.put("user", user);
        return "system/user/edit";
    }

    /**
     * 修改密码页面
     */
    @GetMapping("/editPassword")
    public String editPassword(){
        return "system/user/editPassword";
    }
    @PostMapping("/update")
    @ResponseBody
    public ResultVo edit(SysUser sysUser) {
        //1、验证账户是否被占用
        //根据用户账户查询该账户是否被占用
        SysUser user = sysUserService.getUserByName(sysUser.getUsername());
        if (user != null && !user.getUserId().equals(sysUser.getUserId())) {
            return ResultUtils.error("This account has been taken");
        }
        //更新
        boolean b = sysUserService.updateById(sysUser);
        if (b) {
            return ResultUtils.success("Successfully");
        }
        return ResultUtils.error("Fail");
    }
    /**
     * 用户修改密码
     * 1、判断旧密码是否正确
     * 2、更新
     *
     */
    @PostMapping("/updatePassword")
    @ResponseBody
    public ResultVo updatePassword(UpdatePasswordParm sysUser) {
        //查数据库的密码和前端传来的旧密码是否一致
        SysUser user = sysUserService.getUserById(sysUser.getUserId());
        //判断密码是否相等
        if(!sysUser.getOldPassword().equals(user.getPassword())){
            return ResultUtils.error("Password is false");
        }
        SysUser user1 = new SysUser();
        user1.setUserId(user.getUserId());
        user1.setPassword(sysUser.getPassword());
        //更新密码
        boolean b = sysUserService.updateById(user1);
        if (b) {
            return ResultUtils.success("Edit Successfully");
        }
        return ResultUtils.error("Edit Fail");
    }


    /**
     * 删除
     */
    @PostMapping("/delete")
    @ResponseBody
    public ResultVo delete(String userId) {
        boolean b = sysUserService.deleteById(userId);
        if (b) {
            return ResultUtils.success("Delete Successfully");
        }
        return ResultUtils.error("Delete Fail");
    }

    /**
     * 用户注册页面
     */
    @GetMapping("/register")
    public String register() {
        return "system/user/regeister";
    }

    /**
     * 用户注册页面
     */
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    /**
     * 用户注册
     */
    @PostMapping("/registerCommit")
    @ResponseBody
    public ResultVo registerCommit(LoginParm loginParm, HttpServletRequest request) {
        //获取session
        HttpSession session = request.getSession();
        //从session获取验证码
        String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);

        //判断用户的账户是否被注册
        SysUser user = sysUserService.getUserByName(loginParm.getUsername());
        if (user != null) {
            return ResultUtils.error("This account has been taken");
        }
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(loginParm, sysUser);
        sysUser.setStatus(1);
        sysUser.setIsAdmin(0);
        boolean b = sysUserService.addUser(sysUser);
        if (b) {
            return ResultUtils.success("Successfully");
        }
        return ResultUtils.error("Fail");
    }



    /**
     * 用户登录
     */
    @PostMapping("/loginCommit")
    @ResponseBody
    public ResultVo loginCommit(LoginParm loginParm, HttpServletRequest request) {
        //获取session
        HttpSession session = request.getSession();
        //从session获取验证码
        String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);

        //查询数据库账户是否存在
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(loginParm, sysUser);
        SysUser user = sysUserService.login(sysUser);
        if (user == null) {
            return ResultUtils.error("Account or password is false");
        }
        if(user.getStatus()==2){
            return ResultUtils.error("Account is false");
        }
        if(user.getIsAdmin()==1){
            if ("1".equals(loginParm.getUserType())){
                return ResultUtils.error("You are not user");
            }
        }
        if(user.getIsAdmin()==0){
            if("2".equals(loginParm.getUserType())){
                return ResultUtils.error("You are not administrator");
            }
        }
        session.setAttribute("user", user);
        return ResultUtils.success("Successfully",user.getUserId());
    }
}
