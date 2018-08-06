<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/29 0029
  Time: 23:32
  To change this template use File | Settings | File Templates.
  用户管理界面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <link rel="stylesheet" href="/layui/css/layui.css" media="all" />
    <style>
        .user_box thead th {
            text-align: left;
        }
        .user_box tbody td {
            text-align: left;
        }
        .updateBtn {
            background-color: #ff0000a3;
            padding: 5px 3px;
            border-radius: 3px;
            color: #FFFFFF;
            margin-right: 5px;
        }
        .updateBtn:hover {
            color: #FFFFFF;
        }
        .lookBtn {
            background-color: #00800073;
            padding: 5px 3px;
            border-radius: 3px;
            color: #FFFFFF;
            margin-right: 5px;
        }
        .lookBtn:hover {
            color: #FFFFFF;
        }
        .resetBtn {
            background-color: #ffa500ba;
            padding: 5px 3px;
            border-radius: 3px;
            color: #FFFFFF;
            margin-right: 5px;
        }
        .resetBtn:hover {
            color: #FFFFFF;
        }
        .lookMore,.upDateInfo{
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: #FFFFFF;
            display: none;
        }
        .layui-form-label {
            text-align: right;
            padding: 9px 0;
        }
        .layui-form-item{
            width: 360px;
            margin: 30px 10px;
            display: inline;
            float: left;
        }
        .info-span{
            display: block;
            height: 36px;
            line-height: 36px;
            padding-left: 10px;
            width: 260px;
            border: 1px solid #e6e6e6;
            float: left;
        }
        .layui-elem-quote {
            position: relative;
            overflow: hidden;
        }
        .userInfo-close,.upDateInfo-close{
            position: absolute;
            font-size: 30px;
            right: 20px;
            top:12px;
        }
        .layui-input-inline {
            float: left;
            margin-top: 2px;
            margin-left: 10px;
            width: 330px;
        }

        .layui-input-inline input {
            display: inline-block;
            width: 77%;
            margin-right: 10px;
        }
        .search_btn {
            float: right;
        }
        .btn {
            padding: 10px;
            background-color: #009688;
            border-radius:3px;
            color: #FFFFFF;
            cursor: pointer;
            float: right;
            margin-right: -20px;
        }
        .btn:hover {
            color: #FFFFFF;
        }
        .layui-inline h4 {
            font-size: 20px;
        }


        /*权限下拉框样式*/
        .layui-form select {
            display: block;
            width: 110%;
            height: 38px;
        }

    </style>
    <script src="/jquery/dist/jquery.min.js"></script>
    <script src="/layui/lay/dest/layui.all.js"></script>
</head>
<body class="childrenBody">
<div class="userManagement">
    <blockquote class="layui-elem-quote">
        <div class="layui-input-inline">

            <input type="text" value="" placeholder="请输入学号查询" class="layui-input search_input">
            <a class="layui-btn search_btn">查询</a>
        </div>
    </blockquote>
    <table class="layui-table user_box" lay-skin="line">
        <colgroup>
            <col width="12%">
            <col width="12%">
            <col width="12%">
            <col width="12%">
            <col width="12%">
            <col width="12%">
            <col />
        </colgroup>
        <thead>
        <tr>
            <th>用户名</th>
            <th>密码</th>
            <th>学号</th>
            <th>邮箱</th>
            <th>学生权限</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="user-list"></tbody>
    </table>
</div>
<div class="lookMore">
    <blockquote class="layui-elem-quote">
        <div class="layui-inline">
            <h4>查看用户信息</h4>
        </div>
        <a href="javascript:void(0);" class="userInfo-close">x</a>
    </blockquote>
    <form class="layui-form">
        <table>
            <tbody>
            <tr>
                <td>
                    <div class="layui-form-item">
                        <label for="stu_name" class="layui-form-label">姓名</label>
                        <div class="layui-input-block">
                            <span class="info-span" name="s_name" id="s_name"></span>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">学号</label>
                        <div class="layui-input-block">
                            <span class="info-span" name="s_no" id="s_no"></span>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="layui-form-item">
                        <label for="stu_no" class="layui-form-label">性别</label>
                        <div class="layui-input-block">
                            <span class="info-span" name="s_sex" id="s_sex"></span>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">学院</label>
                        <div class="layui-input-block">
                            <span class="info-span" name="s_aca" id="s_aca"></span>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="layui-form-item" pane="">
                        <label class="layui-form-label">专业</label>
                        <div class="layui-input-block">
                            <span class="info-span" name="s_maj" id="s_maj"></span>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="layui-form-item">
                        <label for="stu_tel" class="layui-form-label">出生日期</label>
                        <div class="layui-input-block">
                            <span class="info-span" name="s_birth" id="s_birth"></span>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="layui-form-item" pane="">
                        <label class="layui-form-label">手机号码</label>
                        <div class="layui-input-block">
                            <span class="info-span" name="s_tel" id="s_tel"></span>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="layui-form-item">
                        <label for="stu_tel" class="layui-form-label">邮箱</label>
                        <div class="layui-input-block">
                            <span class="info-span" name="s_mail" id="s_mail"></span>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="layui-form-item" pane="">
                        <label class="layui-form-label">QQ号</label>
                        <div class="layui-input-block">
                            <span class="info-span" name="s_qq" id="s_qq"></span>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="layui-form-item">
                        <label for="stu_tel" class="layui-form-label">所在部门</label>
                        <div class="layui-input-block">
                            <span class="info-span" name="d_name" id="d_name"></span>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="layui-form-item" pane="">
                        <label class="layui-form-label">权限</label>
                        <div class="layui-input-block">
                            <span class="info-span" name="s_power" id="s_power"></span>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="layui-form-item">
                        <label for="stu_tel" class="layui-form-label">职位</label>
                        <div class="layui-input-block">
                            <span class="info-span" name="p_name" id="p_name"></span>
                        </div>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </form>

