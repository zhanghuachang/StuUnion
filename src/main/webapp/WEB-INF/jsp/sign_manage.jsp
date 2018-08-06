<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/30 0030
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>加分历史</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="//at.alicdn.com/t/font_eolqem241z66flxr.css" media="all" />
    <style>

        td{
            text-align: center;
        }
        select{
            height: 38px;
        }
        .layui-table tr:hover, .layui-table[lay-even] tr:nth-child(even) {
            background-color: transparent;
        }
        input{
            border: none;
        }
        input[type = "radio"]{
            margin-left: 20px;
        }
        textarea{
            border: none;
            resize: none;
        }
        td{
            text-align: center;
        }
        .rec_detail {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: white;
            display: none;
        }
        /*搜索框*/
        .layui-elem-quote {
            overflow: hidden;
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
    </style>
</head>
<body class="childrenBody">
<blockquote class="layui-elem-quote">
    <div class="layui-input-inline">
        <input type="text" value="" placeholder="请输入学号或者部门名称查询" class="layui-input search_input">
        <a class="layui-btn search_btn">查询</a>
    </div>
</blockquote>

<div class="sign-list">
<div class="layui-form ">
    <table class="layui-table">
        <colgroup>
            <col>
            <col>
            <col>
            <col>
            <col>
            <col width="10%">
            <col>
            <col width="30%">
        </colgroup>
        <thead>
        <tr>
            <th style="text-align: center;">姓名</th>
            <th style="text-align: center;">性别</th>
            <th style="text-align: center;">学号</th>
            <th style="text-align: center;">第一志愿</th>
            <th style="text-align: center;">第二志愿</th>
            <th style="text-align: center;">是否服从调剂</th>
            <th style="text-align: center;">部门</th>
            <th style="text-align: center;">操作</th>
        </tr>
        </thead>
        <tbody class="recruitList"></tbody>
    </table>
</div>
</div>
<div id="page"></div>
<div class="rec_detail">
    <button class="layui-btn" id="recruit_apply_btn" style="margin-top: 10px; margin-left: 880px;">返回招新列表</button>
    <table class="layui-table" style="width: 800px; margin-left: 200px; ">
        <colgroup>
            <col width="25%">
            <col>
            <col width="25%">
            <col>
        </colgroup>
        <tbody>
        <tr>
            <td>姓名</td>
            <td><span name="sig_name" id="sign_name"></span></td>
            <td>性别</td>
            <td><span name="sig_sex" id="sign_sex"></span></td>
        </tr>
        <tr>
            <td>民族</td>
            <td><span name="sig_nation" id="sign_nation"></span></td>
            <td>学号</td>
            <td><span name="sig_no" id="sign_no"></span></td>
        </tr>
        <tr>
            <td>第一志愿</td>
            <td><span name="sig_first_department" id="sign_first_department"></span></td>
            <td>第二志愿</td>
            <td><span name="sig_second_department" id="sign_second_department"></span></td>
        </tr>
        <tr>
            <td>生日</td>
            <td><span name="sig_birth" id="sign_birth"></span></td>
            <td>邮箱</td>
            <td><span name="sig_mail" id="sign_mail"></span></td>
        </tr>
        <tr>
            <td>特长</td>
            <td><span name="sig_talent" id="sign_talent"></span></td>
            <td>是否服从调剂</td>
            <td><span name="sig_adjust" id="sign_adjust"></span></td>
        </tr>
        <tr>
        </tr>
        <tr>
            <td style="padding: 0;">你对学生会的<br />认识和建议</td>
            <td colspan="3" style="height: 600px;"><textarea style="height: 100%;width: 100%;" name="sig_reason" id="sign_reason" >${sign.sig_reason}</textarea></td>
        </tr>
        </tbody>
    </table>
</div>
<script type="text/javascript" src="/layui/layui.js"></script>
<script type="text/javascript" src="/jquery/dist/jquery.js"></script>
<script type="text/javascript" src="/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script type="text/javascript">
        //渲染页面板块
        var recruitList = (function(){
            function init(){
                render();
            }
            function render(){
                $.ajax({
                    type:"post",
                    url : "/sign/getAllSign",
                    async : true,
                    dataType :"json",
                    success:function(data){
                        $.each(data, function(i,data) {
                            var $tr = '<tr>'
                                +'<td>'+(data.sig_name)+'</td>'
                                +'<td>'+(data.sig_sex)+'</td>'
                                +'<td class="sig_no">'+(data.sig_num)+'</td>'
                                +'<td>'+(data.sig_first_department)+'</td>'
                                +'<td>'+(data.sig_second_department)+'</td>';
                            if(data.sig_adjust == 1)
                                $tr+='<td>是</td>';
                            else
                                $tr+='<td>否</td>';
                            if(data.sig_status == 0)
                                $tr+='<td class="sig_status" style="color:red;">未分配</td>';
                            else
                                $tr+='<td class="sig_status">已分配</td>';
                            $tr =$tr+'<td>'
                                +'<select name="final_dep" id="final_department" style="display: inline;">'
                                +'<c:forEach items="${departmentList}" var="department"><option>${department.d_name}</option></c:forEach>'
                                +'</select>'
                                +'<a href="javascript:;" onclick="recruit_decide(this)" class="layui-btn layui-btn-normal" id="recruit_decide" style="margin-left:10px;">确认分配</a>'
                                +'<a href="javascript:;" onclick="signDetail(this)" class="layui-btn" id="recruit_detail">查看详情</a>'
                                +'</td>'
                                +'</tr>';
                            $(".recruitList").append($tr);
                        })
                    }
                });
            }
            return{
                init : init
            }

        })();
        recruitList.init();
</script>
<script>

        //点击查看详情按钮 
        //点击之后把这个学生的学号传给你

        function signDetail(obj) {
            var $this = $(obj);

            var s_no=$this.parent().siblings(".sig_no").html();

            $.ajax({
                type:"post",
                url:"/sign/getSignByNum",
                dataType:"json",
                data:{
                    "sig_num" : s_no
                },
                success:function(data){
                        $(".rec_detail").show();
                        $("#sign_name").html(data.sig_name);
                        $("#sign_sex").html(data.sig_sex);
                        $("#sign_nation").html(data.sig_nation);
                        $("#sign_no").html(data.sig_num);
                        $("#sign_tel").html(data.sig_tel);
                        $("#sign_mail").html(data.sig_email);
                        $("#sign_first_department").html(data.sig_first_department);
                        $("#sign_second_department").html(data.sig_second_department);
                        $("#sign_birth").html(data.s_birth);
                        $("#sign_adjust").html(data.sig_adjust);
                        $("#sign_talent").html(data.sig_talent);
                        $("#sign_reason").html(data.sig_reason);
                }
            })
        }

        //点击返回招新列表按钮
        $("#recruit_apply_btn").click(function(){
            $(".rec_detail").css("display","none");
        });

        //点击分配部门按钮
        //如果状态栏显示未分配，把学号，要分配的部门，权限名为干事传给你,后台将状态改为1，重载界面
        //如果状态栏显示已分配，则提醒改学生已被分配部门

        function recruit_decide(obj) {
            var $this = $(obj);
            var sig_status = $this.parents("tr").children("td.sig_status").text();
            if(sig_status == "未分配")
            {
                var final_dep = $("#final_department").find("option:selected").text();
                var s_no = $this.parents("tr").children("td.sig_no").text();
                var p_name = "干事";
                console.log(final_dep);
                console.log(s_no);
                console.log(p_name);
                var conf = confirm("确定将该学生分配至"+(final_dep)+"吗？");
                if(conf == true)
                {
                    $(function(){
                        $.ajax({
                            type:"post",
                            url:"/student/updateDep",
                            async:true,
                            dataType:"json",
                            data:{
                                "s_num":s_no,
                                "d_name":final_dep,
                                "p_name":p_name
                            },
                            success:function(){
                                alert("分配成功！");
                                $(".recruitList").html("");
                                recruitList.init();
                            }
                        });

                    })
                }
            }
            else{
                alert("该学生已被分配部门！");
            }
        }

//        点击搜索框，根据部门名称或者学号查找
        $(".search_btn").click(function(){
            var searchText=$(".search_input").val();
            console.log(searchText);
            //根据学号查询
            var re=/^\d{10}$/;

            if (searchText == null || searchText == ""){
                $(".recruitList").html("");
                recruitList.init();
            }
            else if(re.test(searchText)){
                $.ajax({
                    type:"post",
                    url:"/sign/getSignByNum",
                    async:true,
                    data:{"sig_num":searchText},
                    dataType:"json",
                    success:function(data){
                        $(".recruitList").html("");
                            var $tr = '<tr>'
                                +'<td>'+(data.sig_name)+'</td>'
                                +'<td>'+(data.sig_sex)+'</td>'
                                +'<td class="sig_no">'+(data.sig_num)+'</td>'
                                +'<td>'+(data.sig_first_department)+'</td>'
                                +'<td>'+(data.sig_second_department)+'</td>';
                            if(data.sig_adjust == 1)
                                $tr+='<td>是</td>';
                            else
                                $tr+='<td>否</td>';
                            if(data.sig_status == 0)
                                $tr+='<td class="sig_status" style="color:red;">未分配</td>';
                            else
                                $tr+='<td class="sig_status">已分配</td>';
                            $tr =$tr+'<td>'
                                +'<select name="final_dep" id="final_department" style="display: inline;">'
                                +'\'<c:forEach items="${departmentList}" var="department"><option>${department.d_name}</option></c:forEach>\''
                                +'</select>'
                                +'<a href="javascript:;" onclick="recruit_decide(this)" class="layui-btn layui-btn-normal" id="recruit_decide" style="margin-left:10px;">确认分配</a>'
                                +'<a href="javascript:;" onclick="signDetail(this)" class="layui-btn" id="recruit_detail">查看详情</a>'
                                +'</td>'
                                +'</tr>';
                            $(".recruitList").append($tr);
                    }
                });
            }else{
                $.ajax({
                    type:"post",
                    url:"/sign/getSignByDep",
                    async:true,
                    data:{"d_name":searchText},
                    dataType:"json",
                    success:function(data){
                        $(".recruitList").html("");
                        $.each(data, function(i,data) {
                            var $tr = '<tr>'
                                +'<td>'+(data.sig_name)+'</td>'
                                +'<td>'+(data.sig_sex)+'</td>'
                                +'<td class="sig_no">'+(data.sig_num)+'</td>'
                                +'<td>'+(data.sig_first_department)+'</td>'
                                +'<td>'+(data.sig_second_department)+'</td>';
                            if(data.sig_adjust == 1)
                                $tr+='<td>是</td>';
                            else
                                $tr+='<td>否</td>';
                            if(data.sig_status == 0)
                                $tr+='<td class="sig_status" style="color:red;">未分配</td>';
                            else
                                $tr+='<td class="sig_status">已分配</td>';
                            $tr =$tr+'<td>'
                                +'<select name="final_dep" id="final_department" style="display: inline;">'
                                +'\'<c:forEach items="${departmentList}" var="department"><option>${department.d_name}</option></c:forEach>\''
                                +'</select>'
                                +'<a href="javascript:;" onclick="recruit_decide(this)" class="layui-btn layui-btn-normal" id="recruit_decide" style="margin-left:10px;">确认分配</a>'
                                +'<a href="javascript:;" onclick="signDetail(this)" class="layui-btn" id="recruit_detail">查看详情</a>'
                                +'</td>'
                                +'</tr>';
                            $(".recruitList").append($tr);
                        })
                    }
                });
            }
        })


</script>
</body>
</html>