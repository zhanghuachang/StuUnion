<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/28 0028
  Time: 20:05
  To change this template use File | Settings | File Templates.
  修改密码
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>修改密码</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/css/user.css" media="all" />
    <script src="/js/jquery-3.2.1.min.js"></script>
</head>
<body class="childrenBody">
<form class="layui-form changePwd">

    <%--密码--%>
    <input type="hidden" id="realPwd" value="${user.password}">

    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" value="${user.username}" disabled class="layui-input layui-disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">旧密码</label>
        <div class="layui-input-block oldPwdSure">
            <input type="password" name="oldPwd" id="oldPwd" value="" placeholder="请输入旧密码" lay-verify="required|oldPwd" class="layui-input pwd">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">新密码</label>
        <div class="layui-input-block">
            <input type="password" name="password" value="" placeholder="请输入新密码" lay-verify="required|newPwd" id="pwd" class="layui-input pwd">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">确认密码</label>
        <div class="layui-input-block insurePwd">
            <input type="password" id="eckPwd" value="" placeholder="请确认密码" lay-verify="required|confirmPwd" class="layui-input pwd">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" id="changePwd" lay-submit="" lay-filter="changePwd">立即修改</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="/layui/layui.js"></script>

<script type="text/javascript">
    var flag = false;  //判断密码是否一致
    var flag1 = false;//旧密码是否正确

    $("#oldPwd").blur(function () {
        var oldPwd = $("#oldPwd").val();
        var realPwd = $("#realPwd").val();
        if(oldPwd != realPwd){
            var $span = '<span style="color: red">旧密码输入错误</span>';
            $(".oldPwdSure").append($span);
            $("#oldPwd").css("border", "1px solid red");
        }else{
            $(".oldPwdSure span").html("");
            $("#oldPwd").css("border", "1px solid #fff");
        }
    })

    $("#eckPwd").blur(function () {
        var pwd = $("#pwd").val();
        var eckPwd = $("#eckPwd").val();

        $(".insurePwd span").html("");
        if (eckPwd == null || eckPwd == "") {
            var $span = '<span>请确认密码</span>';
            $(".insurePwd").append($span);
            $("#eckPwd").css("border", "1px solid red");
        }
        if (pwd != eckPwd) {
            var $span = '<span style="color: red">密码不一致，请重新输入</span>';
            $(".insurePwd").append($span);
            $("#eckPwd").css("border", "1px solid red");
        }
        else {

            var $span = '<span>密码一致</span>';
            $(".insurePwd").append($span);
            $(".insurePwd span").css("color", "green");
            flag3 = true;
            $("#eckPwd").css("border", "1px solid #fff");
        }
    })

    $("#changePwd").click(function () {
        var pwd = $("#pwd").val();
        $.ajax({
            type:"post",
            url:"/user/changePwd",
            data:{
                "password":pwd
            },
            dataType:"json",
            success:function (msg) {
                alert("修改成功!");
                window.location.reload();
            }
        })
    })


</script>

</body>
</html>
