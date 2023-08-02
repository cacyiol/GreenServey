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
      <a lay-event="edit" class="layui-btn layui-btn-sm"><i class="layui-icon layui-icon-edit"></i>Participate in</a>
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

                    {field: 'questionTitle', title: 'Title', align: 'center', width: 280},
                    {field: 'questionDesc', title: 'Introduction', align: 'center',width: 280},
                    {field: 'questionOrder', title: 'Serial NUmber', align: 'center', width: 280},


                    {field: 'username', title: 'Operation', align: 'center', width: 220, toolbar: '#linetool'},

                ]],

            })
            //编辑、删除点击事件
            table.on('tool(questiontable)', function (obj) {
                console.log(obj)
                if (obj.event == 'edit') {
                    // layer.msg('编辑')
                  var parm = {
                    questionId: obj.data.questionId
                  }
                  http.get("/api/answerPaper/isTrue",parm,function (res) {
                    if(res.code==200){
                      layer.open({
                        skin: 'layui-layer-molv', //皮肤
                        offset: '0px',
                        title: obj.data.questionTitle,
                        type: 2,
                        area: ['1100px', '800px'],
                        content: '/api/sysPaper/answer?questionId='+obj.data.questionId,
                        btn: ['Yes', 'Cancel'],
                        btn1: function (index) {
                          var parms = window["layui-layer-iframe" + index].commitdata();
                          console.log('111111111')
                          console.log(parms)
                          var parm = {
                            userId:sessionStorage.getItem("userId"),
                            questionId:obj.data.questionId,
                            paperList:parms
                          }
                          http.post("/api/answerPaper/saveCommit",JSON.stringify(parm),function (data) {
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
            // //搜索按钮
            // $("#searchBtn").click(function () {
            //     reload();
            // });
            // //重置按钮
            // $("#resetBtn").click(function () {
            //     //清空搜索框数据
            //     $("#questionTitle").val('');
            //     //重新加载表格
            //     reload();
            // })
        })
    </script>
  </body>
</html>
