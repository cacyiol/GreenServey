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
    <%--    搜索框--%>
    <div class="d-flex m-3 align-items-center">

      <button id="addBtn" type="button"
              class="layui-btn layui-btn-sm"><i
        class="layui-icon layui-icon-addition"></i>Add
      </button>
    </div>
    <%--      表格布局--%>
    <table id="questiontable" lay-filter="questiontable"></table>
    <script type="text/html" id="headertool">

    </script>
    <script type="text/html" id="linetool">
      <a lay-event="edit" class="layui-btn layui-btn-sm"><i class="layui-icon layui-icon-edit"></i>Edit</a>
      <a lay-event="delete" class="layui-btn layui-btn-danger layui-btn-sm"><i
        class="layui-icon layui-icon-close"></i>Delete</a>
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

                    {field: 'questionTitle', title: 'Questionnaire title', align: 'center', width: 280},
                    {field: 'questionDesc', title: 'Introduction', align: 'center',width: 320},
                    {field: 'questionOrder', title: 'serial number', align: 'center', width: 220},

                    {field: 'username', title: 'Operation', align: 'center', width: 250, toolbar: '#linetool'},

                ]]
            })
            //编辑、删除点击事件
            table.on('tool(questiontable)', function (obj) {
                console.log(obj)
                if (obj.event == 'edit') {
                    // layer.msg('编辑')
                    layer.open({
                        skin: 'layui-layer-molv', //皮肤
                        offset: '0px',
                        title: 'Edit the questionnaire',
                        type: 2,
                        area: ['770px', '570px'],
                        content: '/api/sysQuestion/editUI?questionId='+obj.data.questionId,
                        btn: ['Yes', 'Cancel'],
                        btn1: function (index) {
                            var parms = window["layui-layer-iframe" + index].adddata();
                            console.log('111111111')
                            console.log(parms)
                            if(parms){
                                http.post("/api/sysQuestion/edit",parms,function (res) {
                                  if(res.code == 200){
                                      //刷新表格
                                      reload();
                                      //信息提示
                                      layer.msg(res.msg)
                                      //关闭弹框
                                      layer.close(index);
                                  }
                                })
                            }
                            // layer.close(index);
                        },
                        btn2: function (index) {

                        }
                    })
                }
                if (obj.event == 'delete') {
                    // layer.msg('删除')
                    layer.confirm('Are you sure you want to delete the data?', {icon: 3, title: 'System prompt'}, function (index) {
                        //do something
                        //提交数据
                        var parm = {
                            questionId:obj.data.questionId
                        }
                        http.post("/api/sysQuestion/delete",parm,function (data) {
                          if(data.code == 200){
                              //刷新表格
                               reload();
                               layer.msg(data.msg);
                              //关闭弹框
                               layer.close(index);
                          }
                        })
                    });
                }
            });
            //新增按钮点击事件
            $("#addBtn").click(function () {
                //打开弹框
                layer.open({
                    skin: 'layui-layer-molv',//皮肤
                    offset: '0px',
                    title: 'Add',
                    type: 2,
                    area: ['770px', '570px'],
                    content: '/api/sysQuestion/addUI',
                    btn: ['Yes', 'Cancel'],
                    btn1: function (index) { //确定按钮的事件
                        var parms = window["layui-layer-iframe" + index].adddata();
                        console.log('111111111')
                        console.log(parms)
                        if (parms) {
                            http.post("/api/sysQuestion/add", parms, function (data) {
                                if (data.code == 200) {
                                    //刷新表格
                                    reload();
                                    //关闭弹框
                                    layer.close(index);
                                }
                            })
                        }
                    },
                    btn2: function (index) { //取消按钮事件

                    }
                })
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
