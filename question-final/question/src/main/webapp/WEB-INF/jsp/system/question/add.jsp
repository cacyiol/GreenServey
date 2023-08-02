<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
    <link rel="stylesheet" href="../../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../../lib/bootstrap/bootstrap.min.css" media="all">
    <style>
      .layui-upload-img {
        width: 120px;
        height: 120px;
      }
    </style>
  </head>
  <body style="font-size: 0.8rem;">
    <form class="layui-form m-3">
      <div class="d-flex mb-3">
        <div class="col d-flex align-items-center">
          <label style="width: 120px;margin: 0px;"><span style="color: #FF7670;">*</span>Questionnaire title:</label>
          <input id="questionTitle" type="text" value="" class="form-control form-control-sm"/>
        </div>
      </div>
      <div class="d-flex mb-3">
        <div class="col d-flex">
          <label style="width: 120px;margin: 0px;"><span style="color: #FF7670;">*</span>Questionnaire serial number:</label>
          <input id="questionOrder" type="text" value="" class="form-control form-control-sm"/>
        </div>
      </div>

      <div class="d-flex mb-3">
        <div class="col d-flex">
          <label style="width: 120px;"><span style="color: #FF7670;">*</span>Introduction to the questionnaire:</label>
          <textarea id="questionDesc" name="desc" placeholder=" " class="layui-textarea"></textarea>
        </div>
      </div>


    </form>
    <script src="../../lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
    <script src="../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script><script>
        var layer = null;
        layui.use(['upload', 'layer'], function () {
            var upload = layui.upload;
            layer = layui.layer;
            var $ = layui.jquery;

        })
        //表单验证
        var adddata = function () {
            //表单验证
            //获取问卷标题输入框的值
            var questionTitle = $("#questionTitle").val();
            if (!questionTitle) {
                //信息提示
                layer.msg('Please enter a title for the questionnaire:');
                return;
            }
            ;
            //序号
            if (!$("#questionOrder").val()) {
                layer.msg("Please enter a serial number:");
                return;
            }

            if(!$("#questionDesc").val()){
                 layer.msg("Please enter a brief description of the questionnaire");
                return;
            }



            return {
                questionTitle: $("#questionTitle").val(),
                questionOrder: $("#questionOrder").val(),
                questionDesc: $("#questionDesc").val(),
                questionStatus: $('input[name="questionStatus"]:checked').val()
            }
        }
    </script>
  </body>
</html>
