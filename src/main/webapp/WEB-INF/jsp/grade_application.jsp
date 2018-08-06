<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/24 0024
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>个人资料</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.css" />
    <link rel="stylesheet" href="/summernote/0.8.2/summernote.css" />
    <style type="text/css">
        .layui-form-item .layui-inline{ width:33.333%; float:left; margin-right:0; }
        @media(max-width:1240px){
            .layui-form-item .layui-inline{ width:100%; float:none; }
        }
        .layui-form-label{
            width: 120px;
            float: left;
        }
        .little_tip{
            position: absolute;
            top: 10px;
            left: 800px;
            height: 620px;
            width: 400px;
            border: 1px solid #ddd;
            padding: 10px 20px;
        }

        .alertBox{
            border-radius: 3px;
            width: 120px;
            position: absolute;
            top: 250px;
            left: 50%;
            margin-left: -270px;
            background-color: #F2F2F2;
            z-index: 10;
            display: none;
        }
        .alertBox1 {
            border-radius: 3px;
            width: 170px;
            position: absolute;
            top: 250px;
            left: 50%;
            margin-left: -270px;
            background-color: #F2F2F2;
            z-index: 10;
            display: none;
        }
        .alertBox i{
            float: left;
        }
        .alertBox1 i{
            float: left;
        }
        .alertBox h4{
            margin-top: 7px;
            font-size: 18px;
        }
        .alertBox1 h4{
            margin-top: 9px;
            font-size: 16px;
        }
    </style>
</head>
<body class="childrenBody">
<form class="layui-form">

    <div class="layui-form-item" hidden="hidden">
        <label for="gra_id" class="layui-form-label">加分id</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input" name="g_id" id="gra_id">
        </div>
    </div>
    <table>
        <tr>
            <td>
                <div class="layui-form-item">
                    <label for="stu_name" class="layui-form-label">姓名</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" name="s_name" value="${student.s_name}" disabled id="stu_name">
                    </div>
                </div>
            </td>
            <td>
                <div class="layui-form-item">
                    <label for="stu_no" class="layui-form-label">学号</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" value="${student.s_num}" disabled name="s_no" id="stu_no">
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="layui-form-item">
                    <label for="ac_name" class="layui-form-label">活动名称</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" name="a_name" id="ac_name" placeholder="请输入活动名称">
                    </div>
                </div>
            </td>
            <td>
                <div class="layui-form-item">
                    <label for="gra_class" class="layui-form-label">加分类别</label>
                    <div class="layui-input-inline">
                        <select name="g_class" id="gra_class">
                            <option value="签到" >签到</option>
                            <option value="组织" >组织</option>
                            <option value="参与" >参与</option>
                            <option value="获奖" >获奖</option>
                        </select>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="layui-form-item">
                    <label for="gra_value" class="layui-form-label">分值</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" name="g_name" id="gra_value" placeholder="请输入分值" >
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <div class="layui-form-item">
        <label for="gra_prove" class="layui-form-label">活动证明</label>
        <div class="layui-input-block">
            <div id="summernote" class="summer" name="g_prove" id="gra_prove" >
            </div>
        </div>
        <div class="layui-form-item" style="margin-left: 450px;">
            <div class="layui-input-inline">
                <a class="layui-btn" id="apply_sub">立即提交</a>
                <a class="layui-btn layui-btn-primary" type="reset" >重置</a>
            </div>
        </div>
    </div>
</form>
<div class="little_tip">
    注：学生参加了非本院学生会举办的活动后，可以在本界面申请加分。
    左侧均为必填项，成功提交后，提交给学生会主席或者部长审核证明材料，
    审核通过后，即可为该学生加上对应的学分。
    <div style="text-align: center;">
        <h2 style=" padding: 10px;">申请加分标准</h2>
        <p>活动签到：1分</p>
        <p>参与活动：2分</p>
        <p>组织活动：2分</p>
        <p>获得校级活动三等奖：3分</p>
        <p>获得校级活动二等奖：4分</p>
        <p>获得校级活动一等奖：5分</p>
        <p>获得省级及以上活动三等奖：6分</p>
        <p>获得省级及以上活动二等奖：7分</p>
        <p>获得省级及以上活动一等奖：8分</p>
        <p>通过英语四级：4分</p>
        <p>通过英语六级：6分</p>
        <p>通过计算机等级考试：4分</p>
        <p>获得教师资格证：4分</p>
        <p>获得普通话二乙及以上证书：2分</p>
        <p>获得驾驶证：4分</p>
    </div>
