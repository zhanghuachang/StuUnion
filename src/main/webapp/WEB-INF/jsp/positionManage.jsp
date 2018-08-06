<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/19 0019
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>职位管理</title>
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
            height: 200px;
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
            height: 100%;
            background-color: #000000;
            opacity: 0.5;
            display: none;
        }

        .edit-line {
            width: 100%;
            height: 1px;
            background-color: #EEEEEE;
        }

        .edit-body {
            padding: 15px;
            padding-bottom: 0;
        }

        .edit-footer {
            padding: 15px;
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
    </style>

</head>
<body class="childrenBody">
<blockquote class="layui-elem-quote news_search">
    <div class="layui-inline add">
        <a class="layui-btn linksAdd_btn" style="background-color:#5FB878" id="addBtn" data-toggle="modal"
           data-target="#myModal">添加职位</a>
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
        <!--主席的功能添加职位，删除职位，查看职位简介即通过点击职位简介可以链到前台界面-->
        <tr>
            <th class="sel">
                <i class="layui-icon">&#xe600;</i>
            </th>
            <th>职位名称</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody class="links_content" id="j_tb"></tbody>
    </table>
</div>


<!--分页部分-->
<div id="mainContent"></div>
<div id="callBackPager"></div>


<!--模态框部分-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    增加职位
                </h4>
            </div>
            <div class="modal-body" id="model_dialog_body">
                <form class="layui-form" style="width:90%;">
                    <div class="layui-form-item">
                        <label class="layui-form-label">职位名称</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input d_name" lay-verify="required" placeholder="请输入职位名称"
                                   name="d_name">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="submit">
                    提交
                </button>
            </div>
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
                <p>确定删除职位?</p>
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
        <p>确定删除该职位</p>
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
        <h4>编辑职位信息</h4>
    </div>
    <div class="edit-line"></div>
    <div class="edit-body">
        <form class="layui-form" style="width:90%;">
            <div class="layui-form-item">
                <input type="hidden" name="d_id" value="" id="d_id">
                <label class="layui-form-label">职位名称</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input edit_name" lay-verify="required" placeholder="请输入职位名称" name="d_name" id="d_name" value="">
                </div>
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
                    url: "/position/getPositionList",
                    async: true,
                    dataType: "json",
                    success: function (data) {//这里应该得到数组类型数据或者是list
                        $.each(data, function (i, data) {//循环里面的数据，动态创建表格
                            var $tr = '<tr><td><i class="layui-icon">&#xe600;</i></td><td>' + (data.p_name) + '</td><td><a onclick="updateDepartment(this)" d_id="' + (data.p_id) + '"  class="layui-btn layui-btn-mini department_edit" id="department_edit"><i class="layui-icon">&#xe642;</i>编辑</a><a onclick="deleteDepartment(this)"  d_id="' + (data.p_id) + '" class="layui-btn layui-btn-danger layui-btn-mini dep_del"><i class="layui-icon">&#xe640;</i>删除</a></tr>';
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


        $("#summernote").summernote({
            lang: "zh-CN",
            height: 300,
            placeholder: "请填写职位简介"
        });

        $("#summernotes").summernote({
            lang: "zh-CN",
            height: 300,
            placeholder: ""
        })


        $("#department_edit").click(function () {
            alert(1)
        })


        //添加数据版块
        //因为用的模态框所以就不用写点击添加按钮弹出了
        //点击模态框的提交，向后台发送数据
        $("#submit").click(function () {
            // $('tbody').html("");
            var d_name = $(".d_name").val();
            $.ajax({
                type: "post",
                url: "/position/savePosition",
                async: true,
                data: {
                    "p_name": d_name,
                },
                dataType: "json",
                success: function () {
                    //点击提交按钮之后，提交的数据要渲染到页面上
                    department.init();
                    $(".d_name").val("");
                    $(".d_content").html("");
                    $(".note-editable").html("")
                }
            });
            $("#myModal").hide();
            $(".modal-backdrop").hide();
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
        // alert(d_id)
        $.ajax({
            type:"post",
            url:"/position/deletePosition",
            data:{
                "p_id":d_id,
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
            url: "/position/getPositionById",
            async: true,
            data: {
                "p_id": d_id
            },
            dataType: "json",
            success: function (data) {
                // alert(data.d_name)
                $("#d_id").val(data.p_id);
                $("#d_name").val(data.p_name);
            }
        })
        $(".edit").show();
        $(".edit").css("top", "30px");
        $(".mask-edit").show();
    }

    /*确定更新*/
    function sureUpdate(obj) {
        var d_id = $("#d_id").val();
        var d_name = $("#d_name").val();
        $.ajax({
            type:"post",
            url:"/position/updatePosition",
            data:{
                "p_id":d_id,
                "p_name":d_name,
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