</div>

<div class="upDateInfo">
    <blockquote class="layui-elem-quote">
        <div class="layui-inline">
            <h4>编辑用户信息</h4>
        </div>
        <a href="javascript:void(0);" class="upDateInfo-close">x</a>
    </blockquote>
    <form class="layui-form">
        <table>
            <tbody>
            <tr>
                <td>
                    <div class="layui-form-item">

                        <input type="hidden" value="${user.uid}" id="uid">

                        <label for="stu_name" class="layui-form-label">用户名</label>
                        <div class="layui-input-block">
                            <input type="text" class="info-span" name="username" id="username">
                        </div>
                    </div>
                </td>
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-block">
                            <input type="text" class="info-span" name="password" id="password">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="layui-form-item">
                        <label for="stu_no" class="layui-form-label">学号</label>
                        <div class="layui-input-block">
                            <input type="text" class="info-span" name="u_number" id="u_number">
                        </div>
                    </div>
                </td>
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">邮箱</label>
                        <div class="layui-input-block">
                            <input type="text" class="info-span" name="u_mail" id="u_mail">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="layui-form-item" pane="">
                        <label class="layui-form-label">注册时间</label>
                        <div class="layui-input-block">
                            <input type="text" class="info-span" name="register_time" id="register_time">
                        </div>
                    </div>
                </td>
                <td>
                    <div class="layui-form-item" pane="">
                            <div class="layui-form-item" pane="">
                                <label class="layui-form-label">权限</label>
                                <div class="layui-input-block">
                                    <select lay-verify="required" id="power">
                                        <option value="普通学生">学生</option>
                                        <option value="干事">干事</option>
                                        <option value="部长">部长</option>
                                        <option value="主席">主席</option>
                                    </select>
                                </div>
                            </div>
                    </div>
                </td>

            </tr>
            <tr>
                <td>
                    <div class="layui-form-item" pane="">
                        <!--<label class="layui-form-label">权限</label>-->
                        <div class="layui-input-block">
                            <!--<a class="btn">确认修改</a>-->
                            <input type="hidden" class="info-span" name="u_power" id="u_power" autofocus="autofocus">
                        </div>
                    </div>
                </td>
                <td>
                    <div class="layui-form-item" pane="">
                        <!--<label class="layui-form-label">权限</label>-->
                        <div class="layui-input-block">
                            <a class="btn" href="javascript:;">确认修改</a>
                        </div>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </form>

</div>


<script>
    var usermanagement=(function(){

        function init(){
            render();
        }

        function render() {
				$.ajax({
					type:"post",
					url:"/user/getAllUser",
					async:true,
					dataType:"json",
					success:function(data){
                        $.each(data, function (i, data) {
                            var power = "";
                            if (data.u_power == "1") {
                                power = "主席";
                            }
                            else if (data.u_power == "2") {
                                power = "部长";
                            }
                            else if(data.u_power == "3"){
                                power = "干事";
                            }
                            else if (data.u_power == "4") {
                                power = "学生";
                            }

                            var $tr = '<tr><td>' + (data.username) + '</td><td>' + (data.password) + '</td><td class="sno">' + (data.u_number) + '</td><td>' + (data.u_mail) + '</td><td>' + (power) + '</td><td><a href="javascript:void(0);" onclick="lookMore(this)" class="lookBtn"><i class="layui-icon">&#xe60a;</i>查看</a><a href="javascript:void(0);" onclick="sureUpdate(this)" class="updateBtn"><i class="layui-icon">&#xe642;</i>编辑</a><a href="javascript:void(0);" onclick="resetPassword(this)" class="resetBtn"><i class="layui-icon">&#xe620;</i>重置密码</a></td></tr>'

                            $("#user-list").append($tr);
            })
        }})

//
        }

        return {
            init:init
        }
    })();

    usermanagement.init();
</script>


