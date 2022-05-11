<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>绿色车间管理平台登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="../lib/layui-v2.6.3/css/layui.css" media="all">
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .main-body {top:50%;left:50%;position:absolute;-webkit-transform:translate(-50%,-50%);-moz-transform:translate(-50%,-50%);-ms-transform:translate(-50%,-50%);-o-transform:translate(-50%,-50%);transform:translate(-50%,-50%);overflow:hidden;}
        .login-main .login-bottom .center .item input {display:inline-block;width:227px;height:22px;padding:0;position:absolute;border:0;outline:0;font-size:14px;letter-spacing:0;}
        .login-main .login-bottom .center .item .icon-1 {background:url(../images/icon-login.png) no-repeat 1px 0;}
        .login-main .login-bottom .center .item .icon-2 {background:url(../images/icon-login.png) no-repeat -54px 0;}
        .login-main .login-bottom .center .item .icon-3 {background:url(../images/icon-login.png) no-repeat -106px 0;}
        .login-main .login-bottom .center .item .icon-4 {background:url(../images/icon-login.png) no-repeat 0 -43px;position:absolute;right:-10px;cursor:pointer;}
        .login-main .login-bottom .center .item .icon-5 {background:url(../images/icon-login.png) no-repeat -55px -43px;}
        .login-main .login-bottom .center .item .icon-6 {background:url(../images/icon-login.png) no-repeat 0 -93px;position:absolute;right:-10px;margin-top:8px;cursor:pointer;}
        .login-main .login-bottom .tip .icon-nocheck {display:inline-block;width:10px;height:10px;border-radius:2px;border:solid 1px #9abcda;position:relative;top:2px;margin:1px 8px 1px 1px;cursor:pointer;}
        .login-main .login-bottom .tip .icon-check {margin:0 7px 0 0;width:14px;height:14px;border:none;background:url(../images/icon-login.png) no-repeat -111px -48px;}
        .login-main .login-bottom .center .item .icon {display:inline-block;width:33px;height:22px;}
        .login-main .login-bottom .center .item {width:288px;height:35px;border-bottom:1px solid #dae1e6;margin-bottom:35px;}
        .login-main {width:428px;position:relative;float:left;}
        .login-main .login-top {height:117px;background-color:#2d6a44;border-radius:12px 12px 0 0;font-family:SourceHanSansCN-Regular;font-size:30px;font-weight:400;font-stretch:normal;letter-spacing:0;color:#fff;line-height:117px;text-align:center;overflow:hidden;-webkit-transform:rotate(0);-moz-transform:rotate(0);-ms-transform:rotate(0);-o-transform:rotate(0);transform:rotate(0);}
        .login-main .login-top .bg1 {display:inline-block;width:74px;height:74px;background:#fff;opacity:.1;border-radius:0 74px 0 0;position:absolute;left:0;top:43px;}
        .login-main .login-top .bg2 {display:inline-block;width:94px;height:94px;background:#fff;opacity:.1;border-radius:50%;position:absolute;right:-16px;top:-16px;}
        .login-main .login-bottom {width:428px;background:#fff;border-radius:0 0 12px 12px;padding-bottom:53px;}
        .login-main .login-bottom .center {width:288px;margin:0 auto;padding-top:40px;padding-bottom:15px;position:relative;}
        .login-main .login-bottom .tip {clear:both;height:16px;line-height:16px;width:288px;margin:0 auto;}
        body {background:url(../images/backgroud.png) 0% 0% / cover no-repeat;position:static;font-size:12px;}
        input::-webkit-input-placeholder {color:#a6aebf;}
        input::-moz-placeholder {/* Mozilla Firefox 19+ */            color:#a6aebf;}
        input:-moz-placeholder {/* Mozilla Firefox 4 to 18 */            color:#a6aebf;}
        input:-ms-input-placeholder {/* Internet Explorer 10-11 */            color:#a6aebf;}
        input:-webkit-autofill {/* 取消Chrome记住密码的背景颜色 */            -webkit-box-shadow:0 0 0 1000px white inset !important;}
        html {height:100%;}
        .login-main .login-bottom .tip {clear:both;height:16px;line-height:16px;width:288px;margin:0 auto;}
        .login-main .login-bottom .tip .login-tip {font-family:MicrosoftYaHei;font-size:12px;font-weight:400;font-stretch:normal;letter-spacing:0;color:#9abcda;cursor:pointer;}
        .login-main .login-bottom .tip .forget-password {font-stretch:normal;letter-spacing:0;color:#1391ff;text-decoration:none;position:absolute;right:62px;}
        .login-main .login-bottom .login-btn {width:288px;height:40px;background-color:#2d6a44;border-radius:16px;margin:24px auto 0;text-align:center;line-height:40px;color:#fff;font-size:14px;letter-spacing:0;cursor:pointer;border:none;}
        .login-main .login-bottom .center .item .validateImg {position:absolute;right:1px;cursor:pointer;height:36px;border:1px solid #e6e6e6;}
        .footer {left:0;bottom:0;color:#fff;width:100%;position:absolute;text-align:center;line-height:30px;padding-bottom:10px;text-shadow:#000 0.1em 0.1em 0.1em;font-size:14px;}
        .padding-5 {padding:5px !important;}
        .footer a,.footer span {color:#fff;}
        @media screen and (max-width:428px) {.login-main {width:360px !important;}
            .login-main .login-top {width:360px !important;}
            .login-main .login-bottom {width:360px !important;}
        }
    </style>
</head>
<body>
<div class="main-body">
    <div class="login-main">
        <div class="login-top">
            <span>绿色车间管理平台登录</span>
            <span class="bg1"></span>
            <span class="bg2"></span>
        </div>
        <form class="layui-form login-bottom">
            <div class="center">
                <div class="item">
                    <span class="icon icon-2"></span>
                    <input type="text" name="username" lay-verify="required"  placeholder="请输入登录账号" maxlength="24"/>
                </div>

                <div class="item">
                    <span class="icon icon-3"></span>
                    <input type="password" name="password" lay-verify="required"  placeholder="请输入密码" maxlength="20">
                    <span class="bind-password icon icon-4"></span>
                </div>

                <div id="validatePanel" class="item" style="width: 137px;">
                    <input type="text" name="captcha" placeholder="请输入验证码" maxlength="4">
                    <div class="validateImg">
                        <canvas id="canvas" width="100" height="34"></canvas>
                    </div>
                </div>

            </div>
            <div class="tip">
                <span class="icon-nocheck"></span>
                <span class="login-tip">保持登录</span>
                <a href="javascript:" class="forget-password">忘记密码？</a>
            </div>
            <div class="layui-form-item" style="text-align:center; width:100%;height:100%;margin:0px;">
                <button class="login-btn" lay-submit="" lay-filter="login">立即登录</button>
            </div>
        </form>
    </div>
</div>
<div class="footer">
    ©版权所有 2020-2021 交通信息学院工作室<span class="padding-5">|</span><a target="_blank" href="http://www.gxjzy.com">桂ICP备9999号</a>
</div>
<script src="../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form','jquery'], function () {
        var $ = layui.jquery,
            form = layui.form,
            layer = layui.layer;

        // 登录过期的时候，跳出ifram框架
        if (top.location != self.location) top.location = self.location;

        $('.bind-password').on('click', function () {
            if ($(this).hasClass('icon-5')) {
                $(this).removeClass('icon-5');
                $("input[name='password']").attr('type', 'password');
            } else {
                $(this).addClass('icon-5');
                $("input[name='password']").attr('type', 'text');
            }
        });

        //保持登录的点击事件
        var keepLogin = ""; //保持登录 1勾选
        $('.icon-nocheck').on('click', function () {
            if ($(this).hasClass('icon-check')) {
                $(this).removeClass('icon-check');
                keepLogin=0;
            } else {
                $(this).addClass('icon-check');
                keepLogin=1;
            }
        });

        var show_num = [];  //用于保存验证码
        draw(show_num);  //调用生成验证码函数
        $("#canvas").on('click', function () {  //给验证码添加点击事件，刷新验证码
            draw(show_num);
        });
        //验证码方法
        function draw(show_num) {
            var canvas_width=$('#canvas').width();
            var canvas_height=$('#canvas').height();
            var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
            var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
            canvas.width = canvas_width;
            canvas.height = canvas_height;
            var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
            var aCode = sCode.split(",");
            var aLength = aCode.length;//获取到数组的长度

            for (var i = 0; i <= 3; i++) {
                var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
                var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
                var txt = aCode[j];//得到随机的一个内容
                show_num[i] = txt.toLowerCase();
                var x = 10 + i * 20;//文字在canvas上的x坐标
                var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
                context.font = "bold 23px 微软雅黑";

                context.translate(x, y);
                context.rotate(deg);

                context.fillStyle = randomColor();
                context.fillText(txt, 0, 0);

                context.rotate(-deg);
                context.translate(-x, -y);
            }
            for (var i = 0; i <= 5; i++) { //验证码上显示线条
                context.strokeStyle = randomColor();
                context.beginPath();
                context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
                context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
                context.stroke();
            }
            for (var i = 0; i <= 30; i++) { //验证码上显示小点
                context.strokeStyle = randomColor();
                context.beginPath();
                var x = Math.random() * canvas_width;
                var y = Math.random() * canvas_height;
                context.moveTo(x, y);
                context.lineTo(x + 1, y + 1);
                context.stroke();
            }
        }
        //随机生成验证码
        function randomColor() {//得到随机的颜色值
            var r = Math.floor(Math.random() * 256);
            var g = Math.floor(Math.random() * 256);
            var b = Math.floor(Math.random() * 256);
            return "rgb(" + r + "," + g + "," + b + ")";
        }

        // 进行登录操作
        form.on('submit(login)', function (data) {
            console.log(data.field); //打印信息在页面控制台
            console.log(show_num.join(""));//验证码
            data = data.field;
            data.keepLogin = keepLogin; //保持登录的参数放入data

            if (data.username == '') {
                layer.msg('用户名不能为空');
                return false;
            }
            if (data.password == '') {
                layer.msg('密码不能为空');
                return false;
            }
            if (data.captcha == '') {
                layer.msg('验证码不能为空');
                return false;
            }else if (data.captcha.toLowerCase() != show_num.join("")) { //toLowerCase() 把字母转成小写
                layer.msg('验证码输入错误');
                return false;
            }
            //开始登录操作，发送请求信息到后台验证
            $.ajax({
                url: "/Login/login",
                type: "get",
                contentType: "application/json;charset=utf-8",
                data: data,
                dataType: "json",
                success: function (result) {  //请求成功后处理,result是后台传回的信息
                    if (result.status == 1) {
                        layer.msg(result.msg,{icon:1,time:1000},function () {
                            window.location='../index.jsp'
                        })
                    }else{
                        layer.msg(result.msg, {icon: 2, time: 1000});
                    }
                },
                error: function (result) { //请求错误后处理,result是后台传回的信息
                    console.log(result)
                }
            });
            return false;
        });
    });
</script>
</body>
</html>