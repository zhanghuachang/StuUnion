<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/18 0018
  Time: 8:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script type="text/javascript" src="/layui/layui.js"></script>
    <script type="text/javascript" src="/jquery/dist/jquery.js" ></script>
    <script type="text/javascript" src="/bootstrap-3.3.7-dist/js/bootstrap.js" ></script>
    <style>
        .layui-form-label {
            text-align: right;
            padding: 9px 0;
        }
        .layui-form-item{
            width: 360px;
            margin: 30px 10px;
            display: inline;
            float: left;
        }
        .layui-btn-normal {
            background-color: #009688;
        }
        .modal-body {
            height: 500px;
            overflow: hidden;
        }
        .info-span{
            display: block;
            height: 36px;
            line-height: 36px;
            padding-left: 10px;
            width: 260px;
            border: 1px solid #e6e6e6;
            float: left;
        }
    </style>
</head>
<body class="childrenBody">
<div class="user_left">
    <div class="layui-form-item" style="display: none;">
        <label class="layui-form-label">编号</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" name="s_id" value="${student.sid}">
        </div>
    </div>
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">权限</label>
        <div class="layui-input-block">
            <span class="info-span" name="s_power">${user.u_power}</span>
        </div>
    </div>
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">学院</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" name="s_acd" value="${student.s_acd}">
        </div>
    </div>
    <table>
        <tbody>
        <tr>
            <td>
                <div class="layui-form-item">
                    <label  class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <span class="info-span" name="s_name">${student.s_name}</span>
                    </div>
                </div>
            </td>
            <td>
                <div class="layui-form-item">
                    <label class="layui-form-label">学号</label>
                    <div class="layui-input-block">
                        <span class="info-span" name="s_no">${user.u_number}</span>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="layui-form-item">
                    <label class="layui-form-label">专业</label>
                    <div class="layui-input-block">
                        <span class="info-span" name="s_maj">${student.s_maj}</span>
                    </div>
                </div>
            </td>
            <td>
                <div class="layui-form-item" pane="">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <span class="info-span" name="s_Sex">${student.s_sex}</span>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="layui-form-item">
                    <label class="layui-form-label">生日</label>
                    <div class="layui-input-block">
                        <span class="info-span">${student.s_birth}</span>
                    </div>
                </div>
            </td>
            <td>
                <div class="layui-form-item">
                    <label class="layui-form-label">手机</label>
                    <div class="layui-input-block">
                        <span class="info-span" name="s_tel">${student.s_tel}</span>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-block">
                        <span class="info-span" name="s_mail">${user.u_mail}</span>
                    </div>
                </div>
            </td>
            <td>
                <div class="layui-form-item">
                    <label class="layui-form-label">QQ</label>
                    <div class="layui-input-block">
                        <span class="info-span" name="s_qq">${student.s_qq}</span>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <c:if test="${user.u_power != 4}">
                    <div class="layui-form-item">
                        <label class="layui-form-label">部门</label>
                        <div class="layui-input-block">
                            <span class="info-span" id="stu_dname">${student.d_name}</span>
                        </div>
                    </div>
                </c:if>
            </td>
            <td>
                <c:if test="${user.u_power != 4}">
                    <div class="layui-form-item">
                        <label for="stu_pname" class="layui-form-label">职位</label>
                        <div class="layui-input-block">
                            <span class="info-span" id="stu_pname">${student.p_name}</span>
                        </div>
                    </div>
                </c:if>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<!--<div class="user_right">
    <input type="file" name="dddd" class="layui-upload-file" lay-title="掐指一算，我要换一个头像了">
    <img src="" class="layui-circle" id="userFace">
</div>-->
<div class="layui-form-item" style="margin-left: 5%;">
    <div class="layui-input-block">
        <a class="layui-btn layui-btn-normal change-btn" data-toggle="modal" data-target="#myModal">立即修改</a>
    </div>
</div>

