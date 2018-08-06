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
    <meta charset="UTF-8">
    <title>活动通知</title>
    <link rel="stylesheet" href="/layui/css/layui.css"/>
    <link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script src="/jquery/dist/jquery.js"></script>
    <script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="/layui/lay/dest/layui.all.js"></script>
    <style>
        body{
            margin:8px;
        }
        .layui-inline h4 {
            font-size: 20px;
            color: #999999;
        }
        .a_info img {
            float: left;
            margin-right: 5px;
        }
        .a_info h2 {
            font-size: 18px;
            margin-top: 22px;
        }
        .activity-lookMore {
            background-color: #ff9800ad;
            padding: 5px;
            border-radius: 3px;
            color: #FFFFFF;
            text-decoration: none;
        }
        .activity-lookMore:hover {
            color: #FFFFFF;
            text-decoration: none;
        }
        .activity-sign {
            background-color: #00800070;
            padding: 5px;
            border-radius: 3px;
            color: #FFFFFF;
            margin-left: 5px;
            text-decoration: none;
        }
        .activity-sign:hover {
            color: #FFFFFF;
            text-decoration: none;
        }
        .look-situation {
            background-color: #00bcd48c;
            padding: 5px;
            border-radius: 3px;
            color: #FFFFFF;
            margin-right: 5px;
            text-decoration: none;
        }
        .look-situation:hover {
            color: #FFFFFF;
            text-decoration: none;
        }
        /*活动概况*/
        #sign-situation,#activity-detail,.sign_up_table{
            display: none;
            position: absolute;
            top: 0;
            left: 0;
            width: 99%;
            height: 98%;
            margin-left: 8px;
            margin-top: 8px;
            background-color: #FFFFFF;
        }
        .sign-situation-block {
            position: relative;
        }
        #sign-situation .sign-situation-block h4, #activity-detail .activity-detail-block h4{
            /*float: left;*/
            margin: 0;
            font-size: 20px;
            color: #999999;
        }
        .sign-situation-close,.activity-detail-close{
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
        .sign-situation-close:hover {
            text-decoration: none;
        }
        #sign-situation tr td {
            font-weight: normal;
        }
        #sign-situation .layui-form h3 {
            font-size: 18px;
        }
        /*活动详情页*/
        /*#activity-detail {
            display: block;

        }*/
        /*立即报名页面*/
        .sign_up_table {
            /*display: block;*/
        }
        #sign_up_btn {

            background-color: #00800066;
        }
        .sign_up_content {
            position: relative;
            width: 600px;
            background-color: #eee;
            box-sizing: border-box;
            margin: 0 auto;
            margin-top: 30px;
            border-radius: 7px;
        }
        .sign_up_header {
            padding: 25px 25px 10px 25px;
            background-color: #eee;
            border-top-left-radius: 7px;
            border-top-right-radius: 7px;
        }
        .sign_up_table_close {
            float: right;
            font-size: 20px;
            margin-top: -7px;
            cursor: pointer;
            text-decoration: none;
            color: #999999;
        }
        .sign_up_table_close:hover {
            text-decoration: none;
            color: #808080;
        }
        .sign_up_header h3{
            margin-top: 0;
            color: #999999;
        }
        .sign_up_body {
            margin: 10px 25px 30px 30px;
            padding-bottom: 25px;
        }
        .submit {
            width: 95%;
            background-color: #ff000080;
        }
        .sign_up_form input {
            padding: 0 20px;
            height: 50px;
            line-height: 50px;
            font-size: 16px;
            width: 95%;
        }
        .form-group {
            position: relative;

        }
        .form-group i {
            position: absolute;
            right: 10px;
            top: 14px;
        }
        .form-group span {
            margin-left: 5px;
        }
        #sign_up_btn {
            margin-top: 15px;
            float: left;
            margin-left: 15px;
        }

        /*报名成功页面*/
        .success {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #FFFFFF;
            display: none;
        }
        .attendceSuccess {
            margin-top: 200px;
            text-align: center;
        }
        .attendceSuccess i {
            display: inline-block;
            font-size: 25px;
            color: green;
        }
        .attendceSuccess h3 {
            font-size: 24px;
            display: inline-block;
        }
        .close {
            float: right;
            font-size: 30px;
            margin-right: 20px;
        }
    </style>
</head>
<body>
<div class="activity-list">
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
            <a class="sign-situation-close">x</a>
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
                    学号
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
</div>

<!--查看详情页-->
<div id="activity-detail">
    <form class="layui-form">
        <blockquote class="layui-elem-quote activity-detail-block">
            <h4>活动详情</h4>
            <a class="activity-detail-close" >x</a>
        </blockquote>
    </form>
    <div class="activity-detail-content"></div>
</div>

