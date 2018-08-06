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
    <title>活动申请</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.css" />
    <link rel="stylesheet" href="/summernote/0.8.2/summernote.css" />
    <!--<link rel="stylesheet" href="//at.alicdn.com/t/font_eolqem241z66flxr.css" media="all" />-->
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/bootstrap-3.3.7-dist/js/bootstrap.js" ></script>
    <script type="text/javascript" src="/summernote/0.8.2/summernote.js"></script>
    <script type="text/javascript" src="/summernote/0.8.2/lang/summernote-zh-CN.js"></script>

    <style>
        .activity_name {
            width: 63.5%;
        }
        .layui-form-label {
            width: 90px;
        }
        .layui-input-block,.note-editor {
            margin-left: 90px;
        }
        .addActivity {
            border: none;
            padding: 9px 20px;
            border-radius:3px;
            background-color: #00800069;
        }
        .btnGroup {
            float: right;
            /*text-align: center;*/
            margin-right: 455px;
        }
        .reset {
            margin-left: 10px;
        }
        .alertBox{
            border-radius: 3px;
            width: 120px;
            /*height: 50px;*/
            position: absolute;
            top: 250px;
            left: 50%;
            margin-left: -270px;
            background-color: #F2F2F2;
            z-index: 10;
            /*opacity: 0;
            transition: opacity 0.5s;
            -moz-transition: opacity 0.5s; /* Firefox 4 */
            /*-webkit-transition: opacity 0.5s; /* Safari 和 Chrome */
            /*-o-transition: opacity 0.5s;*/
            display: none;
        }
        .alertBox1 {
            border-radius: 3px;
            width: 170px;
            /*height: 50px;*/
            position: absolute;
            top: 250px;
            left: 50%;
            margin-left: -270px;
            background-color: #F2F2F2;
            z-index: 10;
            /*opacity: 0;
            transition: opacity 0.5s;
            -moz-transition: opacity 0.5s; /* Firefox 4 */
            /*-webkit-transition: opacity 0.5s; /* Safari 和 Chrome */
            /*-o-transition: opacity 0.5s;*/
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
        /*.describe-null {
            float: left;
        }*/

        .layui-input-inline {
            position: relative;
        }
        .layui-input-inline span{
            position: absolute;
            top: 10px;
            right: -120px;
            color: red;
        }
    </style>

</head>
<body class="childrenBody">
<div class="activityAdd">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">活动名称</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input activity_name" lay-verify="required" placeholder="请输入申请活动名称" name="a_name">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">申请人</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input application_name" value="${student.s_name}" disabled lay-verify="required" placeholder="请输入申请人姓名" name="a_apply_name">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">活动时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="a_time" class="layui-input activity_time" placeholder="请输入活动时间" lay-verify="date" onclick="layui.laydate({elem:this})">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">活动地点</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input activity_place" lay-verify="required" placeholder="请输入活动地点" name="a_apply_name">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">承办部门</label>
                <div class="layui-input-inline">
                    <input type="text" name="d_name" value="${student.d_name}" disabled class="layui-input activity_department" lay-verify="required" placeholder="请输入承办部门">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">活动类别</label>
                <div class="layui-input-inline">
                    <select name="a_class" class="activity_class" id="a_class" lay-filter="browseLook">
                        <option value="校级活动">校级活动</option>
                        <option value="院级活动">院级活动</option>
                        <option value="内部活动">内部活动</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item description">
            <label class="layui-form-label">活动描述</label>
            <div id="summernote"></div>

        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <div class="btnGroup">
                    <a  href="javascript:;" onclick="saveActivity(this)" class="addActivity">提交</a>
                    <button type="reset" class="layui-btn layui-btn-primary reset">重置</button>
                </div>
            </div>
        </div>
    </form>
</div>
<div class="alertBox">
    <i class="layui-icon submit-success" style="font-size: 30px; color: red; margin-right: 5px;">&#xe60c;</i>
    <h4>提交成功</h4>
</div>
<div class="alertBox1">
    <i class="layui-icon describe-null" style="font-size: 30px; color: red; margin-right: 5px;">&#xe60b;</i>
    <h4>活动描述不能为空</h4>
</div>
<script type="text/javascript" src="/layui/lay/dest/layui.all.js"></script>
<script>
    $("#summernote").summernote({
        lang: "zh-CN",
        width: 800,
        height: 200,
        placeholder: "请填写活动描述"
    });

    $(".reset").click(function () {
        $("input type:text").html("");
        $("#summernote").summernote('code', "");
    })
</script>

<script>

    var flag = false,
        flag1 = false,
        flag3 = false,
        flag4 = false,
        flag5 = false,
        flag7 = false;

    //正则判断
    $(".activity_name").blur(function () {
        $(this).css("border", "1px solid #e2e2e2");
        var activity_name = $(".activity_name").val();
        if (activity_name == null || activity_name == "") {
            $(this).css("border", "1px solid red");
        }
        else {
            flag = true;
        }
    })

    $(".activity_time").blur(function () {
        $(this).parent().find("span").remove();
        var activity_time = $(".activity_time").val();
        if (activity_time == null || activity_time == "") {
//			$(this).css("border","1px solid red");
            var span = '<span>活动时间不能为空</span>';
            $(this).parent().append(span);
        }
        else {
            flag3 = true;
        }
    })

    $(".activity_place").blur(function () {
        $(this).css("border", "1px solid #e2e2e2");
        var activity_place = $(".activity_place").val();
        if (activity_place == null || activity_place == "") {
            $(this).css("border", "1px solid red");
        }
        else {
            flag4 = true;
        }
    })

    function saveActivity(obj) {
        var activity_describe = $("#summernote").summernote('code');

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
        if (flag && flag3 && flag4 && flag7) {
            var activity_name = $(".activity_name").val();
            var application_name = $(".application_name").val();
            var application_no = $(".application_no").val();
            var activity_time = $(".activity_time").val();
            var activity_place = $(".activity_place").val();
            var activity_department = $(".activity_department").val();
            var activity_class = $(".activity_class").val();
            var activity_describe = $("#summernote").summernote('code');
            var a_status = 0;
            var a_decide_name = "";
            var a_url = "";
            $.ajax({
                type: "post",
                url: "/activity/saveActivity",
                async: true,
                data: {
                    "a_name": activity_name,
                    "a_apply_name": application_name,
                    "a_time": activity_time,
                    "a_place": activity_place,
                    "d_name": activity_department,
                    "a_class": activity_class,
                    "a_describe": activity_describe,
                    "a_status": a_status,
                    "a_decide_name": a_decide_name,
                    "a_url": a_url
                },
                dataType: "json",
                success: function (msg) {
                    alert("申请成功，请在申请记录中查看状态！")
                    window.location.reload()
                }
            });
        }
    }
</script>

</body>
</html>
