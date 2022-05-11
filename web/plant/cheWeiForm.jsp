<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/12/9
  Time: 17:40
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
    <link rel="stylesheet" href="../../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../../css/public.css" media="all">
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<div class="layui-form layuimini-form">
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <input type="text" name="id" id="id" class="layui-hide">  <%--layui-hide 隐藏标签--%>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">仓库名称</label>
        <div class="layui-input-block">
            <select name="name" id="name" lay-search="">
                <option value=""></option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required" >预计监控时间</label>
        <div class="layui-input-block">
            <input type="text" name="time" id="time" lay-verify="required" lay-reqtext="不能为空" placeholder="请输入类别名称" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required" >管理人</label>
        <div class="layui-input-block">
            <input type="text" name="weiname" id="weiname" lay-verify="required" lay-reqtext="不能为空" placeholder="请输入类别名称" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required" >管理人员联系方式</label>
        <div class="layui-input-block">
            <input type="text" name="weiphone" id="weiphone" lay-verify="required" lay-reqtext="不能为空" placeholder="管理人员联系方式" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea name="remark" id="remark" class="layui-textarea" placeholder="请输入备注"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
        </div>
    </div>
</div>
</div>
<script src="../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="../js/lay-config.js" charset="utf-8"></script>
<script>
    layui.use(['form','layarea','laydate'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.$,
            laydate = layui.laydate;

        var parent_json = eval("("+parent.json+")");
        console.log(parent_json)

        laydate.render({
            elem:'#time'
        })

        //动态刷新下拉选择框
        $.ajax({
            url: "/genus/listAll",
            type: "post",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                $.each(result,function (index, item) {
                    $('#name').append(new Option(item.gsname,item.gsname));  //循环将属类信息放入下拉选择框
                });
                form.render(); //刷新表单
            }
        });

        //监听提交
        form.on('submit(saveBtn)', function (data) {
            var url = "";  //发送到后台的地址
            if (data.field.id == null || data.field.id == "") {
                url="/chewei/save"  //如果id号为空，表明是添加动作
            }else{
                url="/chewei/update"//如果id号有值，表明是修改动作
            }
            //发送修改信息到后台
            $.ajax({
                url: url,
                type: "post",
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(data.field),  //把id传到后台
                dataType: "json",
                success: function (result) {  //请求成功后处理,result是后台传回的信息
                    if (result.status == 1) {
                        layer.msg(result.msg,
                            {icon:6,time:500},
                            function () {
                                parent.location.reload(); //刷新表格数据
                            })
                    }else{
                        layer.msg(result.msg, {icon: 5, time: 1000});
                    }
                },
                error: function (result) { //请求错误后处理,result是后台传回的信息
                    layer.msg("程序异常", {icon: 2, time: 1000});
                }
            });
            //var iframeIndex = parent.layer.getFrameIndex(window.name);
            //parent.layer.close(iframeIndex);

            /*var index = layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            }, function () {
                // 关闭弹出层
                layer.close(index);
                var iframeIndex = parent.layer.getFrameIndex(window.name);
                parent.layer.close(iframeIndex);

            });*/
            return false;
        });

    });
</script>
</body>
</html>
