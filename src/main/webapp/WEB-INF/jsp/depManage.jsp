<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/19 0019
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>部门管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="/css/user.css" media="all"/>
    <!--<link rel="stylesheet" href="../../css/news.css" media="all" />-->
    <link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.css"/>
    <link rel="stylesheet" href="/summernote/0.8.2/summernote.css"/>
    <link rel="stylesheet" href="/font-awesome-4.7.0/css/font-awesome.css">
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script type="text/javascript" src="/summernote/0.8.2/summernote.js"></script>
    <script type="text/javascript" src="/summernote/0.8.2/lang/summernote-zh-CN.js"></script>

    <style>
        .layui-form-label {
            width: 90px;
        }

        .note-editor {
            margin-left: 9px;
        }

        .first {
            width: 18px;
            height: 18px;
        }

        #alertBox {
            width: 300px;
            margin-top: 260px;
        }

        .specialText {
            margin-left: 18px;
            display: inline-block;
        }

        .sel {
            border-left: 1px solid #CCCCCC;
        }

        .check {
            width: 18px;
            height: 18px;
            border: 1px solid #000;
            font: normal 16px/16px "微软雅黑";
            text-align: center;
            background-color: #EEEEEE;
            color: #009688;
            cursor: pointer;
            border: 1px solid #009688;
        }

        .add {
            margin-left: -7px;
        }

        .layui-inline a {
            text-decoration: none;
        }

        #j_tb a {
            text-decoration: none;
        }

        .edit {
            width: 600px;
            height: 641px;
            position: absolute;
            top: 0px;
            left: 50%;
            margin-left: -300px;
            background-color: #FFFFFF;
            border-radius: 3px;
            display: none;
            transition: top 10s;
            -moz-transition: top 10s; /* Firefox 4 */
            -webkit-transition: top 10s; /* Safari 和 Chrome */
            -o-transition: top 10s; /* Opera */
        }

        .header {
            padding: 15px;
        }

        .close-edit {
            float: right;
            background-color: #FFFFFF;
            font-size: 21px;
            font-weight: bold;
            color: #88888838;
            border: none;
            margin-top: -12px;
            transition: color 1s;
            -moz-transition: color 1s; /* Firefox 4 */
            -webkit-transition: color 1s; /* Safari 和 Chrome */
            -o-transition: top 10s;
        }

        .close-edit:hover {
            color: #000000;
            opacity: 0.7;
        }

        .mask-edit {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 600px;
            background-color: #000000;
            opacity: 0.5;
            display: none;
        }
        .edit {
            top: 0px;
            height: 550px;
        }
        .edit-line {
            width: 100%;
            height: 1px;
            background-color: #EEEEEE;
        }
        .note-editor {
            margin-top: -25px;
        }
        .edit-body {
            padding: 15px;
            padding-bottom: 0;
        }

        .edit-footer {
            padding: 30px 15px 0 15px;
            float: right;
        }

        .deleteDepartment {
            position: absolute;
            top:50%;
            margin-top: -75px;
            left: 50%;
            margin-left: -100px;
            width: 230px;
            height: 130px;
            background-color: #FFFFFF;
            padding: 15px;
            border-radius: 3px;
            display: none;
        }
        .deleteDepartment .header-delete {
            position: relative;
            /*height: 40px;*/
        }
        .deleteDepartment p {
            text-align: center;
            font-size: 17px;
            margin-left: 14px;

        }
        .deleteDepartment .close-delete {
            float: right;
            background-color: #FFFFFF;
            font-size: 21px;
            font-weight: bold;
            color:#88888838;
            border: none;
            margin-top: -15px;
            transition: color 1s;
            -moz-transition: color 1s; /* Firefox 4 */
            -webkit-transition: color 1s; /* Safari 和 Chrome */
            -o-transition: top 10s;
        }
        .deleteDepartment .delete-footer {
            margin-top: 20px;
            margin-left: 35px;
        }
        .deleteDepartment .delete-footer button {
            margin-right: 15px;
        }
        .sure {
            position: absolute;
            top: 2px;
            left: 10px;
            float: left;
            margin-top: -2px;
            color: red;
            font-size: 18px;
        }
        .delete-return,.delete-sure{
            padding: 10px 15px;
            background-color:#0064004a;
            /*opacity: 0.4;*/
            border-radius: 3px;
            color: #fff;
            text-decoration: none;
            transition: background-color 1s;
            -moz-transition: background-color 1s; /* Firefox 4 */
            -webkit-transition: background-color 1s; /* Safari 和 Chrome */
            -o-transition: background-color 1s;
        }
        .delete-return:hover {
            background-color: #00640078;
            text-decoration: none;
            color: #FFFFFF;
        }
        .delete-return:link {
            /*background-color: #00640078;*/
            text-decoration: none;
            color: #FFFFFF;
        }
        /*.delete-close:active {
            color: #FFFFFF;
            text-decoration: none;
        }*/
        .delete-sure {
            background-color: #ff000061;
        }
        .delete-sure:hover{
            background-color: red;
            text-decoration: none;
            color: #FFFFFF;
        }
        .delete-sure:link {
            /*background-color: #00640078;*/
            text-decoration: none;
            color: #FFFFFF;
        }

        .delete-footer a{
            cursor: pointer;
        }

        /*添加部门部分*/
        .addDepartment {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #FFFFFF;
            display: none;
        }
        .layui-form-label {
            width: 90px;
        }
        .layui-elem-quote h4{
            margin-top: 0;
            margin-bottom: 0;
        }
        .layui-elem-quote {
            margin-bottom: 30px;
        }
        .layui-elem-quote .addDepartment-close {
            font-size: 30px;
            color: #999999;
            float: right;
            margin-top: -20px;
            margin-right: 20px;
            text-decoration: none;
        }

        .layui-input-block {
            width: 59%;
        }
        .note-editor {
            margin-left: 108px;
        }
        .submit {
            float: right;
            padding: 10px 15px;
            background-color: #009688;
            color: #FFFFFF;
        }
        .submit:hover {
            color: #FFFFFF;
        }
        .department {
            position: relative;
        }
        .alertBox {
            position: absolute;
            top: 100px;
            left: 50%;
            border-radius: 3px;
            width: 120px;
            margin-left: -210px;
            background-color: #F2F2F2;
            display: none;
        }

        table {
            table-layout: fixed;
        }

        .cont {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
    </style>

</head>
<body class="childrenBody">
<blockquote class="layui-elem-quote news_search">
    <div class="layui-inline add">
        <a class="layui-btn linksAdd_btn" style="background-color:#5FB878" id="addBtn" data-toggle="modal"
           data-target="#myModal">添加部门</a>
    </div>
</blockquote>
<div class="layui-form links_list">
    <table class="layui-table">
        <colgroup>

            <col>
            <col>
            <col width="50%">
            <col>
        </colgroup>
        <thead>
        <!--主席的功能添加部门，删除部门，查看部门简介即通过点击部门简介可以链到前台界面-->
        <tr>
            <th class="sel">
                <i class="layui-icon">&#xe600;</i>
            </th>
            <th>部门名称</th>
            <th>部门简介</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody class="links_content" id="j_tb"></tbody>
    </table>
</div>


<!--分页部分-->
<div id="mainContent"></div>
<div id="callBackPager"></div>


<div class="addDepartment">
    <blockquote class="layui-elem-quote">
        <h4>添加部门</h4>
        <a href="javascript:;" class="addDepartment-close">x</a>
    </blockquote>
    <div class="layui-form-item">
        <label class="layui-form-label">部门名称</label>
        <div class="layui-input-block">
            <input type="text" name="title" id="dep_name" required  lay-verify="required" placeholder="请输入部门名称" autocomplete="off" class="layui-input d_name">
        </div>
    </div>

    <div class="layui-form-item department">
        <label class="layui-form-label">部门简介</label>
        <div id="summernote" class="summernote-Add"></div>
        <div class="alertBox">
            <i class="layui-icon submit-success" style="font-size: 30px; color: red; margin-right: 5px;">&#xe60c;</i>
            <h4>提交成功</h4>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <a href="javascript:;" class="btn submit">提交</a>
        </div>
    </div>
</div>

<!--弹出框模态框-->
<div class="modal fade" id="selModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" id="alertBox">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
            </div>
            <div class="modal-body" id="model_dialog_body">
                <p>确定删除部门?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary sureDel" id="submit">
                    确定
                </button>
            </div>
        </div>
    </div>
</div>

<!--模拟编辑模态框-->
<div class="mask-edit"></div>
<%--删除模态框--%>
<div class="deleteDepartment">
    <div class="header-delete clearfix">
        <i class="layui-icon sure">&#xe607;</i>
        <button class="close-delete">x</button>
        <p>确定删除该部门</p>
    </div>
    <div class="edit-line"></div>
    <div class="delete-footer">
        <input type="hidden" value="" id="sureId">
        <a onclick="cancelModel(this)" class="delete-return">关闭</a>
        <a onclick="sureDelete(this)" class="delete-sure">确定</a>
    </div>
</div>
<%--编辑模态框--%>
<div class="edit">
    <div class="header">
        <button class="close-edit">x</button>
        <h4>编辑部门信息</h4>
    </div>
    <div class="edit-line"></div>
    <div class="edit-body">
        <form class="layui-form" style="width:90%;">
            <div class="layui-form-item">
                <input type="hidden" name="d_id" value="" id="d_id">
                <label class="layui-form-label">部门名称</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input edit_name" lay-verify="required" placeholder="请输入部门名称" name="d_name" id="d_name" value="">
                </div>
            </div>
            <div class="layui-form-item">
                <p style="padding-left: 19px;">部门简介</p>
                <div id="summernotes" class="edit-summernotes"></div>
            </div>
        </form>
    </div>
    <div class="edit-line"></div>
    <div class="edit-footer">
        <a onclick="cancelModel(this)" type="button" class="btn btn-default">关闭
        </a>
        <a type="button" class="btn btn-primary sureDel" id="submit" onclick="sureUpdate(this)">
            确定
        </a>
    </div>
</div>

<script>
    $(function () {

        var department = (function () {
            function init() {
                $('tbody').html("");
                render();
            }

            function render() {
                $.ajax({
                    type: "post",
                    url: "/department/getDepartmentList",
                    async: true,
                    dataType: "json",
                    success: function (data) {//这里应该得到数组类型数据或者是list
                        $.each(data, function (i, data) {//循环里面的数据，动态创建表格
                            var $tr = '<tr><td><i class="layui-icon">&#xe600;</i></td><td>' + (data.d_name) + '</td><td class="cont"><a href="javascript:;" >' + (data.d_describe) + '</td><td><a onclick="updateDepartment(this)" d_id="' + (data.d_id) + '"  class="layui-btn layui-btn-mini department_edit" id="department_edit"><i class="layui-icon">&#xe642;</i>编辑</a><c:if test="${student.s_power == 1}"><a onclick="deleteDepartment(this)"  d_id="' + (data.d_id) + '" class="layui-btn layui-btn-danger layui-btn-mini dep_del"><i class="layui-icon">&#xe640;</i>删除</a></c:if></tr>';
                            $("tbody").append($tr);
                        })
                    }
                });
            }

            return {
                init: init
            }

        })();

        department.init();


        $(".summernote-Add").summernote({
            lang:"zh-CN",
            width:805,
            height:400,
            placeholder:"请填写部门简介"
        })

        $("#summernotes").summernote({
            lang: "zh-CN",
            width:400,
            height: 200,
            placeholder: ""
        })


        $("#department_edit").click(function () {
            alert(1)
        })


        //点击添加部门，添加部门板块弹出
        $("#addBtn").click(function(){
            $(".addDepartment").show();
        })

        //点击添加部门的小叉，关闭添加部门的界面
        $(".addDepartment-close").click(function(){
            $(".addDepartment").hide();
        })


        //添加数据版块
        //因为用的模态框所以就不用写点击添加按钮弹出了
        //点击模态框的提交，向后台发送数据

        //添加数据版块

        $(".submit").click(function(){
            var d_name=$("#dep_name").val();
            var d_content=$("#summernote").summernote('code');
            console.log(d_name);
            console.log(d_content);
			$.ajax({
				type:"post",
				url:"/department/saveDepartment",
				async:true,
				data:{
					"d_name":d_name,
					"d_describe":d_content
				},
				dataType:"json",
				success:function(){
                    window.location.reload();
			}
		});

        })


        //点击弹出框xx部分弹出框隐藏
        $(".close-edit").click(function () {
            $(".edit").hide();
            $(".mask-edit").hide();
        })

        //点击模拟删除弹出框部分，弹出框消失
        $(".delete-return").click(function(){
            $(".deleteDepartment").hide();
            $(".mask-edit").hide();
        })

        $(".delete-sure").click(function(){
            $(".deleteDepartment").hide();
            $(".mask-edit").hide();
        })


        //点击模拟删除弹出框部分，弹出框消失
        $(".delete-return").click(function(){
            $(".deleteDepartment").hide();
            $(".mask-edit").hide();
        })

        $(".delete-sure").click(function(){
            $(".deleteDepartment").hide();
            $(".mask-edit").hide();
        })

        $(".close-delete").click(function(){
            $(".deleteDepartment").hide();
            $(".mask-edit").hide();
        })
    })

    /*打开删除模态框*/
    function deleteDepartment(obj) {
        // alert($(".did").val())
        var thisObj = $(obj);
        console.log(thisObj.attr("d_id"));
        $("#sureId").val(thisObj.attr("d_id"))
        $(".deleteDepartment").show();
        $(".mask-edit").show();
    }
    /*关闭删除模态框*/
    function cancelModel(obj) {
        $(".deleteDepartment").hide();
        $(".mask-edit").hide();

        //关闭编辑模态框
        $(".edit").hide();
        $(".mask-edit").hide();
    }

    /*提交删除请求*/
    function sureDelete(obj) {
        var d_id = $("#sureId").val();
        $.ajax({
            type:"post",
            url:"/department/deleteDepartment",
            data:{
                "d_id":d_id,
            },
            dataType:"json",
            success:function (msg) {
                $(".edit").hide();
                $(".mask-edit").hide();
                window.location.reload();
            }
        })
    }

    function updateDepartment(obj) {
        var thisObj = $(obj);
        // alert(thisObj.attr("d_id"));
        var d_id = thisObj.attr("d_id");
        // alert(d_id)
        $.ajax({
            type: "post",
            url: "/department/getDepartmentById",
            async: true,
            data: {
                "d_id": d_id
            },
            dataType: "json",
            success: function (data) {
                // alert(data.d_name)
                $("#d_id").val(data.d_id);
                $("#d_name").val(data.d_name);
                $("#summernotes").summernote('code',data.d_describe);

            }
        })
        $(".edit").show();
        $(".edit").css("top", "0px");
        $(".mask-edit").show();
    }

    /*确定更新*/
    function sureUpdate(obj) {
        var d_id = $("#d_id").val();
        var d_name = $("#d_name").val();
        var d_describe = $("#summernotes").summernote('code');
        $.ajax({
            type:"post",
            url:"/department/updateDepartment",
            data:{
                "d_id":d_id,
                "d_name":d_name,
                "d_describe":d_describe,
            },
            dataType:"json",
            success:function (msg) {
                $(".edit").hide();
                $(".mask-edit").hide();
                window.location.reload();
            }
        })
    }
</script>
</body>
</html>


