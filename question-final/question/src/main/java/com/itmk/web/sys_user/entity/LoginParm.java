package com.itmk.web.sys_user.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class LoginParm implements Serializable {
    private String username;
    private String password;
    private String code;
    private String userType;
}
