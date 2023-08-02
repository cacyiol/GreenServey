<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
    <link rel="stylesheet" href="../../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../../lib/bootstrap/bootstrap.min.css" media="all">
  </head>
  <body class="m-3" style="font-size: 0.8rem;">
    <form class="layui-form">
      <div class="row mb-3 flex-column">
        <div class="col d-flex align-items-center mb-3">
          <label style="width: 80px;margin: 0px;" class="d-flex align-items-center"><span style="color: #FF7670;">*
          </span>Password:</label>
          <input id="userId" value="${user.userId}" type="hidden" class="form-control form-control-sm"/>
          <input id="oldPassword" value="" type="text" class="form-control form-control-sm"/>
        </div>
        <div class="col d-flex align-items-center">
          <label style="width: 80px;margin: 0px;" class="d-flex align-items-center"><span style="color: #FF7670;">*
          </span>New Password:</label>
          <input id="password" value="" type="text" class="form-control form-control-sm"/>
        </div>
      </div>
      <div class="row mb-3">
        <div class="col d-flex align-items-center">
          <label style="width: 80px;margin: 0px;" class="d-flex align-items-center"><span style="color: #FF7670;">*
          </span>Confirm the password:</label>
          <input id="confirmPassword" value="" type="text" class="form-control form-control-sm"/>
        </div>
      </div>
      <div class="d-flex justify-content-center align-items-center mt-5">
        <button type="button" onclick="addBtn()" class="layui-btn layui-btn-normal layui-btn-sm"><i
          class="layui-icon layui-icon-edit"></i>Yes
        </button>
        <button onclick="cancelBtn()" type="button" class="layui-btn layui-btn-primary layui-btn-sm">
          <i class="layui-icon layui-icon-close"></i>Cancel
        </button>
      </div>
    </form>
    <script src="../../lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
    <script src="../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
    <script src="../../js/http.js" charset="utf-8"></script>
    <script src="../../js/lay-config.js?v=1.0.4" charset="utf-8"></script>
    <script>
        var layer = null;
        var miniTab = null;
        //加载layui的layer模块
        layui.use(['layer', 'miniTab'], function () {
            //获取layer
            layer = layui.layer;
            miniTab = layui.miniTab;
        })

        //确定按钮
        function addBtn() {

            var oldPassword = $("#oldPassword").val();
            if (!oldPassword) {
                //信息提示
                layer.msg('Please enter the original password');
                return;
            }
            var password = $("#password").val();
            if (!password) {
                layer.msg("Please enter a new password");
                return;
            }
            var confirmPassword = $("#confirmPassword").val();
            if (!confirmPassword) {
                layer.msg("Please enter a confirmation password");
                return;
            }
            //判断新密码和确认密码是否一致
            if (password != confirmPassword) {
                layer.msg("The new password and confirm password are inconsistent");
                return;
            }
            var parm = {
                userId: $("#userId").val(),
                oldPassword: $("#oldPassword").val(),
                password: $("#password").val()
            }
            http.post("/api/sysUser/updatePassword", parm, function (res) {
                if (res.code == 200) {
                    window.location = '/api/sysUser/login';
                }
            })
        }

        //取消按钮
        function cancelBtn() {
            miniTab.deleteCurrentByIframe();
        }
    </script>
  </body>
</html>