<!--立即报名页面-->
<div class="sign_up_table">
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
                    <input type="text"  class="form-control s_name" placeholder="请输入姓名" value="${student.s_name}" name="s_name"/>
                    <i class=""></i>
                </div>
                <div class="form-group" id="s_no">
                    <input type="text"  class="form-control s_no" placeholder="请输入学号" value="${student.s_num}" name="s_no"/>
                </div>
                <div class="form-group" id="s_sex">
                    <input type="text"  class="form-control s_sex" placeholder="请输入性别" value="${student.s_sex}" name="s_sex"/>
                </div>
                <div class="form-group" id="s_aca">
                    <input type="text"  class="form-control s_aca" placeholder="请输入学院" value="${student.s_acd}" name="s_aca"/>
                </div>
                <div class="form-group" id="s_phone">
                    <input type="text" class="form-control s_phone" placeholder="请输入电话" value="${student.s_tel}" name="s_phone"/>
                </div>
                <div class="form-group" id="s_email">
                    <input type="email" class="form-control s_email" placeholder="请输入邮箱" value="${student.s_mail}" name="s_email"/>
                </div>
                <a href="javascript:void(0);" class="btn submit">提交</a>
            </form>
        </div>
    </div>

    <!--报名成功页面-->
    <div class="success">
        <div class="close">
            <a href="javascript:void(0);">x</a>
        </div>
        <div class="attendceSuccess">
            <i class="layui-icon">&#xe616;</i>
            <h3>恭喜你，报名成功!</h3>

        </div>

    </div>

</div>




<script>

    var activity_link_sign=(function(){

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
                                var $tr='<tr a_id="'+(data.a_id)+'" ><td class="a_info"><img src="/images/activity1.jpg" width="66px" height="66px" style="border-radius:50%"/><div class="a_detail_info"><h2>'+(data.a_name)+'</h2></td><td>'+(data.a_time)+'</td><td>'+(data.a_place)+'</td><td>'+(data.a_class)+'</td><td><a href="javascript:void(0);" class="look-situation" onclick="lookSituation(this);"><i class="layui-icon">&#xe62d;</i>报名情况</a><a href="javascript:void(0)" class="activity-lookMore" onclick="lookMore(this)";><i class="layui-icon">&#xe64a;</i>查看详情</a><a href="javascript:void(0)" class="activity-sign" onclick="SignIn(this)";><i class="layui-icon">&#xe63c;</i>立即报名</a></td></tr>';
                                $("#avticity-list").append($tr);
                            });
                        }


					});
				}

        return {
            init:init
        }


    })();

    activity_link_sign.init();

</script>
<script>

    //显示报名情况
    function lookSituation(obj){
        $("#sign-situation").find("tbody").html("");
        $("#sign-situation").show();
        var $this=$(obj);
        var a_id=$this.parent().parent().attr("a_id");
        var activity_situation=(function(){

            function init(){
                render();
            }

            function render(){
						$.ajax({
							type:"post",
							url:"/activitySign/getActivitySign",
							async:true,
							data:{
								"a_id":a_id
							},
							dataType:"json",
							success:function(data){
                                $.each(data, function(i,data) {
                                    var $tr='<tr><td>'+(data.s_name)+'</td><td>'+(data.s_num)+'</td><td>'+(data.s_acd)+'</td></tr>';
                                    $("#sign-situation").find("tbody").append($tr);

                                });
                            }
						});
            }

            return {
                init:init
            }

        })();

        activity_situation.init();

    }


    //点击关闭活动概况按钮，活动概况消失
    $(".sign-situation-close").click(function(){
        $("#sign-situation").hide();
    })

    //点击查看详情，查看详情页出现
    //从活动申请表里面拿到活动描述的值
    function lookMore(obj){
        $(".activity-detail-content").html("");
        $("#activity-detail").show();
        var $this=$(obj);
        var a_id=$this.parent().parent().attr("a_id");
				$.ajax({
					type:"post",
					url:"/activity/getActivity",
					async:true,
					dataType:"json",
					data:{
						"a_id":a_id
					},
					success:function(data){
                        $(".activity-detail-content").append(data.a_describe);
					}
				});
    }

    //点击关闭活动详情按钮，跳回活动详情页面
    $(".activity-detail-close").click(function(){
        $("#activity-detail").hide();
    })

    //点击立即报名,跳出立即报名页面
    function SignIn(obj){
        var $this=$(obj);
        $(".sign_up_table").show();

        //点击提交按钮，表单提交
        $(".submit").click(function(){
                var a_id=$this.parent().parent().attr("a_id")
                console.log(a_id)
                var s_name=$(".s_name").val();
                var s_no=$(".s_no").val();
                var s_sex=$(".s_sex").val();
                var s_aca=$(".s_aca").val();
                var s_class=$(".s_class").val();
                var s_phone=$(".s_phone").val();
                var s_email=$(".s_email").val();
                $.ajax({
                    type:"post",
                    url:"/activitySign/saveActivitySign",
                    async:true,
                    data:{
                        "a_id":a_id,
                        "s_name":s_name,
                        "s_num":s_no,
                        "s_sex":s_sex,
                        "s_acd":s_aca,
                        "s_class":s_aca,
                        "s_class":s_class,
                        "s_tel":s_phone,
                        "s_mail":s_email
                    },
                    dataType:"json",
                    success:function(msg){
                        alert("恭喜你，报名成功！")
                        $(".success").show();
                        window.location.reload();
                    },
                });
        })

        //点击关闭按钮，页面消失
        $(".sign_up_table_close").click(function(){
            $(".sign_up_table").hide();
            $(".mask").hide();
        })
    }
</script>
</body>
</html>