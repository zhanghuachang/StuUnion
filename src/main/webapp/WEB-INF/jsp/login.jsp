<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/17 0017
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>学生会服务平台</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <style>
        /*.container {
            width: 100%;
            height: 100%;
            background: url(../../images/bgLogin.jpg) no-repeat;
        }*/
        .nav-top {
            width: 100%;
            height: 80px;
            background-color: #009688;
            line-height: 80px;
            padding: 0 15px;
        }
        .nav-top img{
            display: inline-block;
            width: 60px;
            height: 60px;
            margin-right: 10px;
            margin-top: -10px;
        }
        .nav-top h3 {
            display: inline-block;
            margin-top: 0;
            color: #FFFFFF;
            font-family: "楷体";
            font-size: 30px;
        }
        .container {
            margin-left: 0;
        }
        .login {
            margin-top: 60px;
            border: none;
            margin-left: 75px;
            width: 313px;
        }
        .login h3 {
            line-height: 80px;
            font-weight: normal;
            color: #888888;
        }
        .login .content {
            border: 1px solid gainsboro;
            border-radius: 3px;
            width: 313px;
        }
        .panel-default {
            border: none;
            margin-bottom: 0;
        }

        .panel-default form {
            margin-bottom: 0;
        }
        .panel-title {
            font-size: 28px;
            font-family: "楷体";
            font-weight: bold;
        }
        .panel-default .panel-heading {
            background-color: #FFFFFF;
            border-bottom: none;
            height: 100px;
            /*line-height: 100px;*/
            background-color: #00968805;
        }
        .panel-body {
            padding-top: 30px;
        }
        .register {
            float: right;
            text-decoration: none;
            padding: 5px 0;
            border-radius: 2px;
            color: red;
        }
        .register:hover {
            color: red;
            text-decoration: none;
        }
        .form-group input {
            padding-top: 20px;
            padding-bottom: 20px;
        }
        .form-group {
            margin-bottom: 30px;
        }
        .footer {
            height: 100px;
        }
        .loginbtn {
            float: left;
            width: 100%;
            height: 40%;
            font-size: 30px;
            background-color: #6495ed78;
            border: none;
            padding: 5px 0;
            border-radius: 2px;
            color: #888;
            font-size: 20px;
            margin-top: 20px;
        }

        .help-block {
            font-size: 12px;
            color: #888;
            margin-top: 10px;
        }
        .help-float {
            display: inline-block;
            margin-top: 10px;
            margin-bottom: 10px;
            color: #888;
            font-size: 12px;
        }
        .username,.pwd{
            position: relative;
        }
        .username i,.pwd i{
            position: absolute;
            top: 14px;
            left: 5px;
            color: #CCCCCC;
        }
        .username input,.pwd input{
            padding-left: 20px;
        }

        /*轮播图*/
        .carousel {
            width: 750px;
            height: 468px;
            margin-top: 60px;
            margin-left: 530px;
        }
        .carousel-inner {
            width: 750px;
            height: 468px;
        }
        .carousel-control.left,.carousel-control.right{
            background-image: none;
        }
        .carousel-inner img {
            width: 750px;
            height: 468px;
        }


    </style>
</head>

<body>

<div class="nav-top">
    <img src="/images/logo.png" width="40px" height="40px"/>
    <h3>三峡大学计算机与信息学院学生会服务平台</h3>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-4 login">
            <div class="content">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">登录学生会服务平台</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" method="post" action="/user/login" id="loginForm">

                            <div class="form-group username">
                                <i class="glyphicon glyphicon-user"></i>
                                <input class="form-control" value="" placeholder="用户名" name="username" type="text" autofocus id="username">
                            </div>
                            <div class="form-group pwd">
                                <i class="glyphicon glyphicon-lock"></i>
                                <input class="form-control" placeholder="密码" name="password" type="password" value="" id="password">
                                <a class="register" href="/registerPage">注册</a>
                            </div>
                            <div class="error"></div>
                            <div class="footer">
                                <button class="loginbtn" id="login-submit">登录</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--轮播图-->
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="/images/banner1.jpg" alt="..." width="750px" height="468px">
                    <div class="carousel-caption">
                        ...
                    </div>
                </div>
                <div class="item">
                    <img src="/images/banner2.jpg" alt="..." width="750px" height="468px">
                    <div class="carousel-caption">
                        ...
                    </div>
                </div>
                <div class="item">
                    <img src="/images/banner3.jpg" alt="..." width="750px" height="468px">
                    <div class="carousel-caption">
                        ...
                    </div>
                </div>
                <div class="item">
                    <img src="/images/banner4.jpg" alt="..." width="750px" height="468px">
                    <div class="carousel-caption">
                        ...
                    </div>
                </div>
            </div>
            <!--control-->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>

        </div>

    </div>
</div>

<!-- jQuery -->
<script src="/js/jquery-3.2.1.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

<script>
    $("#login-submit").on("click", function () {
        var username = $("#username").val();
        var password = $("#password").val();
        $.ajax({
            url: "/user/loginCheck",
            data: {
                "username": username,
                "password": password
            },
            dataType: "json",
            type: "post",
            success: function (msg) {
                if(msg){
                    $("#loginForm").submit();
                }
                else {
                    alert("用户名或密码错误, 请重新登陆");
                    window.location.reload();
                }
            }
        })
    })
</script>
</body>
</html>