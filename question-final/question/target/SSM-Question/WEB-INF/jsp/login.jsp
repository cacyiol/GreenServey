<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="UTF-8">
    <title>调查问卷投票系统-登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="../../lib/layui-v2.6.3/css/layui.css" media="all">
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
      .main-body {
        top: 55%;
        left: 25%;
        position: absolute;
        width: 500px;
        -webkit-transform: translate(-50%, -50%);
        -moz-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        -o-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        overflow: hidden;
      }
      
      .login-main .login-bottom .center .item input {
        display: inline-block;
        width: 227px;
        height: 22px;
        padding: 0;
        position: absolute;
        border: 0;
        outline: 0;
        font-size: 14px;
        letter-spacing: 0;
      }
      
      .login-main .login-bottom .center .item .icon-1 {
        background: url(/images/icon-login.png) no-repeat 1px 0;
      }
      
      .login-main .login-bottom .center .item .icon-2 {
        background: url(/images/icon-login.png) no-repeat -54px 0;
      }
      
      .login-main .login-bottom .center .item .icon-3 {
        background: url(/images/icon-login.png) no-repeat -106px 0;
      }
      
      .login-main .login-bottom .center .item .icon-4 {
        background: url(/images/icon-login.png) no-repeat 0 -43px;
        position: absolute;
        right: -10px;
        cursor: pointer;
      }
      
      .login-main .login-bottom .center .item .icon-5 {
        background: url(/images/icon-login.png) no-repeat -55px -43px;
      }
      
      .login-main .login-bottom .center .item .icon-6 {
        background: url(/images/icon-login.png) no-repeat 0 -93px;
        position: absolute;
        right: -10px;
        margin-top: 8px;
        cursor: pointer;
      }
      
      .login-main .login-bottom .tip .icon-nocheck {
        display: inline-block;
        width: 10px;
        height: 10px;
        border-radius: 2px;
        border: solid 1px #9abcda;
        position: relative;
        top: 2px;
        margin: 1px 8px 1px 1px;
        cursor: pointer;
      }
      
      .login-main .login-bottom .tip .icon-check {
        margin: 0 7px 0 0;
        width: 14px;
        height: 14px;
        border: none;
        background: url(/images/icon-login.png) no-repeat -111px -48px;
      }
      
      .login-main .login-bottom .center .item .icon {
        display: inline-block;
        width: 33px;
        height: 22px;
      }
      
      .login-main .login-bottom .center .item {
        width: 288px;
        height: 35px;
        border-bottom: 1px solid #dae1e6;
        margin-bottom: 35px;
      }
      
      .login-main {
        width: 428px;
        position: relative;
        /*position: absolute;*/
        left: 10px;  /*横坐标*/
        top: 20px;  /*纵坐标*/
        z-index: 9999;
        float: left;
      }
      
      .login-main .login-top {
        height: 117px;
        background-color: #6EC79C;
        border-radius: 12px 12px 0 0;
        font-family: SourceHanSansCN-Regular;
        font-size: 30px;
        font-weight: 400;
        font-stretch: normal;
        letter-spacing: 0;
        color: #fff;
        line-height: 117px;
        text-align: center;
        overflow: hidden;
        -webkit-transform: rotate(0);
        -moz-transform: rotate(0);
        -ms-transform: rotate(0);
        -o-transform: rotate(0);
        transform: rotate(0);
      }
      
      .login-main .login-top .bg1 {
        display: inline-block;
        width: 74px;
        height: 74px;
        background: #fff;
        opacity: .1;
        border-radius: 0 74px 0 0;
        position: absolute;
        left: 0;
        top: 43px;
      }
      
      .login-main .login-top .bg2 {
        display: inline-block;
        width: 94px;
        height: 94px;
        background: #fff;
        opacity: .1;
        border-radius: 50%;
        position: absolute;
        right: -16px;
        top: -16px;
      }
      
      .login-main .login-bottom {
        width: 428px;
        background: #fff;
        border-radius: 0 0 12px 12px;
        padding-bottom: 53px;
      }
      
      .login-main .login-bottom .center {
        width: 288px;
        margin: 0 auto;
        padding-top: 40px;
        padding-bottom: 15px;
        position: relative;
      }
      
      .login-main .login-bottom .tip {
        clear: both;
        height: 16px;
        line-height: 16px;
        width: 288px;
        margin: 0 auto;
      }
      
      body {
        background: url(/images/login-bg.jpg) 0% 0% / cover no-repeat;
        position: static;
        font-size: 12px;
      }
      
      input::-webkit-input-placeholder {
        color: #a6aebf;
      }
      
      input::-moz-placeholder {
        color: #a6aebf;
      }
      
      input:-moz-placeholder {
        color: #a6aebf;
      }
      
      input:-ms-input-placeholder {
        color: #a6aebf;
      }
      
      input:-webkit-autofill {
        -webkit-box-shadow: 0 0 0 1000px white inset !important;
      }
      
      html {
        height: 100%;
      }
      
      .login-main .login-bottom .tip {
        clear: both;
        height: 16px;
        line-height: 16px;
        width: 288px;
        margin: 0 auto;
      }
      
      .login-main .login-bottom .tip .login-tip {
        font-family: MicrosoftYaHei;
        font-size: 12px;
        font-weight: 400;
        font-stretch: normal;
        letter-spacing: 0;
        color: #6EC79C;
        cursor: pointer;
      }
      
      .login-main .login-bottom .tip .forget-password {
        font-stretch: normal;
        letter-spacing: 0;
        color: #6EC79C;
        text-decoration: none;
        position: absolute;
        right: 62px;
      }
      
      .login-main .login-bottom .login-btn {
        width: 288px;
        height: 40px;
        background-color: #6EC79C;
        border-radius: 16px;
        margin: 24px auto 0;
        text-align: center;
        line-height: 40px;
        color: #fff;
        font-size: 14px;
        letter-spacing: 0;
        cursor: pointer;
        border: none;
      }
      
      .login-main .login-bottom .center .item .validateImg {
        position: absolute;
        right: 1px;
        cursor: pointer;
        height: 36px;
        border: 1px solid #e6e6e6;
      }
      
      .footer {
        left: 0;
        bottom: 0;
        color: #fff;
        width: 100%;
        position: absolute;
        text-align: center;
        line-height: 30px;
        padding-bottom: 10px;
        text-shadow: #000 0.1em 0.1em 0.1em;
        font-size: 14px;
      }
      
      .padding-5 {
        padding: 5px !important;
      }
      
      .footer a, .footer span {
        color: #fff;
      }
      
      @media screen and (max-width: 428px) {
        .login-main {
          width: 360px !important;
        }
        
        .login-main .login-top {
          width: 360px !important;
        }
        
        .login-main .login-bottom {
          width: 360px !important;
        }
      }
    </style>
  </head>
  <body>
    <div class="main-body">
      <div class="login-main">
        <div class="login-top">
          <span>GreenSurvey</span>
          <span class="bg1"></span>
          <span class="bg2"></span>
        </div>
        <form class="layui-form login-bottom">
          <div class="center">
            <div class="item">
              <span class="icon icon-2"></span>
              <input type="text" id="username" name="username" lay-verify="required" placeholder="Account" maxlength="24"/>
            </div>
            
            <div class="item">
              <span class="icon icon-3"></span>
              <input type="password" id="password" name="password" lay-verify="required" placeholder="Password" maxlength="20">
              <span class="bind-password icon icon-4"></span>
            </div>
            

            <div class="layui-form-item">
              <input type="radio" value="1" name="userType" title="User"/>
              <input type="radio" value="2" name="userType" title="Administrator"/>
            </div>
          </div>
          <div class="tip">
            <a href="/api/sysUser/register" class="forget-password">Register</a>
          </div>
          <div class="layui-form-item" style="text-align:center; width:100%;height:100%;margin:0px;">
            <button class="login-btn" type="button" id="loginBtn">Login</button>
          </div>
        </form>
      </div>
    </div>

    <script src="../../lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
    <script src="../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
    <script src="../../js/http.js" charset="utf-8"></script>
    <script>
        layui.use(['form', 'jquery'], function () {
            var $ = layui.jquery;
            var form = layui.form;
            var layer = layui.layer;

            if (top.location != self.location) top.location = self.location;

            $('.bind-password').on('click', function () {
                if ($(this).hasClass('icon-5')) {
                    $(this).removeClass('icon-5');
                    $("input[name='password']").attr('type', 'password');
                } else {
                    $(this).addClass('icon-5');
                    $("input[name='password']").attr('type', 'text');
                }
            });

            $('.icon-nocheck').on('click', function () {
                if ($(this).hasClass('icon-check')) {
                    $(this).removeClass('icon-check');
                } else {
                    $(this).addClass('icon-check');
                }
            });
            $("#loginBtn").click(function () {
                var userType = $("input[name='userType']:checked").val();
                if (!userType) {
                    layer.msg('UserType:');
                    return false;
                }
                console.log(userType)
                if (!$("#username").val()) {
                    layer.msg('username is null');
                    return false;
                }
                if (!$("#password").val()) {
                    layer.msg('password is null');
                    return false;
                }

                var parm = {
                    username: $("#username").val(),
                    password: $("#password").val(),
                    userType: userType,
                }
                http.post("/api/sysUser/loginCommit", parm, function (res) {
                    console.log(res)
                    if (res.code == 200) {
                        sessionStorage.setItem("userId",res.data);
                        window.location = '/home/index?userType='+userType;
                    }
                })
            })
        });
    </script>
  </body>
</html>