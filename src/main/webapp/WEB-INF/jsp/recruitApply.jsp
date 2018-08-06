<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/29 0029
  Time: 20:39
  To change this template use File | Settings | File Templates.
  加入学生会申请
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>学生会报名表</title>
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

        button[disabled], html input[disabled] {
            cursor: default;
            background-color: #ffff;
        }
    </style>
</head>
<body class="childrenBody">
<table class="layui-table" style="width: 800px; margin-left: 200px;">
    <colgroup>
        <col width="25%">
        <col>
        <col width="25%">
        <col>
    </colgroup>
    <tbody>

    <input type="hidden" value="${sign.sig_id}" id="sig_id" >

    <tr>
        <td>姓名</td>
        <td><input type="text" name="sig_name" id="sign_name" value="${student.s_name}" disabled /></td>
        <td>性别</td>
        <td><input type="radio" name="sig_sex" id="sign_sex_m" checked="" value="男" />男<input type="radio" name="sig_sex" id="sign_sex_w" checked="" value="女" />女</td>
        <!--<td rowspan="4"><label for="sign_photo" class="btn">上传照片</label><input type="file" accept="image/*" name="sig_photo" id="sign_photo" style="position:absolute;clip: rect(0 0 0 0);"/><img id="preview" /></td>-->
    </tr>
    <tr>
        <td>民族</td>
        <td><input type="text" name="sig_nation" id="sign_nation" value="${sign.sig_nation}" /></td>
        <td>学号</td>
        <td><input type="text" name="sig_no" id="sign_no" value="${student.s_num}" disabled /></td>
    </tr>
    <tr>
        <td>第一志愿</td>
        <td><select name="sig_first_department" id="sign_first_department">
            <option>请选择第一志愿</option>
            <c:forEach items="${departmentList}" var="department">
                <option>${department.d_name}</option>
            </c:forEach>
        </select></td>
        <td>第二志愿</td>
        <td><select  name="sig_second_department" id="sign_second_department">
            <option>请选择第二志愿</option>
            <c:forEach items="${departmentList}" var="department">
                <option>${department.d_name}</option>
            </c:forEach>
        </select></td>
    </tr>
    <tr>
        <td>电话</td>
        <td><input type="text" name="sig_tel" id="sign_tel" value="${student.s_tel}" disabled /></td>
        <td>邮箱</td>
        <td><input type="text" name="sig_mail" id="sign_mail" value="${student.s_mail}" disabled /></td>
    </tr>
    <tr>
        <td>生日</td>
        <td><input type="text" name="sig_birth" id="sign_birth" value="${student.s_birth}" disabled /></td>
        <td>是否服从调剂</td>
        <td><input type="radio" name="sig_adjust" id="sign_adjust" checked="" value="是" />是<input type="radio" name="sig_adjust" id="sign_adjust" checked="" value="否" />否</td>
    </tr>
    <tr>
        <td>特长</td>
        <td colspan="3"><input type="text" name="sig_talent" id="sign_talent" value="${sign.sig_talent}" /></td>
    </tr>
    <tr>
        <td style="padding: 0;">你对学生会的<br />认识和建议</td>
        <td colspan="3" style="height: 550px;"><textarea style="height: 100%;width: 100%;" name="sig_reason" id="sign_reason"  >${sign.sig_reason}</textarea></td>
    </tr>
    </tbody>
</table>
<button class="layui-btn" id="recruit_apply_btn" style="margin-left: 908px;">立即提交</button>
<script type="text/javascript" src="/jquery/dist/jquery.js" ></script>
<script type="text/javascript" src="/bootstrap-3.3.7-dist/js/bootstrap.js" ></script>
<script type="text/javascript" src="/layui/layui.js"></script>
<script type="text/javascript" src="/summernote/0.8.2/summernote.js"></script>
<script type="text/javascript" src="/summernote/0.8.2/lang/summernote-zh-CN.js"></script>
<script type="text/javascript">
    layui.config({
        base : "js/"
    }).use(['form','layer','jquery'],function(){
        var form = layui.form(),
            layer = parent.layer === undefined ? layui.layer : parent.layer,
            $ = layui.jquery;


        $("#recruit_apply_btn").click(function(){
            var conf = confirm("确定提交申请表吗？");
            if(conf == true)
            {
                    var sig_id = $('#sig_id').val();
                    var sig_name = $("#sign_name").val();
                    var sig_sex = $("input[name = sig_sex]:checked").val();
                    var sig_nation = $("#sign_nation").val();
                    var sig_no = $("#sign_no").val();
                    var sig_first_department = $("#sign_first_department").find("option:selected").text();
                    var sig_second_department = $("#sign_second_department").find("option:selected").text();
                    var sig_tel = $("#sign_tel").val();
                    var sig_mail = $("#sign_mail").val();
                    var sig_birth = $("#sign_birth").val();
                    var sig_talent = $("#sign_talent").val();
                    var sig_adjust = $("input[name = sig_adjust]:checked").val();
                    var sig_reason = $("#sign_reason").val();
                    var sig_status = "0";
                    var sig_picture = "";

                    var url = "";
                    if(sig_id == null || sig_id == "")
                        url = "/sign/saveSign";
                    else
                        url = "/sign/updateSign";
                    $.ajax({
                        type:"post",
                        url:url,
                        async:true,
                        dataType:"json",
                        data:{
                            "sig_name":sig_name,
                            "sig_sex":sig_sex,
                            "sig_nation":sig_nation,
                            "sig_num":sig_no,
                            "sig_first_department":sig_first_department,
                            "sig_second_department":sig_second_department,
                            "sig_tel":sig_tel,
                            "sig_email":sig_mail,
                            "s_birth":sig_birth,
                            "sig_talent":sig_talent,
                            "sig_adjust":sig_adjust,
                            "sig_picture":sig_picture,
                            "sig_reason":sig_reason,
                            "sig_status":sig_status
                        },
                        success:function(msg){
                            alert("提交成功！")
                            window.location.reload();
                        }
                    });

            }
        })
    })

</script>
</body>
</html>