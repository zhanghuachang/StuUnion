<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/23 0023
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>活动列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.css"/>

    <style>
        .activity-list {
            /*display: none;*/
        }
        .activity-list .layui-inline h4 {
            margin: 0;
            font-size: 20px;
            color: #999;
        }
        .a_info img {
            float: left;
            margin-right: 8px;
        }
        .a_detail_info {
            margin-top: 12px;
        }
        .a_detail_info h2 {
            font-size: 16px;
        }
        .a_detail_info p {
            color: #C9C9C9;
        }
        .activity-situation-link {
            background-color: #0080006e;
            font-size: 14px;
            padding: 5px;
            border-radius: 3px;
            color: #FFFFFF;
        }
        .activity-situation-link:hover {
            color: #FFFFFF;
            text-decoration: none;
        }
        .activity-situation {
            display: none;
            position: absolute;
            top: 0;
            left: 0;
            width: 99%;
            margin-left: 8px;
            margin-top: 8px;
        }
        .activity-situation-block {
            position: relative;
        }
        .activity-situation .activity-situation-block h4 {
            /*float: left;*/
            margin: 0;
        }
        .activity-situation-close {
            /*display: inline-block;*/
            position: absolute;
            right: 20px;
            top: 15px;
            float: right;
            cursor: pointer;
            text-decoration: none;
            font-size: 20px;
            font-weight: bold;
            color: #999999;
        }
        .activity-situation-close:hover {
            text-decoration: none;
        }
        .activity-situation tr td {
            font-weight: normal;
        }
        /*阴影部分样式*/
        .mask {
            position: absolute;
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
            background-color: #000000;
            opacity: 0.3;
            display: none;
        }
        /*二维码样式*/
        #qrcodeCanvas {
            position: absolute;
            top: 130px;
            left: 50%;
            margin-left: -140px;
        }
        /*日期input样式*/
        .layui-input-block {
            margin-left: 0px;
            width: 500px;
        }
        .layui-input {
            width: 100%;
            float: left;
        }
        .search_btn:hover {
            text-decoration: none;
        }
    </style>
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
    <script type="text/javascript" src="/layui/lay/dest/layui.all.js"></script>
</head>
<body class="childrenBody">
<div class="activity-list">
    <form class="layui-form">
        <blockquote class="layui-elem-quote">
        <div class="layui-input-inline">
            <!--<div class="layui-form-item">-->
            <!--<label class="layui-form-label">选择框</label>-->
            <div class="layui-input-inline">
                <input type="text" name="a_time" class="layui-input start_time" placeholder="起始时间" lay-verify="date" onclick="layui.laydate({elem:this})">
            </div>
            <div class="layui-input-inline">
                <input type="text" name="a_time" class="layui-input end_time" placeholder="结束时间" lay-verify="date" onclick="layui.laydate({elem:this})">
            </div>
            <a class="layui-btn search_btn">查询</a>
        </div>
    </blockquote>
        <table class="layui-table msg_box" lay-skin="line">
            <colgroup>
                <col width="45%">
                <col width="25%">
                <col width="15%">
                <col>
            </colgroup>
            <tbody id="avticity-list"></tbody>
        </table>
    </form>
</div>
<div class="activity-situation">
    <form class="layui-form">
        <blockquote class="layui-elem-quote activity-situation-block">
            <!--<div class="layui-inline">-->
            <h4>活动概况</h4>
            <a class="activity-situation-close" >x</a>
            <!--</div>-->
        </blockquote>
        <h3>承办人员</h3>
        <table class="layui-table" lay-skin="line">
            <colgroup>
                <col width="33%">
                <col width="33%">
                <col width="33%">
                <col>
            </colgroup>
            <thead>
            <th>
                姓名
            </th>
            <th>
                学号
            </th>
            <th>
                班级
            </th>
            </thead>
            <tbody id="activity-department">
            </tbody>
        </table>
        <h3>获奖人员</h3>
        <table class="layui-table" lay-skin="line">
            <colgroup>
                <col width="33%">
                <col width="33%">
                <col width="33%">
                <col>
            </colgroup>
            <th>
                姓名
            </th>
            <th>
                学号
            </th>
            <th>
                班级
            </th>
            <tbody id="activity-getGrade">
            </tbody>
        </table>
        <h3>参加人员</h3>
        <table class="layui-table" lay-skin="line">
            <colgroup>
                <col width="33%">
                <col width="33%">
                <col width="33%">
                <col>
            </colgroup>
            <tbody id="activity-join">
            </tbody>
        </table>
        <h3>签到人员</h3>
        <table class="layui-table" lay-skin="line">
            <colgroup>
                <col width="33%">
                <col width="33%">
                <col width="33%">
                <col>
            </colgroup>
            <th>
                姓名
            </th>
            <th>
                学号
            </th>
            <th>
                班级
            </th>
            <tbody id="activity-sign-in">
            </tbody>
        </table>
    </form>
</div>

<%--阴影部分--%>
<div class="mask"></div>
<%--报名入口二维码--%>
<div id="qrcodeCanvas">
</div>


<script type="text/javascript" src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/jquery.qrcode.js"></script>
    <script type="text/javascript" src="/js/qrcode.js"></script>

