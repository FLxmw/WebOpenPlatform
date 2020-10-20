<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>修改密码--layui后台管理模板 2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="../../layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="../../css/public.css" media="all"/>
</head>
<body class="childrenBody">
<form class="layui-form layui-row changePwd">
    <div class="layui-col-xs12 layui-col-sm6 layui-col-md6">
        <div class="layui-input-block layui-red pwdTips">请输入旧密码，新密码必须两次输入一致才能提交</div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" value="${param.username}" disabled class="layui-input layui-disabled">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">旧密码</label>
            <div class="layui-input-block">
                <input type="password" value="" placeholder="请输入旧密码" lay-verify="required|oldPwd"
                       class="layui-input pwd">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-block">
                <input type="password" value="" placeholder="请输入新密码" lay-verify="required|newPwd" id="oldPwd"
                       class="layui-input pwd">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-block">
                <input type="password" value="" placeholder="请确认密码" lay-verify="required|confirmPwd"
                       class="layui-input pwd" id="password">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="changePwd">立即修改</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript" src="../../layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer', 'laydate', 'table', 'laytpl'], function () {
        var form = layui.form,
            layer = parent.layer === undefined ? layui.layer : top.layer,
            $ = layui.jquery,
            laydate = layui.laydate,
            laytpl = layui.laytpl,
            table = layui.table;

        var pwd;
        var id;
        $.ajax({
            url: '${pageContext.request.contextPath}/user/getUser',
            method: 'post',
            data: {
                username: '${param.username}'
            },
            success: function (user) {
                if (user) {
                    pwd = user.password;
                    id = user.id;
                }
            }
        });

        //添加验证规则
        form.verify({
            oldPwd: function (value, item) {
                if (value != pwd) {
                    layer.msg("旧密码为：" + pwd + "  请确认后重新输入！");
                    return "旧密码错误，请重新输入！";
                }
            },
            newPwd: function (value, item) {
                if (value.length < 6) {
                    return "密码长度不能小于6位";
                }
            },
            confirmPwd: function (value, item) {
                if (!new RegExp($("#oldPwd").val()).test(value)) {
                    return "两次输入密码不一致，请重新输入！";
                }
            }
        });

        //修改密码
        form.on("submit(changePwd)", function (data) {
            var index = layer.msg('提交中，请稍候', {icon: 16, time: false, shade: 0.8});
            var msg;
            setTimeout(function () {
                $.ajax({
                    url: '${pageContext.request.contextPath}/user/updatePassword',
                    method: 'post',
                    data: {
                        id: id,
                        password: $("#password").val()
                    },
                    success: function (res) {
                        if (res.status) {
                            msg = res.message;
                            layer.close(index);
                            layer.msg(msg);
                        } else {
                            msg = res.message;
                            layer.close(index);
                            layer.msg(msg);
                            $(".pwd").val('');
                        }
                    }
                });
            }, 2000);
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
        //控制表格编辑时文本的位置【跟随渲染时的位置】
        $("body").on("click", ".layui-table-body.layui-table-main tbody tr td", function () {
            $(this).find(".layui-table-edit").addClass("layui-" + $(this).attr("align"));
        });

    })
</script>
</body>
</html>