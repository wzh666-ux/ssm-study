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
                            <label class="layui-form-label">植物编号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="plantno" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">植物名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="plantname" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">所属属类</label>
                            <div class="layui-input-inline">
                                <select name="gsno" id="gsno" lay-search="">
                                    <option value=""></option>
                                </select>
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
            <a class="layui-btn layui-btn-xs layui-btn-warm data-count-delete" lay-event="qrcode">二维码</a>
        </script>

    </div>
</div>
<script src="../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;
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
        table.render({    //刷新表格数据
            elem: '#currentTableId',
            url: '/plantinfo/list',  //表格的数据来源
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id',  title: 'ID', width: 60,sort: true},
                {field: 'plantno',  title: '植物编号', sort: true},
                {field: 'plantname',  title: '植物名称', sort: true},
                {field: 'plantalias',  title: '植物别名', sort: true},
                {field: 'imagepath',  title: '图片', sort: true,templet: function (d) {
                        /*图片路径：/upload/202105271511231.jpg,/upload/202105271511232.jpg,/upload/202105271511234.jpg,/upload/202105271511235.jpg,/upload/202105271511233.jpg*/
                        var pics = d.imagepath.split(','); //用, 切分成图片数组
                        return '<a><img data-path="'+d.imagepath+'" src="'+pics[0]+'" width="50px" height="50px" onclick="showAllBigImage(this)"/></a>'  /*取第一张图片*/
                    }},
                {field: 'gsname',  title: '所属类别', sort: true},
                {field: 'username',  title: '发布者', sort: true},
                {field: 'isstate',  title: '是否发布',  sort: true, templet: function (d) {
                //return '<input type="checkbox"  lay-skin="switch" value="{{d.id}}"  {{d.isstate==true?'checked':''}} lay-filter="switchState" lay-text="是|否" />';
                        if (d.isstate) {
                        return '<input type="checkbox" checked  lay-skin="switch" lay-filter="switchState" value="'+d.id+'" lay-text="是|否" />'
                        }else{
                            return '<input type="checkbox" lay-skin="switch" lay-filter="switchState" value="'+d.id+'" lay-text="是|否" />';
                        }
                    }},
                {field: 'addtime',  title: '添加时间'},
                {title: '操作', minWidth: 200, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],   //分页的条数选择
            limit: 20, //默认每页条数
            page: true,  //分页开关
            skin: 'line'
        });

        //实现切换发布状态的动作
        form.on('switch(switchState)',function (obj) {
            var loadIndex = layer.load(2);
            $.ajax({
                url: "/plantinfo/changeState",
                type: "get",
                contentType: "application/json;charset=utf-8",
                data: {id: obj.elem.value, isstate: obj.elem.checked ? true : false},  //修改发布状态的参数
                dataType: "json",
                success: function (result) {  //请求成功后处理,result是后台传回的信息
                    layer.close(loadIndex);
                    if (result.status == 1) {
                        layer.msg(result.msg,{icon:1,time:500})
                    }else{
                        layer.msg(result.msg, {icon: 2, time: 1000});
                        $(obj.elem).prop('checked', !obj.elem.checked());  //如果修改失败，则还原发布状态
                        form.render('checkbox'); //刷新
                    }
                },
                error: function (result) { //请求错误后处理,result是后台传回的信息
                    layer.close(loadIndex);
                    layer.msg("程序异常", {icon: 2, time: 1000});
                }
            });
        });

        //定义显示大图的方法
        window.showBigImage = function (e) {
            layer.open({
                type: 1,
                title: false,
                closeBtn: 1,
                shadeClose: true,
                area: [$(e).width+'px',$(e).height+'px'],
                content: "<img src="+$(e).attr('src')+" />" //定义图片的路径
            });
        };
        //点击显示所有图片的大图
        window.showAllBigImage = function (e) {
            var pics = $(e).data('path').split(',');
            var imgList = pics.map(function (value) {  //map 数组映射操作
                return {
                    src: value
                }
            });
            layer.photos({  //layUI的相册组件
                photos: {data: imgList},    //图片的路径
                start: 0,  //图片的开始位置
                shade: .1,  //背景透明
                closeBtn: true  //关闭按钮
            });
        };
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
                    title: '<h1 style="text-align: center">添加植物</h1>',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['50%', '75%'],
                    content: 'plantForm.jsp',
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
                        url: "/plantinfo/deleteBatch",
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
                    title: '<h1 style="text-align: center">编辑植物</h1>',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['50%', '75%'],  //打开弹出框时，页面的宽高比例
                    content: 'plantForm.jsp?id=' + data.id, //传id
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('是否确定删除该行？', function (index) {  //confirm 确定取消的对话框
                    //发送请求到后台，根据id删除科类后，刷新表格数据
                    $.ajax({
                        url: "/plantinfo/delete",
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
            } else if (obj.event === 'qrcode') { //生成二维码的动作
                layer.open({
                    title: '<h1 style="text-align: center">'+data.plantname+'</h1>',
                    type: 2,
                    shade: 0,
                    shadeClose: true,
                    area: ['350px', '350px'],
                    content: 'qrlist.jsp',
                    success: function (layero, index) {
                        var iframeWin=layero.find('iframe')[0].contentWindow;
                        iframeWin.setData({id: data.id}); //传植物id到二维码生成页面
                    }
                });
            }
        });

    });
</script>

</body>
</html>