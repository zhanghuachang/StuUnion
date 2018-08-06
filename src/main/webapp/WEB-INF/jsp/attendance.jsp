<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/29 0029
  Time: 10:29
  To change this template use File | Settings | File Templates.
  签到页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>活动签到表</title>
    <link rel="stylesheet" href="/layui/css/layui.css"/>
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js" ></script>
    <script src="/layui/lay/dest/layui.all.js"></script>
    <style>
        .attendance {
            width: 600px;
            background-color: #f8f8f8;
            margin: 40px auto;
            padding: 20px 50px 80px 50px;
            border-radius: 5px;
        }
        .attendance .form-header i {
            float: left;
        }
        .attendance .form-header h2{
            text-align: center;
            font-size: 24px;
            color: #999999;
            font-weight: normal;
            border-bottom: 2px dashed #999;
            padding-bottom: 15px;
            margin-top: 10px;
            margin-bottom: 10px;
            background: url(/images/pencil.png) 180px 6px no-repeat;
        }
        .attendance label {
            text-align: left;
            padding: 10px 12px;
            font-size: 16px;
        }
        .layui-form-item {
            margin-bottom: 0;
        }
        #submit {
            width: 100%;
            margin-top: 25px;
            background-color: #ff0000a1;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            color: #FFFFFF;
            font-size: 18px;
            border-radius: 3px;
        }
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
<div class="attendance">
    <form class="layui-form">
        <div class="form-header">
            <h2>${sessionScope.get("a_name")}签到表</h2>
        </div>
        <input type="hidden" placeholder="活动名称" value="${sessionScope.get("a_name")}" class="a_name"/>
        <input type="hidden" placeholder="加分类别" class="g_class" value="签到" />
        <input type="hidden" placeholder="加分分值" class="g_value" value="1"/>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <input type="text" class="layui-input s_name" lay-verify="required" placeholder="请输入姓名">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">学号</label>
            <input type="text" class="layui-input" id="num" lay-verify="required" placeholder="请输入学号">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">班级</label>
            <input type="text" class="layui-input s_class" id="s_class" lay-verify="required" placeholder="请输入班级">
        </div>

        <input type="hidden" placeholder="加分状态" class="g_status" value="1"/>
        <input type="hidden" placeholder="加分审批人" class=""/>
        <button id="submit" type="button">提交</button>
    </form>

    <!--必须满足是在同一个父盒子下才能通过定位和层级来遮住页面-->
    <div class="success">
        <div class="close">
        </div>
        <div class="attendceSuccess">
            <i class="layui-icon">&#xe616;</i>
            <h3>恭喜你，签到成功!</h3>

        </div>

    </div>


</div>

<script type="text/javascript">
    var s_name="";
    var num ="";
    var s_class ="";
    var g_class="签到";//加分类别默认为签到，设为1
    var g_value=1;//加分分值也默认设置为1
    var g_status=1;//默认加分状态为未审批
    var a_name = $(".a_name").val();
    var flag=false;
    var flag1=false;
    //非空判断
    $(".s_name").blur(function(){
        $(this).css("border","1px solid #e6e6e6");
        s_name=$(".s_name").val();
        if(s_name==null||s_name==""){
            $(this).css("border","1px solid red");
        }
        else{
            flag=true;
        }
    })

    $("#num").blur(function(){
        $(this).css("border","1px solid #e6e6e6");
        num = $("#num").val();
        var re = /^\d{10}$/;     //  \D代表非数字
        if(num==null||num==""){
            $(this).css("border","1px solid red");
        }else if(!re.test(num)){
            alert("学号格式错误")
        }
        else{
            flag1=true;
        }
    })

    $(".s_class").blur(function(){
        $(this).css("border","1px solid #e6e6e6");
        s_class=$(".s_class").val();
        if(s_class==null||s_class==""){
            $(this).css("border","1px solid red");
        }
        else {
            flag3=true;
        }
    })

    $("#submit").click(function(){
        if(flag&&flag1&&flag3){
        	$.ajax({
					type:"post",
					url:"/grade/saveGrade",
					data:{
						"a_name":a_name,
						"g_class":g_class,
						"g_value":g_value,
                        "s_num":num,
						"s_name":s_name,
						"s_class":s_class,
						"g_status":g_status,
					},
					async:true,
					dataType:"json",
					success:function(){
                        $(".success").css("display","block");
                        $(".layui-form").hide();
					}
				});

				}
    });

    //点击close 签到成功页面消失
    $(".close").click(function(){
        $(".success").hide();
        $(".layui-form").show();
    })

</script>
</body>
</html>
