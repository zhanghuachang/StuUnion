<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/25 0025
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <script src="/jquery/dist/jquery.js"></script>
    <style>
        /*.pic {
            width: 100%;
            height: 100%;
        }*/
        .container {
            margin-left:0px;
            margin-right: 0px;
            width: 100%;
        }
        .dixuelou {
            width: 10px;
            height: 10px;
            background-color: #00000087;
            display: block;
            border: 3px solid #E2E2E2;
            border-radius:50% ;
            position: absolute;
            top: 130px;
            left: 110px;
        }
        .daxuelu {
            width: 10px;
            height: 10px;
            background-color: #00000087;
            display: block;
            border: 3px solid #E2E2E2;
            border-radius:50% ;
            position: absolute;
            top: 200px;
            left: 670px;
        }
        .xiyuan,.blou{
            width: 100px;
            height: 100px;
            background-color: #00000087;
            border: 3px solid #FFFFFF;
            border-radius: 5px;
            position: absolute;
            top: 80px;
            left: 70px;
            text-align: center;
            display: none;
        }
        .xiyuan h4,.xiyuan p {
            color: #F2F2F2;
        }
        .xiyuan h4 {
            margin-top: 20px;
            font-size: 17px;
        }
        .blou {
            top: 140px;
            left: 630px;
        }
        .blou h4,.blou p {
            color: #F2F2F2;
        }
        .blou h4 {
            margin-top: 20px;
            font-size: 17px;
        }

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
<!--<div class="tab">
    <ul>
        <li class="active">三大导航</li>
        <li>最新通知</li>
    </ul>
</div>-->
<!--map部分-->
<div class="container">
    <div class="pic">
        <img src="images/map.jpg" width="98%" height="460px"/>
    </div>
    <a href="javascript:void(0)" class="dixuelou"></a>
    <a href="javascript:void(0)" class="daxuelu"></a>
</div>
<div class="xiyuan">
    <h4>朝天门火锅</h4>
    <p>云林路12号</p>
</div>
<div class="blou">
    <h4>信息科学楼</h4>
    <p>大学路8号</p>
</div>

<!--最新通知-->
<!--<div class="activity-list">
    <form class="layui-form">
        <blockquote class="layui-elem-quote">
            <div class="layui-inline">
                <h4>活动通知</h4>
            </div>
        </blockquote>
        <table class="layui-table msg_box" lay-skin="line">
            <colgroup>
                <col width="30%">
                <col width="15%"/>
                <col width="15%">
                <col width="15%">
                <col>
            </colgroup>
            <tbody id="avticity-list"></tbody>
        </table>
    </form>
</div>
    <div id="sign-situation">
        <form class="layui-form">
            <blockquote class="layui-elem-quote sign-situation-block">
                <h4>报名情况</h4>
                <a class="sign-situation-close" >x</a>
            </blockquote>
            <table class="layui-table" lay-skin="line">
                <colgroup>
                    <col width="33%">
                    <col width="33%">
                    <col width="33%">
                    <col>
                </colgroup>
                <thead>
                    <tr>
                        <th>
                            姓名
                        </th>
                        <th>
                            班级
                        </th>
                        <th>
                            学院
                        </th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>

        </form>
    </div>-->

<!--查看详情页-->
<!--<div id="activity-detail">
    <form class="layui-form">
        <blockquote class="layui-elem-quote activity-detail-block">
            <h4>活动详情</h4>
            <a class="activity-detail-close" >x</a>
        </blockquote>
    </form>
    <div class="activity-detail-content"></div>
</div>-->

<!--立即报名页面-->
<!--<div class="sign_up_table">
    <div class="mask"></div>
    <div class="sign_up_content">
        <div class="sign_up_header">
            <a class="sign_up_table_close">x</a>
            <h3>立即报名</h3>
        </div>
    <div class="sign_up_body">
        <form role="form" class="sign_up_form" method="post" action="">
            <input type="hidden"  class="form-control" placeholder="活动名称" name="a_name"/>
            <div class="form-group" id="s_name">
                <input type="text"  class="form-control s_name" placeholder="请输入姓名" name="s_name"/>
                <i class=""></i>
            </div>
            <div class="form-group" id="s_no">
                <input type="text"  class="form-control s_no" placeholder="请输入学号" name="s_no"/>
            </div>
            <div class="form-group" id="s_sex">
                <input type="text"  class="form-control s_sex" placeholder="请输入性别" name="s_sex"/>
            </div>
            <div class="form-group" id="s_aca">
                <input type="text"  class="form-control s_aca" placeholder="请输入学院" name="s_aca"/>
            </div>
            <div class="form-group" id="s_class">
                <input type="text"  class="form-control s_class" placeholder="请输入班级" name="s_class"/>
            </div>
            <div class="form-group" id="s_phone">
                <input type="text" class="form-control s_phone" placeholder="请输入电话" name="s_phone"/>
            </div>
            <div class="form-group" id="s_email">
                <input type="email" class="form-control s_email" placeholder="请输入邮箱" name="s_email"/>
            </div>
            <button class="btn submit" type="submit">提交</button>
        </form>
    </div>
</div>
</div>-->

<script>

    //点击西苑小吃街a标签,弹出div盒子
    $(".dixuelou").click(function(){
        $(".xiyuan").show(300).delay(1000).hide(300);
    })
    //点击大学路a标签弹出div盒子
    $(".daxuelu").click(function(){
        $(".blou").show(300).delay(1000).hide(300);
    })
</script>
</body>
</html>