$(function () {
    $("#summernote").summernote({
        lang: "zh-CN",
        height: 300,
        width: 500,
        placeholder: "请上传活动证明"
    });
})
layui.config({
    base: "js/"
}).use(['form', 'layer', 'jquery', 'laydate'], function () {
    var form = layui.form(),
        layer = parent.layer === undefined ? layui.layer : parent.layer,
        laypage = layui.laypage;
    $ = layui.jquery;
    laydate = layui.laydate;

    $("#apply_sub").click(function () {
        var s_name = $("#stu_name").val();
        var s_class = $("#stu_class").val();
        var s_no = $("#stu_no").val();
        var a_name = $("#ac_name").val();
        var g_id = $("#gra_id").val();
        var g_class = $("#gra_class").val();
        var g_value = $("#gra_value").val();
        var g_status = 0;
        var g_time = null;
        var g_url = "";
        console.log(s_name)
        $.ajax({
            type: "post",
            url: "/grade/saveGrade",
            async: true,
            data: {
                "s_name": s_name,
                "s_class": s_class,
                "s_sum": s_no,
                "a_name": a_name,
                "g_id": g_id,
                "g_class": g_class,
                "g_value": g_value,
                "g_url": g_url,
                "g_status": g_status,
                "g_time": g_time
            },
            dataType: "json",
            success: function (msg) {
                alert("申请成功")
                var index = top.layer.msg('数据提交中，请稍候', {icon: 16, time: false, shade: 0.8});
                setTimeout(function () {
                    top.layer.close(index);
                    top.layer.msg("用户添加成功！");
                    layer.closeAll("iframe");
                    //刷新父页面
                    parent.location.reload();
                }, 2000);
                return false;
            }
        });
    })

})