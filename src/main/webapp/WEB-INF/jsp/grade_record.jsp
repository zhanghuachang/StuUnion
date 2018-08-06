<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/28 0028
  Time: 10:45
  To change this template use File | Settings | File Templates.
  加分记录
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        .layui-elem-quote {
            padding: 10px;
        }
        .layui-elem-quote {
            overflow: hidden;
        }
        #grade_class {
            width: 150px;
            height: 38px;
        }
        .layui-input-block input {
            width: 40%;
        }
        .summary {
            overflow: hidden;
            float: right;
        }
        .summary .layui-input-block {
            float: left;
            margin-left: 0;
            width: 90px;
        }
        .summary .layui-input-block label {
            padding: 9px 5px;
            width: 38px;
        }
    </style>
</head>
<body class="childrenBody">
    <blockquote class="layui-elem-quote">
        <div class="layui-input-inline">
            <select id="grade_class">
                <option value="全部">全部</option>
                <option value="签到">签到</option>
                <option value="参与">参与</option>
                <option value="组织">组织</option>
                <option value="获奖">获奖</option>
            </select>
        </div>

        <div class="summary">
        <div class="layui-input-block">
            <label for="gra_sign" class="layui-form-label">签到</label>
            <input type="text" class="layui-input" name="gra_sign" id="gra_sign" disabled>
        </div>
        <div class="layui-input-block">
            <label for="gra_join" class="layui-form-label">参与</label>
            <input type="text" class="layui-input" name="gra_join" id="gra_join" disabled>
        </div>
        <div class="layui-input-block">
            <label for="gra_ora" class="layui-form-label">组织</label>
            <input type="text" class="layui-input" name="gra_ora" id="gra_ora" disabled>
        </div>
        <div class="layui-input-block">
            <label for="gra_prize" class="layui-form-label">获奖</label>
            <input type="text" class="layui-input" name="gra_prize" id="gra_prize" disabled>
        </div>
            <div class="layui-input-block">
                <label for="gra_sum" class="layui-form-label">总分</label>
                <input type="text" class="layui-input" name="gra_sum" id="gra_sum" disabled>
            </div>
        </div>
    </blockquote>
<div class="layui-form news_list">
    <table class="layui-table">
        <colgroup>
            <col width="40%">
            <col width="30%">
            <col width="15%">
            <col width="15%">
        </colgroup>
        <thead>
        <tr>
            <th>活动名称</th>
            <th>活动时间</th>
            <th>加分类型</th>
            <th>分值</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
</div>
<div id="page"></div>
<script type="text/javascript" src="../../layui/layui.js"></script>
<script type="text/javascript" src="../../jquery/dist/jquery.js"></script>
<script type="text/javascript" src="../../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script type="text/javascript">
    layui.config({
        base : "js/"
    }).use(['layer','jquery'],function(){
        layer = parent.layer === undefined ? layui.layer : parent.layer,
            laypage = layui.laypage,
            $ = layui.jquery;

        //渲染页面板块
        $(function(){

            $.ajax({
                type:"post",
                url : "/grade/getGradeByNum",
                async : true,
                dataType :"json",
                success:function(data){
                    $.each(data, function(i,data) {
                        var $tr = '<tr>'
                            +'<td>'+(data.a_name)+'</td>'
                            +'<td>'+(data.g_time)+'</td>'
                            +'<td>'+(data.g_class)+'</td>'
                            +'<td>'+(data.g_value)+'</td>'
                            +'</tr>';
                        $("tbody").append($tr);

                    })
                }
            });

            $.ajax({
                type:"post",
                url:"/grade/getAllPrize",
                async : true,
                dataType :"json",
                success:function (data) {

                    if (data.gra_sign == null){
                        $("#gra_sign").val(0);
                    }else {
                        $("#gra_sign").val(data.gra_sign);
                    }

                    if (data.gra_join == null){
                        $("#gra_join").val(0);
                    }else {
                        $("#gra_join").val(data.gra_join);
                    }

                    if (data.gra_ora == null){
                        $("#gra_ora").val(0);
                    }else {
                        $("#gra_ora").val(data.gra_ora);
                    }

                    if (data.gra_prize == null){
                        $("#gra_prize").val(0);
                    }else {
                        $("#gra_prize").val(data.gra_prize);
                    }

                    if (data.gra_sum == null){
                        $("#gra_sum").val(0);
                    }else {
                        $("#gra_sum").val(data.gra_sum);
                    }
                }
            })

            $("#grade_class").change(function () {
                var g_class=$("#grade_class").val();
                if (g_class == "全部")
                    window.location.reload();
                else
                    $.ajax({
                        url:"/grade/getGradeByClass",
                        type:"POST",
                        data:{"g_class":g_class},
                        dataType:"json",
                        success:function (data) {
                            $("tbody").html("");
                            $.each(data, function(i,data) {
                                var $tr = '<tr>'
                                    +'<td>'+(data.a_name)+'</td>'
                                    +'<td>'+(data.g_time)+'</td>'
                                    +'<td>'+(data.g_class)+'</td>'
                                    +'<td>'+(data.g_value)+'</td>'
                                    +'</tr>';
                                $("tbody").append($tr);
                            })
                        }
                    })
            })

        })




    })
</script>
</body>
</html>