<script>
    //编辑,看到的是用户信息

    function sureUpdate(obj){
        $(".upDateInfo").show();
        var $this=$(obj);
        var u_number=$this.parent().siblings(".sno").html();
        $.ajax({
            type:"post",
            url:"/user/getUserByNum",
            async:true,
            dataType:"json",
            data:{
                "u_number":u_number
            },
            success:function(data){
                var power = "";
                if(data.u_power=="1"){
                    power="主席";
                }else if(data.u_power=="2"){
                    power="部长";
                }else if(data.u_power=="3"){
                    power="干事";
                }else if(data.u_power=="4"){
                    power="学生";
                }
                $("#username").val(data.username);
                $("#password").val(data.password);
                $("#u_number").val(data.u_number);
                $("#u_mail").val(data.u_mail);
                $("#register_time").val(data.register_time);
                $("#power").val(power);
            }
        });
    }
    //}
    //点击关闭按钮，编辑页面消失
    $(".upDateInfo-close").click(function(){
        $(".upDateInfo").hide();
    })
    //

    //点击确认修改，将修改后的值传给后台
    $(".btn").click(function(){
        var uid = $("#uid").val();
        var username=$("#username").val();
        var password=$("#password").val();
        var u_number=$("#u_number").val();
        var u_mail=$("#u_mail").val();
        var register_time=$("#register_time").val();
        var u_power=$("#power").val();
        var power = "";
        if(u_power=="主席"){
            power="1";
        }else if(u_power=="部长"){
            power="2";
        }else if(u_power=="干事"){
            power="3";
        }else if(u_power=="学生"){
            power="4";
        }
        $.ajax({
            type:"post",
            url:"/user/updateUser",
            async:true,
            data:{
                "uid":uid,
                "username":username,
                "password":password,
                "u_number":u_number,
                "u_mail":u_mail,
                "u_power":power
            },
            success:function(data){
                //改变了查看详情中的信息
                window.location.reload();
            }
        });

    })

    //点击查看更多时，能看到学生信息
    function lookMore(obj){
        $(".lookMore").show();
        var $this=$(obj);
        var sno=$this.parent().siblings(".sno").html();
        $.ajax({
            type:"post",
            url:"/student/getStudentByNum",
            async:true,
            dataType:"json",
            data:{"s_num":sno},
            success:function(data){
                $("#s_name").html(data.s_name);
                $("#s_no").html(data.s_num);
                $("#s_sex").html(data.s_sex);
                $("#s_aca").html(data.s_acd);
                $("#s_maj").html(data.s_maj);
                $("#s_birth").html(data.s_birth);
                $("#s_tel").html(data.s_tel);
                $("#s_mail").html(data.s_mail);
                $("#s_qq").html(data.s_qq);
                $("#s_power").html(data.s_power);
                $("#d_name").html(data.d_name);
                $("#p_name").html(data.p_name);
            }
        });
    }

    //点击用户信息的关闭按钮
    $(".userInfo-close").click(function(){
        $(".lookMore").hide();
    })

    //重置密码
    //点击重置密码，该对应同学的密码改成学号
    function resetPassword(obj){
        var $this=$(obj);
        var u_number=$this.parent().siblings(".sno").html();
        var password=u_number;
        $.ajax({
            type:"post",
            url:"/user/updatePwd",
            async:true,
            data:{
                "u_number":u_number,
                "password":password
            },
            success:function(){
                $("#user-list").html("");
                usermanagement.init();
            }
        });
    }

    //点击查询,可以根据学号查询，也可以根据部门名称查询

    $(".search_btn").click(function(){
        var searchText=$(".search_input").val();
        console.log(searchText);
        //根据学号查询
        var re=/^\d{10}$/;

        if(searchText == null || searchText == ""){
            $("#user-list").html("");
            usermanagement.init();
        }
        else if(re.test(searchText)){
            $.ajax({
                type:"post",
                url:"/user/getUserByNum",
                async:true,
                data:{"u_number":searchText},
                dataType:"json",
                success:function(data){
                    $("#user-list").html("");
                        var power = "";
                        if (data.u_power == "1") {
                            power = "主席";
                        }
                        else if (data.u_power == "2") {
                            power = "部长";
                        }
                        else if(data.u_power == "3"){
                            power = "干事";
                        }
                        else if (data.u_power == "4") {
                            power = "学生";
                        }
                        var $tr = '<tr><td>' + (data.username) + '</td><td>' + (data.password) + '</td><td class="sno">' + (data.u_number) + '</td><td>' + (data.u_mail) + '</td><td>' + (power) + '</td><td><a href="javascript:void(0);" onclick="lookMore(this)" class="lookBtn"><i class="layui-icon">&#xe60a;</i>查看</a><a href="javascript:void(0);" onclick="sureUpdate(this)" class="updateBtn"><i class="layui-icon">&#xe642;</i>编辑</a><a href="javascript:void(0);" onclick="resetPassword(this)" class="resetBtn"><i class="layui-icon">&#xe620;</i>重置密码</a></td></tr>'
                        $("#user-list").append($tr);
                }
            });
        }else{
            alert("学号格式错误！")
        }
    })
</script>
</body>
</html>