</div>
<div class="alertBox">
    <i class="layui-icon submit-success" style="font-size: 30px; color: red; margin-right: 5px;">&#xe60c;</i>
    <h4>提交成功</h4>
</div>
<div class="alertBox1">
    <i class="layui-icon describe-null" style="font-size: 30px; color: red; margin-right: 5px;">&#xe60b;</i>
    <h4>活动描述不能为空</h4>
</div>
<script type="text/javascript" src="/jquery/dist/jquery.js" ></script>
<script type="text/javascript" src="/bootstrap-3.3.7-dist/js/bootstrap.js" ></script>
<script type="text/javascript" src="/layui/layui.js"></script>
<script type="text/javascript" src="/summernote/0.8.2/summernote.js"></script>
<script type="text/javascript" src="/summernote/0.8.2/lang/summernote-zh-CN.js"></script>
<script type="text/javascript">
    $(function(){
        $("#summernote").summernote({
            lang:"zh-CN",
            height:300,
            width:500,
            placeholder:"请上传活动证明"
        });
    });
    layui.config({
        base : "js/"
    }).use(['form','layer','jquery','laydate'],function(){
        var form = layui.form(),
            layer = parent.layer === undefined ? layui.layer : parent.layer,
            $ = layui.jquery;

        var flag1 = false;
        var flag2 = false;
        var flag3= false;
        var flag4 = false;
        var flag5 = false;
        var flag6 = false;
        var flag7 = false;

        $("#ac_name").blur(function () {
            $(this).css("border", "1px solid #e2e2e2");
            var ac_name = $("#ac_name").val();
            if (ac_name == null || ac_name == "") {
                $(this).css("border", "1px solid red");
            }
            else {
                flag4 = true;
            }
        })

        $("#gra_value").blur(function () {
            $(this).css("border", "1px solid #e2e2e2");
            var gra_value = $("#gra_value").val();
            if (gra_value == null || gra_value == "") {
                $(this).css("border", "1px solid red");
            }
            else {
                flag6 = true;
            }
        })


        $("#apply_sub").click(function(){

            var activity_describe = $(".summer").summernote('code');

//		console.log(activity_describe);
            function delHtmlTag(str) {
                return str.replace(/<[^>]+>/g, "");//去掉所有的html标记
            }

            var str111 = delHtmlTag(activity_describe);
            if (str111 == null || str111 == "") {
                console.log(1)
                $(".alertBox1").show(300).delay(1000).hide(300);
            }
            else {
                flag7 = true;
            }


            var s_name = $("#stu_name").val();
            var s_class = $("#stu_class").val();
            var s_no = $("#stu_no").val();
            var a_name = $("#ac_name").val();
            var g_id = $("#gra_id").val();
            var g_class = $("#gra_class").val();
            var g_value = $("#gra_value").val();
            var g_prove = $(".summer").summernote('code');
            var g_status = 0;
            var g_time = "";
            var g_url = "";

            if(flag4 && flag6){
                $.ajax({
                    type:"post",
                    url:"/grade/saveGrade",
                    async:true,
                    data:{
                        "s_name": s_name,
                        "s_class": s_class,
                        "s_num": s_no,
                        "a_name": a_name,
                        "g_class": g_class,
                        "g_value": g_value,
                        "g_prove":g_prove,
                        "g_status": g_status,
                    },
                    dataType:"json",
                    //			timeout : 5000,
                    success: function (msg) {
                        if(msg){
                            alert("申请成功，请在申请列表中查看状态");
                            window.location.reload();
                        }
                        //刷新父页面
                        else
                            alert("申请失败，请联系管理员")
                    },
                });
            }
        })

    })

</script>
</body>
</html>