<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/5/1 0001
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生会人员管理</title>
    <link rel="stylesheet" href="/layui/css/layui.css"/>
    <script src="/jquery/dist/jquery.js"></script>
    <script src="/layui/lay/dest/layui.all.js"></script>
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
            /*margin-top: -4px;*/
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

        /*下拉框样式*/
        .layui-input-block {
            margin-left: 0;
        }
        .layui-input-block select {
            height: 38px;
            line-height: 38px;
            width: 79%;
        }
        .deletePeo {
            background-color: #ffa50094;
            padding: 5px 3px;
            border-radius: 3px;
            color: #FFFFFF;
            margin-right: 5px;
        }
        .deletePeo:hover {
            color: #FFFFFF;
        }
    </style>
</head>
<body class="childrenBody">
<div class="peoManagement">
    <blockquote class="layui-elem-quote">
        <div class="layui-input-inline">
            <!--<div class="layui-form-item">-->
            <!--<label class="layui-form-label">选择框</label>-->
            <div class="layui-input-block">
                <select name="city" lay-verify="required" id="department">
                    <c:forEach items="${departmentList}" var="department">
                        <option value="${department.d_name}">${department.d_name}</option>
                    </c:forEach>
                </select>
                <a class="layui-btn search_btn">查询</a>
            </div>
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
            <th>姓名</th>
            <th>学号</th>
            <th>部门</th>
            <th>职位</th>
            <th>联系方式</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="people-list"></tbody>
    </table>
</div>

<!--查看更多页面-->
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
<script>
    //渲染页面
    var peoManagement=(function(){
        function init(){
            render();
        }

        function render(){
            $.ajax({
                type:"post",
                url:"/student/getPeoStudent",
                async:true,
                dataType:"json",
                success:function(data){
                    $.each(data, function (i, data) {
                        var $tr='<tr><td>'+(data.s_name)+'</td><td class="sno">'+(data.s_num)+'</td><td>'+(data.d_name)+'</td><td>'+(data.p_name)+'</td><td>'+(data.s_tel)+'</td><td><a href="javascript:void(0);" onclick="lookMore(this)" class="lookBtn"><i class="layui-icon">&#xe60a;</i>查看</a><c:if test="${user.u_power ==1 || user.u_power == 2 || user.u_power == 0}"><a href="javascript:void(0);" onclick="deletePeo(this)" class="deletePeo"><i class="layui-icon">&#xe640;</i>删除</a></c:if></td></tr>'
                        $("#people-list").append($tr);
                    })
                }

            });
        }

        return {
            init:init
        }

    })();

    peoManagement.init();
</script>
<script>
    //点击查看按钮，查看那个同学的学生表中的信息
    function lookMore(obj){
        $(".lookMore").show();
        var $this=$(obj);
        var s_no=$this.parent().siblings(".sno").html();
        $.ajax({
            type:"post",
            url:"/student/getStudentByNum",
            async:true,
            dataType:"json",
            data:{"s_num":s_no},
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

    //点击关闭查看用户信息按钮
    $(".userInfo-close").click(function(){
        $(".lookMore").hide();
    })

    //点击删除按钮
    function deletePeo(obj){
        var $this=$(obj);
        var s_no=$this.parent().siblings(".sno").html();
        var d_name = "";
        var p_name = "";
        $.ajax({
            type:"post",
            url:"/student/deletePeo",
            async:true,
            data:
                {
                    "s_num":s_no,
                    "d_name":d_name,
                    "p_name":p_name

                },
            success:function(){
                $("#people-list").html("");
                peoManagement.init();
            }
        });
    }

    //通过下拉框的值的改变来查找部门
    //点击查找的时候，获取下拉框的值
    $(".search_btn").click(function(){
        var d_name=$("#department").val();
        $.ajax({
            type:"post",
            url:"/student/getStudentByDep",
            async:true,
            data:{
              "d_name":d_name
            },
            dataType:"json",
            success:function(data){
                $("#people-list").html("");
                $.each(data, function (i, data) {
                    var $tr='<tr><td>'+(data.s_name)+'</td><td class="sno">'+(data.s_num)+'</td><td>'+(data.d_name)+'</td><td>'+(data.p_name)+'</td><td>'+(data.s_tel)+'</td><td><a href="javascript:void(0);" onclick="lookMore(this)" class="lookBtn"><i class="layui-icon">&#xe60a;</i>查看</a></td></tr>'
                    $("#people-list").append($tr);
                })
            }

        });

    })

</script>

</body>
</html>