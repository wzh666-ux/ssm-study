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

        /**上传文件显示的样式*/
        .layui-upload-img{
            width: 92px;
            height: 92px;
            margin: 0 10px 10px 0;
        }
        /**删除图片的样式*/
        .del-icon{
            position: relative;
            height: 92px;
            left: -15px;
            top: -45px;
        }
    </style>
</head>
<body>
<div class="layui-form layuimini-form" lay-filter="plantForm">
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <input type="text" name="id" id="id" class="layui-hide">  <%--layui-hide 隐藏标签--%>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">植物编号</label>
        <div class="layui-input-inline">
            <input type="text" name="plantno" id="plantno" lay-verify="required" lay-reqtext="植物编号不能为空" placeholder="请输入植物编号"
                   value="" class="layui-input">
        </div>
        <label class="layui-form-label required" >植物名称</label>
        <div class="layui-input-inline">
            <input type="text" name="plantname" id="plantname" lay-verify="required" lay-reqtext="植物名称不能为空" placeholder="请输入植物名称" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">植物别名</label>
        <div class="layui-input-inline">
            <input type="text" name="plantalias" id="plantalias" lay-verify="required" lay-reqtext="植物编号不能为空" placeholder="请输入植物编号"
                   value="" class="layui-input">
        </div>
        <label class="layui-form-label required" >拉丁名</label>
        <div class="layui-input-inline">
            <input type="text" name="latiname" id="latiname" lay-verify="required" lay-reqtext="植物名称不能为空" placeholder="请输入植物名称" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属属类</label>
        <div class="layui-input-inline">
            <select name="gsno" id="gsno" lay-search="">
                <option value=""></option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图片</label>
        <div class="layui-input-block">
            <input name="imagepath" type="hidden"/>
            <button type="button" class="layui-btn" id="uploadPic">
                <i class="layui-icon">&#xe67c;</i>上传图片   <%--iconfont--%>
            </button>
            <div class="layui-upload-list" id="pics"></div>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">形态特征</label>
        <div class="layui-input-block">
            <textarea name="morchar" id="morchar" class="layui-textarea" placeholder="请输入备注"></textarea>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">产地分布</label>
        <div class="layui-input-block">
            <textarea name="prodarea" id="prodarea" class="layui-textarea" placeholder="请输入备注"></textarea>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">生态习性</label>
        <div class="layui-input-block">
            <textarea name="ecolhabit" id="ecolhabit" class="layui-textarea" placeholder="请输入备注"></textarea>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">用途</label>
        <div class="layui-input-block">
            <textarea name="gardenuse" id="gardenuse" class="layui-textarea" placeholder="请输入备注"></textarea>
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
<script>
    layui.use(['form','upload'], function () {
        var form = layui.form,
            layer = layui.layer,
            upload=layui.upload,  //使用上传文件组件
            $ = layui.$; //jquery

        var id;
        var href = window.location.href.split('?');
        if (href.length > 1) {
            var args = href[1].split('=');
            id = args[1];
        }
        if (id) {
            $.get('/plantinfo/detail?id='+id,function (res) { //发送get请求，把植物id传到后台，查询详细信息
                form.val('plantForm',res);  //回显查询数据到表单
                $.each(res.imagepath.split(','),function (index,item) {
                    $('#pics').append('<img data-path="'+item+'" src="'+item+'"' +
                        ' class="layui-upload-img" alt=""/><a class="del-icon layui-icon layui-icon-close-fill Del" href="javascript:;"/>');
                });
                uploadInst.reload({number: picNum - $('#pics>img').size()});  //刷新还可以上传的图片数量
            });
        }

        //动态刷新科类下拉选择框
        $.ajax({
            url: "/genus/listAll",
            type: "post",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                $.each(result,function (index, item) {
                    $('#gsno').append(new Option(item.gsname,item.gsno));  //循环将属类信息放入下拉选择框
                });
                form.render(); //刷新表单
            }
        });

        var picNum = 5;   //定义上传文件的最大个数
        //打开上传文件对话框
        var uploadInst=upload.render({
            elem: '#uploadPic', //绑定到按钮上
            url: '/plantinfo/upload', //上传文件的后台处理接口
            accept: 'images', //上传文件的类型为图片
            number: picNum,//上传文件的最大个数
            multiple: true, //是否可以选择多张图片
            done: function (res) {//单张图片上传成功后执行
                if ($('#pics>img').size() > picNum) {
                    layer.msg("最大只能上传"+picNum+"张图片",{icon:2});
                    return;
                }
                //上传成功后刷新页面显示图片
                $('#pics').append('<img data-path="'+res.data+'" src="'+res.data+'"' +
                    ' class="layui-upload-img" alt=""/> <a class="del-icon layui-icon layui-icon-close-fill Del" href="javascript:;"/>');
                //将上传的文件路径放入imagepath字段，后面存到数据库
                var input = $('input[name=imagepath]');
                input.val(input.val() ? (input.val() + "," + res.data) : res.data);
            },
            allDone: function(obj) {//所有图片上传成功后执行
                if ($('#pics>img').size() > picNum) { //如果上传数大于picNum，上传按钮变灰不能使用
                    $('#uploadPic').addClass("layui-btn-disabled").attr("disabled", true);
                }else{
                    uploadInst.reload({number: picNum - obj.successful});
                }
            },
            error: function (e) {
                console.log(e); //打印异常信息
            }
        });
        //绑定删除图片的动作
        $(document).on('click', '.Del', function () {
            var input =$('input[name=imagepath]');
            var pics = input.val().split(',');
            var pos = $.inArray($(this).prev().data('path'), pics);
            pics.splice(pos, 1);//删除指定的图片的路径
            input.val(pics.join(','));//删除的后路径赋值给imagepath
            $(this).prev().remove();//删除图片
            $(this).remove(); //删除图片的叉叉
            $('#uploadPic').removeClass("layui-btn-disabled").attr("disabled", false); //移除上传按钮灰色的样式
            uploadInst.reload({number: picNum - $('#pics>img').size()});//重新刷新剩余的图片数量
        });

        //监听提交
        form.on('submit(saveBtn)', function (data) {
            var url = "";  //发送到后台的地址
            if (data.field.id == null || data.field.id == "") {
                url="/plantinfo/save"  //如果id号为空，表明是添加动作
            }else{
                url="/plantinfo/update"//如果id号有值，表明是修改动作
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