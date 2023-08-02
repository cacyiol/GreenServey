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
      <a lay-event="edit" class="layui-btn layui-btn-sm"><i class="layui-icon layui-icon-edit"></i>Design Question</a>
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

                    {field: 'questionTitle', title: 'Title', align: 'center', width: 180},
                    {field: 'questionDesc', title: 'Intro', align: 'center'},
                    {field: 'questionOrder', title: 'Number', align: 'center', width: 180},

                    {field: 'username', title: 'Operation', align: 'center', width: 180, toolbar: '#linetool'},

                ]],
                // page: true,
                // limit: 10,
                // limits: [10, 20, 30, 50]
            })
            //编辑、删除点击事件
            table.on('tool(questiontable)', function (obj) {
                console.log(obj)
                if (obj.event == 'edit') {
                    // layer.msg('编辑')
                    layer.open({
                        skin: 'layui-layer-molv', //皮肤
                        offset: '0px',
                        title: 'Design Question',
                        type: 2,
                        area: ['1100px', '800px'],
                        content: '/api/sysPaper/setting?questionId='+obj.data.questionId,
                        btn: ['Yes', 'Cancel'],
                        btn1: function (index) {
                            var parms = window["layui-layer-iframe" + index].adddata();
                            console.log('111111111')
                            console.log(parms)
                            http.post("/api/sysPaper/savePaper",JSON.stringify(parms),function (data) {
                              if(data.code == 200){
                                  layer.msg(data.msg)
                                  //关闭弹框
                                  layer.close(index);
                              }
                            },"application/json")
                            // layer.close(index);
                        },
                        btn2: function (index) {

                        }
                    })
                }
            });

            //刷新表格
            function reload() {
                table.reload('questiontable', {
                    page: {
                        curr: 1
                    },
                    where: {
                        questionTitle: $("#questionTitle").val()
                    }
                })
            };

        })
    </script>
  </body>
</html>
