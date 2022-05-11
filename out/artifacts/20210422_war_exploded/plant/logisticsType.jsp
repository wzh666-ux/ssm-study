<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/12/9
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">车间类别</label>
                            <div class="layui-input-inline">
                                <input type="text" name="name" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                        </div>
                        <div class="layui-inline">
                            <button type="reset" class="layui-btn layui-btn-primary"><i class="layui-icon"></i>清 空</button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 添加 </button>
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> 删除 </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
        </script>

    </div>
</div>
<script src="../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({    //刷新表格数据
            elem: '#currentTableId',
            url: '/logisticstype/list',  //表格的数据来源
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id',  title: 'ID', sort: true},
                {field: 'name',  title: '车间类别名称', sort: true},
                {field: 'remark',  title: '备注', sort: true},
                {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [5, 15, 20, 25, 50, 100],   //分页的条数选择
            limit: 5, //默认每页条数
            page: true,  //分页开关
            skin: 'line'
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);
            /*layer.alert(result, {
                title: '最终的搜索信息'
            });*/

            //执行搜索重载
            table.reload('currentTableId', { // 从新刷新表格数据
                page: {
                    curr: 1
                }
                , where: {
                    searchParams: result
                }
            }, 'data');

            return false;
        });

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {//toolbar 表头里按钮的动作事件
            if (obj.event === 'add') {  // 监听添加操作
                var index = layer.open({
                    title: '<h1 style="text-align: center">添加车间类别</h1>',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['50%', '75%'],
                    content: 'logisticsTypeForm.jsp',
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                layer.alert(checkStatus + "   " + JSON.stringify(data));
                //实现批量删除
                layer.confirm('是否确定删除选中行？', function (index) {  //confirm 确定取消的对话框
                    //发送请求到后台，根据id删除科类后，刷新表格数据
                    $.ajax({
                        url: "/logisticstype/deleteBatch",
                        type: "post",  //打包发送，后台通过list接收
                        contentType: "application/json;charset=utf-8",
                        data: JSON.stringify(data),  //把选中的科类列表传到后台
                        dataType: "json",
                        success: function (result) {  //请求成功后处理,result是后台传回的信息
                            if (result.status == 1) {
                                layer.msg(result.msg,
                                    {icon:6,time:500},
                                    function () {
                                        location.reload(); //刷新表格数据
                                    })
                            }else{
                                layer.msg(result.msg, {icon: 5, time: 1000});
                            }
                        },
                        error: function (result) { //请求错误后处理,result是后台传回的信息
                            layer.msg("程序异常", {icon: 2, time: 1000});
                        }
                    })
                    //obj.del();
                    layer.close(index); //关闭confirm对话框
                });

            }
        });

        //监听表格复选框选择
        table.on('checkbox(currentTableFilter)', function (obj) {
            console.log(obj)
        });

        table.on('tool(currentTableFilter)', function (obj) { // tool 表格里的操作按钮的动作事件
            var data = obj.data;
            if (obj.event === 'edit') {

                var index = layer.open({
                    title: '<h1 style="text-align: center">编辑车间类别</h1>',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['50%', '75%'],  //打开弹出框时，页面的宽高比例
                    content: 'logisticsTypeForm.jsp',
                    success: function (o, index) {  //页面打开成功后执行的动作,回显数据到编辑页面
                        var body = layer.getChildFrame('body',index);
                        body.find("#name").val(data.name);
                        body.find("#remark").val(data.remark);
                        body.find("#id").val(data.id);
                    }
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('是否确定删除该行？', function (index) {  //confirm 确定取消的对话框
                    //发送请求到后台，根据id删除科类后，刷新表格数据
                    $.ajax({
                        url: "/logisticstype/delete",
                        type: "get",
                        contentType: "application/json;charset=utf-8",
                        data: {id: data.id},  //把id传到后台
                        dataType: "json",
                        success: function (result) {  //请求成功后处理,result是后台传回的信息
                            if (result.status == 1) {
                                layer.msg(result.msg,
                                    {icon:6,time:500},
                                    function () {
                                        location.reload(); //刷新表格数据
                                    })
                            }else{
                                layer.msg(result.msg, {icon: 5, time: 1000});
                            }
                        },
                        error: function (result) { //请求错误后处理,result是后台传回的信息
                            layer.msg("程序异常", {icon: 2, time: 1000});
                        }
                    })
                    //obj.del();
                    layer.close(index); //关闭confirm对话框
                });
            }
        });

    });
</script>

</body>
</html>
