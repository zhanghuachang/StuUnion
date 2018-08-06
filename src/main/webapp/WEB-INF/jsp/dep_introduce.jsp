<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/30 0030
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>

        .layui-elem-quote .form-group {
            overflow: hidden;
            margin-bottom: 0px;
        }
        .form-group label{
            float: left;
            font-size: 18px;
            font-weight: normal;
            width: 120px;
            height: 34px;
            line-height: 34px;
            padding-left: 0;
        }
        .form-group select {
            float: left;
            width: 30%;
        }
    </style>
    <link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/layui/css/layui.css"/>
    <script src="/jquery/dist/jquery.js"></script>
    <script src="/layui/lay/dest/layui.all.js"></script>
    <script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<blockquote class="layui-elem-quote">
    <div class="form-group">
        <label class="col-md-2 control-label">请选择部门</label>
        <select class="form-control col-md-10">
            <c:forEach items="${departmentList}" var="department">
                <option value="${department.d_name}">${department.d_name}</option>
            </c:forEach>
        </select>
    </div>
</blockquote>
<div class="content" style="padding: 20px">

</div>

<script>
    $(function(){

        var d_name=$("select").val();
        $.ajax({
            type:"post",
            url:"/department/getDepartmentByName",
            async:true,
            data:{"d_name":d_name},
            dataType:"json",
            success:function(data){
                $(".content").html("");
                $(".content").html(data.d_describe);
            }
        });


        //根据下拉框里面的值，拿到后台给的部门简介
        $("select").change(function(){
//					console.log($("select").val());
            var d_name=$("select").val();
            $.ajax({
                type:"post",
                url:"/department/getDepartmentByName",
                async:true,
                data:{"d_name":d_name},
                dataType:"json",
                success:function(data){
                    $(".content").html("");
                    $(".content").html(data.d_describe);
                }
            });
        })
    });
</script>
</body>
</html>