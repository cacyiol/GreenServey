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
                url: '/api/sysQuestion/mylist',
                height: 'full-100',
                toolbar: '#headertool',//表格头部的工具栏
                cols: [[

                    {field: 'questionTitle', title: 'Title', align: 'center', width: 280},
                    {field: 'questionDesc', title: 'Introduction', align: 'center',width: 280},
                    {field: 'questionOrder', title: 'Serial Number', align: 'center', width: 280},


                ]],
                where: {
                    questionTitle: $("#questionTitle").val(),
                    userId: sessionStorage.getItem("userId")
                }
            })

            //刷新表格
            function reload() {
                table.reload('questiontable', {
                    page: {
                        curr: 1
                    },
                    where: {
                        questionTitle: $("#questionTitle").val(),
                        userId: sessionStorage.getItem("userId")
                    }
                })
            };

        })
    </script>
  </body>
</html>