<script>

    $(function(){

        var activityList=(function(){

            function init(){
                render();
            }

            function render(){
                $.ajax({
                    type:"post",
                    url:"/activity/activityList",
                    async:true,
                    dataType:"json",
                    success:function(data){
                        $.each(data, function(i,data) {
                            var $tr='<tr><td class="a_info"><img src="/images/activity1.jpg" width="66px" height="66px" style="border-radius:50%"/><div class="a_detail_info"><h2>'+(data.a_name)+'</h2><p>'+(data.d_name)+'</p></td><td>'+(data.a_time)+'</td><td>'+(data.a_class)+'</td><td><a href="javascript:void(0)" a_id = "'+(data.a_id)+'" class="activity-situation-link" onclick="activity_situation(this)";><i class="layui-icon">&#xe64a;</i>活动概况</a><span>&nbsp;&nbsp;</span><a href="javascript:void(0)" a_name = "'+data.a_name+'" onclick="SignIn(this)" class="activity-situation-link" ><i class="layui-icon">&#xe64a;</i>签到入口</a></td></tr>';
                            $("#avticity-list").append($tr);

                        });
                    }
                });
            }

            return {
                init:init
            }

        })();

        activityList.init();

        //点击关闭框活动概况消失
        $(".activity-situation-close").click(function(){
            $(".activity-situation").hide();
            $(".activity-list").show();
        })


    })
</script>
<script>
    //点击活动概况出现活动详情人员
    function activity_situation(obj){
        $("#activity-department").html("");
        $("#activity-getGrade").html("");
        $("#activity-join").html("");
        $("#activity-sign-in").html("");
        var $this=$(obj);
//				alert($this.parent().parent().attr("a_id"));
        var a_id=$this.attr("a_id");
        console.log(a_id);
        $(".activity-situation").show();
        $(".activity-list").hide();
        $.ajax({
            type:"post",
            url:"/grade/getAllGradeListById",
            async:true,
            dataType:"json",
            data:{
                "a_id":a_id
            },
            success:function(data){
                $.each(data, function(i,data) {
                    if(data.g_class=="组织"){
                        var $tr='<tr><td>'+(data.s_name)+'</td><td>'+(data.s_num)+'</td><td>'+(data.s_class)+'</td></tr>';
                        $("#activity-department").append($tr);
                    }
                    else if(data.g_class=="获奖"){
                        var $tr='<tr><td>'+(data.s_name)+'</td><td>'+(data.s_num)+'</td><td>'+(data.s_class)+'</td></tr>';
                        $("#activity-getGrade").append($tr);
                    }
                    else if(data.g_class=="参与"){
                        var $tr='<tr><td>'+(data.s_name)+'</td><td>'+(data.s_num)+'</td><td>'+(data.s_class)+'</td></tr>';
                        $("#activity-join").append($tr);
                    }
                    else if(data.g_class=="签到"){
                        var $tr='<tr><td>'+(data.s_name)+'</td><td>'+(data.s_num)+'</td><td>'+(data.s_class)+'</td></tr>';
                        $("#activity-sign-in").append($tr);
                    }
                });
            }
        });

    }

    /*二维码获取*/
    function SignIn(obj) {

        $('#qrcodeCanvas').html("");

        var $this=$(obj);
        var a_name=$this.attr("a_name");
        var str1 = window.location.href;
        var str2 = "activity/activityListPage";
        var str3 = str1.replace(str2, "");
        var url = str3 + "grade/SignInPage?a_name=" + a_name;
        console.log(url)
        var toUrl = toUtf8(url);
        console.log(toUrl)
        $(".mask").show();
        $("#qrcodeCanvas").show();
        $('#qrcodeCanvas').qrcode({
            text: toUrl
        });
    }
    /*二维码地址转码*/
    function toUtf8(str) {
        var out, i, len, c;
        out = "";
        len = str.length;
        for (i = 0; i < len; i++) {
            c = str.charCodeAt(i);
            if ((c >= 0x0001) && (c <= 0x007F)) {
                out += str.charAt(i);
            } else if (c > 0x07FF) {
                out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
                out += String.fromCharCode(0x80 | ((c >> 6) & 0x3F));
                out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
            } else {
                out += String.fromCharCode(0xC0 | ((c >> 6) & 0x1F));
                out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
            }
        }
        return out;
    }

//    点击阴影部分，二维码消失
    $(".mask").click(function () {
        $("#qrcodeCanvas").hide();
        $(".mask").hide();
    })

    $("#qrcodeCanvas").click(function () {
        event.stopPropagation();
    })

    $(".search_btn").click(function () {
        var start_time=$(".start_time").val();
        var end_time=$(".end_time").val();
        // console.log(start_time);
        // console.log(end_time);
        $.ajax({
            type:"post",
            url : "/activity/searchTime",
            async : true,
            dataType :"json",
            data:{"start_time":start_time,
                   "end_time":end_time
            },
            success:function(data) {
                $("#avticity-list").html("");
                $.each(data, function(i,data) {
                    var $tr='<tr><td class="a_info"><img src="/images/activity1.jpg" width="66px" height="66px" style="border-radius:50%"/><div class="a_detail_info"><h2>'+(data.a_name)+'</h2><p>'+(data.d_name)+'</p></td><td>'+(data.a_time)+'</td><td>'+(data.a_class)+'</td><td><a href="javascript:void(0)" a_id = "'+(data.a_id)+'" class="activity-situation-link" onclick="activity_situation(this)";><i class="layui-icon">&#xe64a;</i>活动概况</a><span>&nbsp;&nbsp;</span><a href="javascript:void(0)" a_name = "'+data.a_name+'" onclick="SignIn(this)" class="activity-situation-link" ><i class="layui-icon">&#xe64a;</i>签到入口</a></td></tr>';
                    $("#avticity-list").append($tr);

                });
            }

        })
    })

</script>
</body>
</html>


