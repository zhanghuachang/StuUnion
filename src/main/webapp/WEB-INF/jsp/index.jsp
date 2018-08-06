<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/17 0017
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <title>学生会服务平台</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="//at.alicdn.com/t/font_eolqem241z66flxr.css" media="all" />
    <link rel="stylesheet" href="/css/main.css" media="all" />
</head>
<body class="main_body">
<div class="layui-layout layui-layout-admin">
    <!-- 顶部 -->
    <div class="layui-header header">
        <div class="layui-main">
            <a href="#" class="logo">学生会服务平台</a>
            <!-- 天气信息 -->
            <div class="weather" pc>
                <div id="tp-weather-widget"></div>
                <script>(function(T,h,i,n,k,P,a,g,e){g=function(){P=h.createElement(i);a=h.getElementsByTagName(i)[0];P.src=k;P.charset="utf-8";P.async=1;a.parentNode.insertBefore(P,a)};T["ThinkPageWeatherWidgetObject"]=n;T[n]||(T[n]=function(){(T[n].q=T[n].q||[]).push(arguments)});T[n].l=+new Date();if(T.attachEvent){T.attachEvent("onload",g)}else{T.addEventListener("load",g,false)}}(window,document,"script","tpwidget","//widget.seniverse.com/widget/chameleon.js"))</script>
                <script>tpwidget("init", {
                    "flavor": "slim",
                    "location": "WX4FBXXFKE4F",
                    "geolocation": "disabled",
                    "language": "zh-chs",
                    "unit": "c",
                    "theme": "chameleon",
                    "container": "tp-weather-widget",
                    "bubble": "disabled",
                    "alarmType": "badge",
                    "color": "#FFFFFF",
                    "uid": "U9EC08A15F",
                    "hash": "14dff75e7253d3a8b9727522759f3455"
                });
                tpwidget("show");</script>
            </div>
            <!-- 顶部右侧菜单 -->
            <ul class="layui-nav top_menu">
                <li class="layui-nav-item" mobile>
                    <a href="javascript:;" data-url="/user/changPwdPage"><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>设置</cite></a>
                </li>

                <li class="layui-nav-item" mobile>
                    <a href="/logout"><i class="iconfont icon-loginout"></i> 退出</a>
                </li>
                <!--<li class="layui-nav-item lockcms" pc>
                    <a href="javascript:;"><i class="iconfont icon-lock1"></i><cite>锁屏</cite></a>
                </li>-->
                <li class="layui-nav-item" pc>
                    <a href="javascript:;">
                        <img src="/images/face.jpg" class="layui-circle" width="35" height="35">
                        <cite>${user.username}</cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-url="/user/userInfo"><i class="iconfont icon-zhanghu" data-icon="icon-zhanghu"></i><cite>个人资料</cite></a></dd>
                        <dd><a href="javascript:;" data-url="/user/changPwdPage"><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>修改密码</cite></a></dd>
                        <dd><a href="/logout"><i class="iconfont icon-loginout"></i><cite>退出</cite></a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <!-- 左侧导航 -->
    <div class="layui-side">
        <div class="user-photo">
            <a class="img" title="我的头像" ><img src="/images/face.jpg"></a>
            <p>你好！<span class="userName">${user.username}</span>, 欢迎登录</p>
        </div>
        <div class="navBar layui-side-scroll"></div>
    </div>

    <input type="hidden" value="${student.sid}" id = "sid">

    <!-- 右侧内容 -->
    <div class="layui-body layui-form">
        <div class="layui-tab marg0" lay-filter="bodyTab">
            <ul class="layui-tab-title top_tab">
                <li class="layui-this" lay-id=""><i class="layui-icon layui-icon-home"></i> <cite>后台首页</cite></li>
            </ul>
            <div class="layui-tab-content clildFrame">
                <div class="layui-tab-item layui-show">
                    <iframe src="/tab"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- 底部 -->
</div>

<!-- 移动导航 -->
<div class="site-tree-mobile layui-hide"><i class="layui-icon">&#xe602;</i></div>
<div class="site-mobile-shade"></div>

<script type="text/javascript" src="/layui/layui.js"></script>
<c:if test="${user.u_power == 1}">
    <script type="text/javascript" src="/js/nav.js"></script><%--主席--%>
</c:if>
<c:if test="${user.u_power == 2}">
    <script type="text/javascript" src="/js/nav_minister.js"></script><%--部长--%>
</c:if>
<c:if test="${user.u_power == 3}">
    <script type="text/javascript" src="/js/nav_director.js"></script><%--干事--%>
</c:if>
<c:if test="${user.u_power == 4}">
    <script type="text/javascript" src="/js/nav_student.js"></script><%--学生--%>
</c:if>
<script type="text/javascript" src="/js/leftNav.js"></script>
<script type="text/javascript" src="/js/index.js"></script>
<script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
<script>
    $(function () {
        var sid = $("#sid").val();
        if(sid == null || sid == "")
            alert("请完善个人信息")
    })
</script>
</body>
</html>
