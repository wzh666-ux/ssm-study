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
    <script src="//api.map.baidu.com/api?type=webgl&v=1.0&ak=02lDSxhF8uRuEAt7rI68uE247CKMw5X9"></script>  <%--百度地图api--%>
</head>
<body>
<div id="mapCanvas" style="float: left;width: 400px;height: 500px;margin: 8px"></div>
<div style="float:left;width: 500px" class="layui-form layuimini-form">
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <input type="text" name="id" id="id" class="layui-hide">  <%--layui-hide 隐藏标签--%>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <input type="text" name="longitude" id="longitude" class="layui-hide">  <%--layui-hide 隐藏标签--%>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <input type="text" name="latitude" id="latitude" class="layui-hide">  <%--layui-hide 隐藏标签--%>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">植物名称</label>
        <div class="layui-input-inline">
            <select name="plantno" id="plantno" lay-search="">
                <option value=""></option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required" >生病状态</label>  <%--单选框--%>
        <div class="layui-input-block">
            <input type="radio" id="isill" name="isill" value="false" title="健康" checked="">
            <input type="radio" name="isill" value="true" title="生病">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required" >转移状态</label>
        <div class="layui-input-block">
            <input type="radio" id="ismove" name="ismove" value="false" title="原地" checked="">
            <input type="radio" name="ismove" value="true" title="转移">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required" >地址</label>
        <div class="layui-input-block">
            <input type="text" name="addr" id="addr" disabled lay-verify="required" lay-reqtext="地址不能为空" placeholder="请输入地址" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">基本情况</label>
        <div class="layui-input-block">
            <textarea name="basicstate" id="basicstate" class="layui-textarea" placeholder="请输入基本情况"></textarea>
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
    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.$;

//动态刷新科类下拉选择框
        $.ajax({
            url: "/plantinfo/listAll",
            type: "post",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                $.each(result,function (index, item) {
                    $('#plantno').append(new Option(item.plantname,item.plantno));  //循环将属类信息放入下拉选择框
                });
                form.render(); //刷新表单
            }
        });

        //加载百度地图实现地址的选择
        window.showBMap = function (g, t, a, p) {
            var tlng=108.23754;  //经度
            var tlat=22.842499;  //纬度
            var address="广西壮族自治区南宁市西乡塘区大学东路109号";  //学校的地址
            if (g != null || t != null) {
                tlng=g;
                tlat=t;
                address=a;
            }
            var map;
            var mapstr="mapCanvas";
            map = new BMapGL.Map(mapstr);
            var point = new BMapGL.Point(tlng, tlat);  //地图位置
            map.centerAndZoom(point,15); //初始化地图，放大级别15
            //增加地图地址标志
            var marker = new BMapGL.Marker(point);
            map.addOverlay(marker);
            map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放地图

            //增加位置信息提示框
            var opts={
                width: 210,
                height:50,
                title: '植物位置',
                enableMessage: true
            };
            var infowindow = new BMapGL.InfoWindow(address, opts);
            map.openInfoWindow(infowindow, point);
            //增地图的加点击事件，点击获取地图位置的经纬度和名称
            var geoc = new BMapGL.Geocoder();//声明逆地理位置查询对象
            function showInfo(e) {
                var point=e.latlng;// 获取经纬度对象
                var lng=point.lng; //获取经度
                var lat=point.lat; //获取纬度
                geoc.getLocation(point, function (rs) {
                    map.removeOverlay(marker);//移除之前的marker标志
                    marker = new BMapGL.Marker(point);
                    map.addOverlay(marker);
                    map.centerAndZoom(point, 15);
                    var addComp=rs.addressComponents;
                    var address = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber; //获取地址名称
                    layer.alert(address,{title: '当前选择'});
                    addLocation(address, lng, lat);
                });
            }
            function addLocation(address, lng, lat) {//设置地址，经度，纬度到数据表单，后面存入数据库
                $('#addr').val(address);
                $('#longitude').val(lng);
                $('#latitude').val(lat);
            }
            map.addEventListener("click", showInfo); //给地图添加点击事件
        };

        showBMap(); //调用显示地图

        //监听提交
        form.on('submit(saveBtn)', function (data) {
            var url = "";  //发送到后台的地址
            if (data.field.id == null || data.field.id == "") {
                url="/dynamicinfo/save"  //如果id号为空，表明是添加动作
            }else{
                url="/dynamicinfo/update"//如果id号有值，表明是修改动作
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