<%--修改信息--%>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改个人信息
                </h4>
            </div>
            <div class="modal-body" id="model_dialog_body">
                <div id="alterbox" style="height:100%;overflow:auto;">
                    <form class="layui-form" id="update-form" method="post">
                        <div class="user_left">
                            <input type="hidden" class="layui-input" name="sid" id="sid" value="${student.sid}">
                            <%--权限--%>
                            <input type="hidden" disabled class="layui-input" name="s_power" id="s_power"
                                   value="${user.u_power}"/>
                            <%--加入时间--%>
                            <input type="hidden" disabled class="layui-input" name="join_time" id="join_time"
                                   value="${student.join_time}"/>


                            <div class="layui-form-item">
                                <label for="s_name" class="layui-form-label">姓名</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="s_name" id="s_name"
                                           value="${student.s_name}"/>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="s_num" class="layui-form-label">学号</label>
                                <div class="layui-input-block">
                                    <input type="text" disabled class="layui-input disabled" name="s_num" id="s_num"
                                           value="${user.u_number}"/>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="s_maj" class="layui-form-label">专业</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="s_maj" id="s_maj"
                                           value="${student.s_maj}"/>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="s_acd" class="layui-form-label">学院</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="s_acd" id="s_acd"
                                           value="${student.s_acd}"/>
                                </div>
                            </div>

                            <div class="layui-form-item" pane="">
                                <label class="layui-form-label">性别</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="s_sex" value="男" title="男" checked=""/>
                                    <input type="radio" name="s_sex" value="女" title="女"/>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">生日</label>
                                <div class="layui-input-block">
                                    <input type="text" placeholder="请输入出生年月" name="s_birth" id="s_birth" onclick="layui.laydate(
                                            {elem: this,max: laydate.now()})" class="layui-input"
                                           value="${student.s_birth}"/>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="s_tel" class="layui-form-label">手机</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="s_tel" id="s_tel"
                                           value="${student.s_tel}"/>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="s_mail" class="layui-form-label">邮箱</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="s_mail" id="s_mail"
                                           value="${user.u_mail}"/>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="s_qq" class="layui-form-label">QQ</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="s_qq" id="s_qq"
                                           value="${student.s_qq}"/>
                                </div>
                            </div>

                            <c:if test="${user.u_power != 4 }">
                                <div class="layui-form-item">
                                    <label for="d_name" class="layui-form-label">部门</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="d_name" id="d_name"
                                               value="${student.d_name}"/>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label for="p_name" class="layui-form-label">职位</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="p_name" id="p_name"
                                               value="${student.p_name}"/>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                        <%--<div class="layui-form-item">
                            <label class="layui-form-label">职位</label>
                            <div class="layui-input-inline">
                                <select name="s_pname">
                                    <option value="">干事</option>
                                    <option value="">部长</option>
                                    <option value="">主席</option>
                                </select>
                            </div>
                        </div>--%>
                        <!--<div class="layui-form-item" style="margin-left: 5%;">
                            <div class="layui-input-block">
                                <button class="layui-btn layui-btn-normal" lay-submit="" lay-filter="changeUser">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>-->
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="update-submit">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script type="text/javascript">

    $(function () {

        $("#update-submit").on("click", function () {
            var sid = $('#sid').val();
            var s_name = $('#s_name').val();
            var s_num = $('#s_num').val();
            var s_sex = $('input:radio:checked').val();
            var s_acd = $('#s_acd').val();
            var s_maj = $('#s_maj').val();
            var d_name = $('#d_name').val();
            var p_name = $('#p_name').val();
            var s_birth = $('#s_birth').val();
            var s_tel = $('#s_tel').val();
            var s_mail = $('#s_mail').val();
            var s_qq = $('#s_qq').val();
            var s_power = $('#s_power').val();
            var join_time = $('#join_time').val();
            if (sid != null && sid != "") {
                // alert(sid + " " + s_name + " " + s_num + " " + s_sex + " " + s_acd + " "  + s_maj+ " " + d_name + " "+ p_name
                //     + " " + s_birth + " " + s_tel + " " + s_mail + " " + s_qq + " " + s_power + " " + join_time)
                /*更新学生信息*/
                $.ajax({
                    url: "/student/updateInfo",
                    data: {
                        'sid': sid,
                        's_name': s_name,
                        's_num': s_num,
                        's_sex': s_sex,
                        's_acd': s_acd,
                        's_maj': s_maj,
                        'd_name': d_name,
                        'p_name': p_name,
                        's_birth': s_birth,
                        's_tel': s_tel,
                        's_mail': s_mail,
                        's_qq': s_qq,
                        's_power': s_power,
                        'join_time': join_time
                    },
                    dataType: "json",
                    type: "post",
                    success: function (msg) {
                        if (msg) {
                            alert("更新成功");
                            window.location.href = "/user/userInfo";
                        }
                        else
                            alert("更新失败");
                    }
                })
            }
            else {
                /*保存用户信息*/
                // alert(sid + " " + s_name + " " + s_num + " " + s_sex + " " + s_acd + " "  + s_maj+ " " + d_name + " "+ p_name
                //     + " " + s_birth + " " + s_tel + " " + s_mail + " " + s_qq + " " + s_power + " " + join_time)
                $.ajax({
                    url: "/student/saveStudent",
                    data: {
                        's_name': s_name,
                        's_num': s_num,
                        's_sex': s_sex,
                        's_acd': s_acd,
                        's_maj': s_maj,
                        'd_name': d_name,
                        'p_name': p_name,
                        's_birth': s_birth,
                        's_tel': s_tel,
                        's_mail': s_mail,
                        's_qq': s_qq,
                        's_power': s_power
                    },
                    dataType: "json",
                    type: "post",
                    success: function (msg) {
                        if (msg) {
                            alert("保存成功");
                            window.location.href = "/user/userInfo";
                        }
                        else
                            alert("保存失败");
                    }
                })
            }
        })


    })
</script>
<script type="text/javascript" src="/layui/layui.js"></script>
<script type="text/javascript" src="/js/address.js"></script>
<script type="text/javascript" src="/js/user.js"></script>
</body>
</html>