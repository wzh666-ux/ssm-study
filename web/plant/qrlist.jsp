<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<html>
<head>
    <script type="text/javascript" src="/lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/js/jquery.qrcode.js"></script>
    <script type="text/javascript" src="/js/qrcode.js"></script>
    <script type="text/javascript">
        function setData(data) {
            var strFullPath=window.document.location.href;
            var strPath=window.document.location.pathname;
            var pos = strFullPath.indexOf(strPath);
            var prePath = strFullPath.substring(0, pos);
            var postPath=strPath.substring(0, strPath.substring(1).indexOf('/') + 1);
            var urlPath=prePath+postPath;  //二维码地址

            $('#qrcodeCanvas').html(''); //清空二维码
            jQuery('#qrcodeCanvas').qrcode({  //生成二维码
                correctLevel: 0,
                text: urlPath+"/app/plantdetail.html?id="+data.id
            });
        }
    </script>
</head>
<body>
<div id="qrcodeCanvas" style="text-align: center"></div>
</body>
</html>
