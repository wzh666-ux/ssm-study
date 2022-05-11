<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Hello, World</title>
    <style type="text/css">
        html{height:100%}
        body{height:100%;margin:0px;padding:0px}
        #container{height:100%}
    </style>
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=1.0&type=webgl&ak=02lDSxhF8uRuEAt7rI68uE247CKMw5X9">
    </script>
</head>

<body>
<div id="container"></div>
<script type="text/javascript">
    var map = new BMapGL.Map("container");
    // 创建地图实例
    var point = new BMapGL.Point(116.404, 39.915);
    // 创建点坐标
    map.centerAndZoom(point, 15);
    // 初始化地图，设置中心点坐标和地图级别

    var geolocation = new BMapGL.Geolocation();
    geolocation.getCurrentPosition(function(r){
        if(this.getStatus() == BMAP_STATUS_SUCCESS){
            var mk = new BMapGL.Marker(r.point);
            map.addOverlay(mk);
            map.panTo(r.point);
            alert('您的位置：' + r.point.lng + ',' + r.point.lat);
        }
        else {
            alert('定位错误' + this.getStatus());
        }
    });
</script>
</body>
</html>