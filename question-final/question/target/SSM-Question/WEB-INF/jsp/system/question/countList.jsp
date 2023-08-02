<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
    <link rel="stylesheet" href="../../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../../lib/bootstrap/bootstrap.min.css" media="all">
    <style>
      .layui-table-cell {
        text-align: center;
        height: auto;
        white-space: normal;
      }
    </style>
  </head>
  <body style="font-size: 0.8rem;">

    <table id="questiontable" lay-filter="questiontable"></table>
    <script type="text/html" id="headertool">

    </script>
    <script type="text/html" id="linetool">
      <a lay-event="look" class="layui-btn layui-btn-sm layui-btn-normal"><i class="layui-icon layui-icon-edit"></i>
        Statics Analysis</a>
    </script>
    <script src="../../lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
    <script src="../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
    <script src="../../js/http.js" charset="utf-8"></script>
    <script>

        layui.use(['table', 'layer'], function () {
            var table = layui.table;
            var layer = layui.layer;
            var $ = layui.jquery;
            //表格渲染
            table.render({
                elem: '#questiontable',
                url: '/api/sysQuestion/list',
                height: 'full-100',
                toolbar: '#headertool',//表格头部的工具栏
                cols: [[

                    {field: 'questionTitle', title: 'Paper Title', align: 'center', width: 180},
                    {field: 'questionDesc', title: 'Paper Introduction', align: 'center'},
                    {field: 'questionOrder', title: 'Paper Number', align: 'center', width: 180},

                    {field: 'username', title: 'Operation', align: 'center', width: 230, toolbar: '#linetool'},

                ]]
            })
            //编辑、删除点击事件
            table.on('tool(questiontable)', function (obj) {
                console.log(obj)
                if (obj.event == 'look') {
                    // layer.msg('编辑')
                    layer.open({
                        skin: 'layui-layer-molv', //皮肤
                        offset: '0px',
                        title: obj.data.questionTitle+'  Chart analysis',
                        type: 2,
                        area: ['1100px', '750px'],
                        content: '/api/sysQuestion/lookList?questionId=' + obj.data.questionId + "&questionTitle=" + obj.data.questionTitle,

                        btn2: function (index) {

                        }
                    })
                }
                if (obj.event == 'edit') {
                    // layer.msg('编辑')
                    layer.open({
                        skin: 'layui-layer-molv', //皮肤
                        offset: '0px',
                        title: obj.data.questionTitle,
                        type: 2,
                        area: ['1100px', '800px'],
                        content: '/api/sysQuestion/count?questionId=' + obj.data.questionId + "&questionTitle=" + obj.data.questionTitle,
                        btn: ['Print', 'Cancel'],
                        btn1: function (index) {
                            window["layui-layer-iframe" + index].printCount();
                        },
                        btn2: function (index) {

                        }
                    })
                }
            });


        })
    </script>
  </body>
</html>
