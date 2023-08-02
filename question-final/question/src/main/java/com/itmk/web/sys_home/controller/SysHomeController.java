package com.itmk.web.sys_home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 主页控制器
 */
@Controller
@RequestMapping("/home")
public class SysHomeController {
    /**
     * 首页
     */
    @GetMapping("/index")
    public String index(String userType) {
        if (userType.equals("1")) { //普通用户
            return "common_home";
        }else if (userType.equals("2")){
            return "home"; //管理员
        }
        return "login";
    }

    /**
     * 管理员桌面或欢迎页面
     */
    @GetMapping("/welcome")
    public String welcome() {
        return "welcome";
    }

    /**
     * 普通用户 桌面或欢迎页面
     */
    @GetMapping("/commonwelcome")
    public String commonwelcome() {
        return "common_welcome";
    }

    /**
     * 退出登录
     */
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    /**
     * css3弹性盒子模型
     */
    @GetMapping("/box")
    public String box() {
        return "box";
    }

    /**
     * bootstrap弹性盒子模型
     */
    @GetMapping("/bootstrap")
    public String bootstrap() {
        return "bootstrap";
    }
}
