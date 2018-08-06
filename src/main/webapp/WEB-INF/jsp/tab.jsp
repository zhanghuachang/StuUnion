<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/30 0030
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="/layui/css/layui.css"/>
    <link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script src="/jquery/dist/jquery.min.js"></script>
    <script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="/layui/lay/dest/layui.all.js"></script>
    <style>
        /*导航部分*/
        .tab ul {
            width: 100%;
            list-style: none;
            padding-left: 0px;
            height: 40px;
            border-bottom: 1px solid #E2E2E2;
            margin-bottom: 10px;
        }
        .tab ul li {
            font-size: 14px;
            display: inline-block;
            padding: 0 10px;
            vertical-align: middle;
            transition: all 0.2s;
            -webkit-transition: all 0.2s;
            -moz-transition: all 0.2s;
            line-height: 40px;
            min-width: 65px;
            cursor: pointer;
        }
        .active {
            border-bottom: 3px solid #5FB878;
            color: #009688;
        }
    </style>
</head>
<body>
<div class="tab">
    <ul>
        <li class="active">三大导航</li>
        <li>最新通知</li>
    </ul>
</div>
<div class="content"></div>
<script src="/jquery/dist/jquery.js"></script>
<script>

    //默认拿到的active类的html值为三大导航
    console.log($(".active").html());
    if($(".active").html()=="三大导航"){
        $.ajax({
            type:"get",
            url:"/map",
            async:true,
            success:function(data){
                $(".content").html(data);
            }
        });
    }


    // 		点击哪个li,哪个li上面就加上active类
    $("li").click(function(){
        $(this).addClass("active");
        $(this).siblings("li").removeClass("active");
        console.log($(".active").html());
        if($(".active").html()==="最新通知"){
            $.ajax({
                type:"get",
                url:"/message",
                async:true,
                success:function(data){
                    $(".content").html(data);
                }
            });
        }
        else if($(".active").html()==="三大导航"){
            $.ajax({
                type:"get",
                url:"/map",
                async:true,
                success:function(data){
                    $(".content").html(data);
                }
            });
        }

    })


    // 		当点击的是三大导航的时候(即有active类的li的html为三大导航的时候)，发送ajax请求拿到三大导航页面
    // 		$(".active").html();
    // 		console.log($(".active").html());


</script>

</body>
</html>

