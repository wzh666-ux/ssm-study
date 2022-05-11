<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/28
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Title</title>
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
        <label class="layui-form-label required" >公告内容</label>
        <div class="layui-input-block">
            <textarea name="detail" id="detail" lay-verify="required" lay-reqtext="公告内容不能为空" placeholder="请输入公告内容" placeholder="请输入内容" class="layui-textarea layui-hide"></textarea>
            <div id="editor" style="margin: 50px 0 50px 0">
                <p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
        </div>
    </div>
</div>
<script src="../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="../js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['form','wangEditor'], function (e) {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.$,
            wangEditor = layui.wangEditor;


        //富文本编辑器
        window.onload = function (){
            var editor = new wangEditor('#editor');
            var $text = $('#detail')
            editor.customConfig.onchange = function (html) {
                //监控变化，同步更新到textarer
                $text.val(html)
            }
            editor.create();
            //获取父页面json的值
            var parent_json = eval("("+parent.json+")");
            editor.txt.html(parent_json.detail)
        }
        //监听提交
        form.on('submit(saveBtn)', function (data) {
            var url = "";  //发送到后台的地址
            if (data.field.id == null || data.field.id == "") {
                url="/detail/save"  //如果id号为空，表明是添加动作
            }else{
                url="/detail/update"//如果id号有值，表明是修改动作
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
            return false;
        });

    });
</script>
</body>
</html>
