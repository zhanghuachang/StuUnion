<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/30 0030
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>首页消息滚动</title>
    <!--<link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="css/default.css">-->
    <link href="/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
    <link href="/bootstrap-3.3.7-dist/css/site.css" rel="stylesheet" type="text/css" />
    <!--[if IE]>
    <script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
    <![endif]-->
    <style>
        /*.demo1 {
            height: 110px;
        }*/
        .panel-body {
            height: 300px;
        }
        .panel-footer {
            height: 50px;
            position: relative;
        }
        .panel-footer .pagination {
            position: absolute;
            top: 7px;
            right: 10px;
        }
        .glyphicon-asterisk {
            font-weight: normal;
        }
        .container {
            margin-top: 70px;
        }
        ul {
            padding-bottom: 0;
        }
        /*.pagination {
            margin-top: -150px;
        }*/

    </style>
</head>
<body>
<div class="htmleaf-container">
    <header class="htmleaf-header bgcolor-10">
        <!--<h1>基于bootstrup的响应式jQuery滚动新闻插件
        <span>A Responsive jQuery News Ticker Plugin with Bootstrap</span></h1>-->

    </header>
    <div class="container mp30">
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <span class="glyphicon glyphicon-list-alt"></span><b>考试专栏</b></div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <ul class="demo1" style="height: 110px; overflow-y: hidden;">
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/1.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-asterisk"></i><a href="#">关于报送2018年春季学期期末考试周…</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/2.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-asterisk"></i><a href="#">2018届毕业生学院重修、重考教学安…</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/3.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-asterisk"></i><a href="#">《毛泽东思想和中国特色社会主义理…</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/4.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-asterisk"></i><a href="#">2018届毕业生《思想政治理论课》… </a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/5.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-asterisk"></i><a href="#">2018届毕业生《创业基础》重修重…</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/6.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-asterisk"></i><a href="#">大学生素质教育中心关于2018年…</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/7.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-asterisk"></i><a href="#">关于全国大学英语四、六级考试...</a> <!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/7.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-asterisk"></i><a href="#">马克思主义学院2017秋季学期“...</a><!-- <a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/7.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-asterisk"></i><a href="#">马克思主义学院2017秋季学...</a> <!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/6.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-asterisk"></i><a href="#">大学生素质教育中心关于20…</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/7.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-asterisk"></i><a href="#">马克思主义学院2017秋季学...</a> <!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/6.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-asterisk"></i><a href="#">大学生素质教育中心关于20…</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li><li class="tests-item">
                                    <table cellpadding="4">
                                        <tr>
                                            <!--<td><img src="images/7.png" width="60" class="img-circle" /></td>-->
                                            <td><i class="glyphicon glyphicon-asterisk"></i><a href="#">马克思主义学院2017秋季学...</a> <!--<a href="#">Read more...</a>--></td>
                                        </tr>
                                    </table>
                                </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/6.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-asterisk"></i><a href="#">大学生素质教育中心关于20…</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <span class="glyphicon glyphicon-list-alt"></span><b>教务通知</b>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <ul class="demo1" style="height: 110px; overflow-y: hidden;">
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/1.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="#">关于征订2018年秋季学期教材</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/2.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="#">关于做好我校2018届毕业..</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/3.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="#">关于鼓励教师积极参加全国...</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/4.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="#">关于下达2018年秋季学期教学…</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/5.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="#">关于做好2018年春季学期学…</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/6.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="#">关于公布教务处各科室工作...</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/7.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="#">关于下达2018年秋季学期…</a> <!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/7.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="#">关于下达2018年秋季学期…</a><!-- <a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/7.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="#">关于下达2018年秋季学…</a><!-- <a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/6.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="#">关于下达2018年秋季学…</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/7.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="#">关于全国大学英语四、...</a> <!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/7.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="#">马克思主义学院2017秋...</a><!-- <a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/7.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="#">马克思主义学院2017秋...</a><!-- <a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li><li class="tests-item">
                                    <table cellpadding="4">
                                        <tr>
                                            <!--<td><img src="images/6.png" width="60" class="img-circle" /></td>-->
                                            <td><i class="glyphicon glyphicon-envelope"></i><a href="#">大学生素质教育中心关于2018年毕业生重修及…</a><!--<a href="#">Read more...</a>--></td>
                                        </tr>
                                    </table>
                                </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">

                    </div>
                </div>
            </div>


            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <span class="glyphicon glyphicon-list-alt"></span><b>勤工助学</b>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <ul class="demo1" style="height: 110px; overflow-y: hidden;">
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/1.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-tree-deciduous"></i><a href="#">实验室与资产管理处招聘1名..</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/2.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-tree-deciduous"></i><a href="#">图书馆招聘一名校内岗位同学</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/3.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-tree-deciduous"></i><a href="#">某中学招聘微信小编（4-15）</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/4.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-tree-deciduous"></i><a href="#">某联通营业厅招聘十名兼职人员… </a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/5.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-tree-deciduous"></i><a href="#">外国语教学办招聘一名校内岗位人员…</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/6.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-tree-deciduous"></i><a href="#">财务处招聘1名临时工</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/7.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-tree-deciduous"></i><a href="#">校内岗位招聘学生两名</a> <!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/6.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-tree-deciduous"></i><a href="#">大学生素质教育中心关于2018…</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/7.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-tree-deciduous"></i><a href="#">关于全国大学英语四、六级考...</a> <!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/7.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-tree-deciduous"></i><a href="#">马克思主义学院2017秋季学...</a><!-- <a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/7.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-tree-deciduous"></i><a href="#">马克思主义学院2017秋季...</a><!-- <a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/6.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-tree-deciduous"></i><a href="#">大学生素质教育中心…</a><!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/7.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-tree-deciduous"></i><a href="#">关于全国大学英语四...</a> <!--<a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/7.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-tree-deciduous"></i><a href="#">马克思主义学院2017秋季...</a><!-- <a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li class="tests-item">
                                        <table cellpadding="4">
                                            <tr>
                                                <!--<td><img src="images/7.png" width="60" class="img-circle" /></td>-->
                                                <td><i class="glyphicon glyphicon-tree-deciduous"></i><a href="#">马克思主义学院2017秋季学...</a><!-- <a href="#">Read more...</a>--></td>
                                            </tr>
                                        </table>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">

                    </div>
                </div>
            </div>





        </div>
    </div>
</div>


<script src="/jquery/dist/jquery.min.js" type="text/javascript"></script>
<script src="/bootstrap-3.3.7-dist/js/jquery.bootstrap.newsbox.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $(".demo1").bootstrapNews({
            newsPerPage: 12,
            autoplay: true,
            pauseOnHover:true,
            direction: 'up',
            newsTickerInterval: 4000,
            onToDo: function () {
                //console.log(this);
            }
        });

    });
</script>
</body>
</html>

