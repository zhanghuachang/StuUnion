<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/14 0014
  Time: 15:54
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

    <title>注册界面</title>

    <!-- Bootstrap Core CSS -->
    <link href="../../bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <style>
        .row {
            margin-top: 135px;
        }

        h3 {
            line-height: 60px;

        }

        .panel-title {
            font-size: 20px;
            font-family: "微软雅黑";
            font-weight: bold;
        }

        .loginbtn {
            width: 100%;
            background-color: lightgreen;
            border: none;
            padding: 10px 0;
            border-radius: 2px;
            color: #fff;
            font-size: 18px;
        }

        .form-group span {
            font-size: 12px;
            color: red;
        }

        #regist-submit {
            width: 100%;
            height: 40px;
            background-color: lightgreen;
            border: none;
            padding: 10px 0;
            border-radius: 2px;
            color: #fff;
            font-size: 18px;
        }
    </style>
</head>

<body>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4 login">
            <div class="login-panel panel panel-default">
                <div class="panel-heading" style="height: 80px;line-height: 80px;">
                    <h3 class="panel-title">学生会服务平台用户注册</h3>
                </div>
                <div class="panel-body">
                    <form role="form" method="post" id="registForm" action="/user/register">
                        <fieldset>
                            <input type="hidden" value="4" name="u_power">
                            <div class="form-group ecknum">
                                <input class="form-control" placeholder="学号" name="u_number" type="text" autofocus
                                       id="userno">
                                <!--<span>用户名已存在</span>-->
                            </div>
                            <div class="form-group eckusername">
                                <input class="form-control" placeholder="用户名" name="username" type="text" autofocus
                                       id="username">
                                <!--<span>用户名已存在</span>-->
                            </div>
                            <div class="form-group eckpwd">
                                <input class="form-control" placeholder="密码" name="password" type="password" value=""
                                       id="pwd">
                                <!--<span class="help-block">初始密码与用户名相同</span>-->
                            </div>
                            <div class="form-group insurepwd">
                                <input class="form-control" placeholder="确认密码" type="password" value=""
                                       id="eckpwd">
                                <!--<span class="help-block">初始密码与用户名相同</span>-->
                            </div>
                            <div class="form-group email">
                                <input class="form-control" placeholder="邮箱" name="u_mail" type="email" value=""
                                       id="email">

                            </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <button id="regist-submit" class="btn">注册</button>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="/js/jquery-3.2.1.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

<script type="text/javascript">
    var flag = false;//学号状态
    var flag1 = false; //用户名状态码
    var flag2 = false; //邮箱状态码
    var flag3 = false;//密码状态码
    $(function () {
        //验证学号是否重复
        $("#userno").blur(function () {
            var userno = $("#userno").val();
            var re = /^\d{10}$/;     //  \D代表非数字
            $("#userno").css("border", "1px solid white");
            if (!re.test(userno)) {   // 返回true,代表在字符串中找到了非数字。
                $("#userno").css("border", "1px solid red");
            } else {
                $(".ecknum span").html("");
                if (userno == null || userno == "") {
                    var $span = '<span>学号不能为空</span>';
                    $(".ecknum").append($span);
                    $("#userno").css("border", "1px solid red");
                }
                else {
                    $.ajax({
                        url: "/user/checkNumber",
                        type: "post",
                        async: true,
                        data: {
                            "u_number": userno
                        },
                        dataType: "json",
                        success: function (msg) {
                            if (msg) {
                                var $span = '<span>学号已存在</span>';
                                $(".ecknum").append($span);
                                $("#userno").css("border", "1px solid red");
                            }
                            else {
                                flag = true;
                                $("#userno").css("border", "1px solid #fff");
                            }
                        }
                    });
                }
            }
        })


        //验证用户名是否重复
        $("#username").blur(function () {
            var username = $("#username").val();
            $(".eckusername span").html("");
            if (username == null || username == "") {
                var $span = '<span>用户名不能为空</span>';
                $(".eckusername").append($span);
                $("#username").css("border", "1px solid red");

            }
            else {
                $.ajax({
                    url: "/user/checkUsername",
                    data: {
                        "username": username
                    },
                    dataType: "json",
                    type: "post",
                    success: function (msg) {
                        if (msg) {
                            var $span = '<span>用户名已存在</span>';
                            $(".eckusername").append($span);
                            $("#username").css("border", "1px solid red");
                        }
                        else {
                            flag1 = true;
                            $("#username").css("border", "1px solid #fff");
                        }
                    }
                })
            }
        })


        //验证密码是否为空
        $("#pwd").blur(function () {
            var pwd = $("#pwd").val();
            $(".eckpwd span").html("");
            if (pwd == null || pwd == "") {
                var $span = '<span>密码不能为空</span>';

                $(".eckpwd").append($span);
                $("#pwd").css("border", "1px solid red");
            } else {
                $("#pwd").css("border", "1px solid #fff");
            }

        })


        //验证两次输入密码是否相同
        $("#eckpwd").blur(function () {
            var pwd = $("#pwd").val();
            var eckpwd = $("#eckpwd").val();
            $(".insurepwd span").html("");
            if (eckpwd == null || eckpwd == "") {
                var $span = '<span>请确认密码</span>';
                $(".insurepwd").append($span);
                $("#eckpwd").css("border", "1px solid red");
            }
            if (pwd != eckpwd) {
                var $span = '<span>密码不一致，请重新输入</span>';
                $(".insurepwd").append($span);
                $("#eckpwd").css("border", "1px solid red");
            }
            else {

                var $span = '<span>密码一致</span>';
                $(".insurepwd").append($span);
                $(".insurepwd span").css("color", "green");
                flag3 = true;
                $("#eckpwd").css("border", "1px solid #fff");

            }
        })

        //验证输入邮箱的格式
        $("#email").blur(function () {
            $(".email span").html("");
            var email = $("#email").val();
            var emailFormat = new RegExp(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/);
            if (email == null || email == "") {
                var $span = '<span>邮箱不能为空</span>';
                $(".email").append($span);
                $("#email").css("border", "1px solid red");
            }
            else {
//	                alert(emailFormat.test(email))
                if (emailFormat.test(email)) {
                    flag2 = true;
                    $("#email").css("border", "1px solid #fff");
                }
	                else{
	                    var $span='<span>邮箱格式不对</span>';
	                    $(".email").append($span);
                        $("#email").css("border", "1px solid red");
	                }
            }
        })

        $("#regist-submit").on("click", function () {
            if (flag1 && flag2 && flag3 && flag){
                alert("恭喜你：注册成功！")
                $("#registForm").submit();
            }

        })
    })
</script>


</body>

</html>
