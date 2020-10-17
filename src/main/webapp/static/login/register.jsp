<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html class="loginHtml">
<head>
    <meta charset="utf-8">
    <title>注册页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="../favicon.ico">
    <link rel="stylesheet" href="../layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="../css/public.css" media="all"/>
    <style type="text/css">
        /*body{*/
        /*background: url("../images/bc3.jpg") repeat-x  !important;*/

        /*}*/
    </style>
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;margin-left: 30px;">
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" name="username" class="layui-input username" lay-verify="required|username"
                   placeholder="请输入你的真实用户名">
            <span class="help-block" id="usernameMsg">用户名长度限制为2~5</span>
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="text" name="password" class="layui-input password" lay-verify="required|password"
                   placeholder="请输入密码">
            <span id="helpBlockPassword" class="help-block ">密码是6到20位字母、数字，还可包含@!#$%^&*-字符</span>
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">确认密码</label>
        <div class="layui-input-block">
            <input type="text" name="password" class="layui-input again_password" lay-verify="required|again_password"
                   placeholder="请再次输入密码">
            <span id="helpBlockAgain" class="help-block ">两次密码要输入一致哦!</span>
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-block">
            <input type="text" name="email" class="layui-input email" lay-verify="required|email" placeholder="请输入邮箱">
            <span id="helpBlockEmail" class="help-block ">填写正确邮箱格式</span>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline">
                <input type="tel" id="phone" name="phone" lay-verify="required|phone" autocomplete="off"
                       class="layui-input phone">
            </div>
        </div>
        <div class="layui-inline">
            <div class="layui-input-inline">
                <button type="button" id="sendMessage" style="width: 100px;" name="sendMessage" lay-verify="sendMessage"
                        autocomplete="off" class="layui-btn layui-btn-normal">发送验证码
                </button>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">验证码</label>
            <div class="layui-input-inline">
                <input type="text" style="width: 160px;" name="message" lay-verify="required|number" autocomplete="off"
                       class="layui-input" placeholder="请输入正确的验证码">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline" style="width: 200px">
                <%--<input type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input">--%>
                <input type="radio" name="sex" value="男" title="男" checked autocomplete="off">
                <input type="radio" name="sex" value="女" title="女" autocomplete="off">
            </div>
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">用户简介</label>
        <div class="layui-input-block">
            <textarea name="userDesc" placeholder="请用一句话简单的介绍下自己吧" lay-verify="textarea"
                      class="layui-textarea userDesc"></textarea>
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <div class="layui-input-block" align="center" style="margin-top: 15px;">
            <button id="registerBtn" class="layui-btn  layui-btn-sm layui-bg-green" lay-submit="" lay-filter="addUser">
                立即注册
            </button>
            <button type="reset" class="layui-btn layui-btn-sm layui-btn-primary">取消</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer'], function () {
        var form = layui.form,
            layer = parent.layer === undefined ? layui.layer : top.layer,
            $ = layui.jquery;

        $(".help-block").css("color", "#BEBEBE");
        var flagUser = false;
        var flagPwd = false;
        var flagCpwd = false;
        // 找到所在标签元素
        var $user_name = $('.username');
        var $pwd = $('.password');
        var $cpwd = $('.again_password');

        // 1.如果失去焦点，则进行检查判断用户名是否合法
        $user_name.blur(function () {
            fnCheckUser();
        });


        var timer = null;
        var messageMethod = 'GET';
        //发送验证码
        $("#sendMessage").click(function () {
            var messageUrl = '${pageContext.request.contextPath}/send/sendMessage?phone=' + $(".phone").val();
            layer.msg("验证码已经发送到你的手机，请注意查收！");
            $.ajax({
                url: messageUrl,
                success: function (res) {
                    if (res.status) {
                        layer.msg(res.message)
                    }
                }
            });
            $(this).addClass("layui-btn layui-btn-disabled layui-btn-radius");
            $(this).css({
                "color": "#8B8B83",
                "width": "150px"
            });
            timer = setInterval(startTime, 1000);
        });

        var lastTime = 60;

        function startTime() {
            lastTime--;
            $("#sendMessage").text(lastTime + "秒后重新发送");
            if (lastTime == 0) {
                $("#sendMessage").removeClass("layui-btn layui-btn-disabled layui-btn-radius").addClass("layui-btn layui-btn-normal").html(" <button type=\"button\" id=\"sendMessage\" style=\"width: 100px;\" name=\"sendMessage\" lay-verify=\"sendMessage\"\n" +
                    "                        autocomplete=\"off\" class=\"layui-btn layui-btn-normal\">发送验证码\n" +
                    "                </button>");
                $("#sendMessage").css("width", "100px");
                lastTime = 60;
                clearInterval(timer);
            }
        }

        function fnCheckUser() {
            var url = '${pageContext.request.contextPath}/user/checkUser';
            var method = 'POST';
            // 获取用户输入的数据
            var vals = $user_name.val();
            // 正则，正则验证用户输入的数据是否合法
            var re = /^[\u4e00-\u9fa5]{2,5}$/;
            if (re.test(vals)) {
                $("#usernameMsg").html("用户名可用").css("color", "green");
                var status;
                var startTime = new Date().getTime();
                var endTime;
                var timeConsuming;
                $.ajax({
                    url: url,
                    data: {
                        username: vals
                    },
                    method: method,
                    success: function (res) {
                        if (res == 1) {
                            $("#usernameMsg").html("用户名已经存在").css("color", "red");
                            $("#registerBtn").addClass("layui-btn-disabled");
                            flagUser = false;
                            endTime = new Date().getTime();
                            timeConsuming = endTime - startTime;
                            status = '异常';
                            addLogs(timeConsuming, status, vals, url, method);
                        } else if (res == 0) {
                            $("#usernameMsg").html("用户名唯一，可注册！").css("color", "green");
                            $("#registerBtn").removeClass("layui-btn-disabled")
                            flagUser = true;
                            status = '正常';
                            endTime = new Date().getTime();
                            timeConsuming = endTime - startTime;
                            addLogs(timeConsuming, status, vals, url, method);
                        }

                    }
                });
            } else {
                // 不合法 -- 报错 -- 下面的span标签显示
                $("#usernameMsg").html("用户名输入不合法！").css("color", "red");
                flagUser = false;
            }
        }

        // 2.如果密码框失去焦点，则进行检查判断密码是否合法
        $pwd.blur(function () {
            // 封装函数，调用函数
            fnCheckPwd()
        });

        function fnCheckPwd() {
            var vals = $pwd.val()
            // 密码正则匹配表达式
            var rePass = /^[\w!-@#$%^&*]{6,20}$/
            // 正则验证密码输入是否合法
            if (rePass.test(vals)) {
                $("#helpBlockPassword").html('密码可用').css("color", "green");
                $("#registerBtn").removeClass("layui-btn-disabled")
                flagPwd = true;
            } else {
                // 如果匹配失败，则显示span标签，替换提示信息
                $("#helpBlockPassword").html('密码输入有误！').css("color", "red");
                $("#registerBtn").addClass("layui-btn-disabled");
                flagPwd = false;
            }
        }

        // 3.判断两次输入的密码是否一致
        $cpwd.blur(function () {
            // 封装函数，调用函数
            fnCheckCpwd()
        });

        function fnCheckCpwd() {
            // 获取重复密码框输入的数据
            var vals = $pwd.val();
            var cvals = $cpwd.val();
            if (vals == cvals) {
                $("#helpBlockAgain").html('密码正确').css("color", "green");
                $("#registerBtn").removeClass("layui-btn-disabled")
                flagCpwd = true;
            } else {
                $("#helpBlockAgain").html('两次密码输入不一致，请重新输入').css("color", "red");
                $("#registerBtn").addClass("layui-btn-disabled");
                flagCpwd = false;
            }
        }

        var url = '${pageContext.request.contextPath}/user/addUser';
        var method = 'POST';
        form.on("submit(addUser)", function (data) {
            if (flagUser && flagPwd && flagCpwd) {
                var status;
                var startTime = new Date().getTime();
                var endTime;
                var timeConsuming;
                //弹出loading
                var index = top.layer.msg('数据提交中，请稍候', {icon: 16, time: false, shade: 0.8});
                var msg;
                $.ajax({
                    url: url,
                    method: method,
                    data: data.field,
                    success: function (res) {
                        if (res.status) {
                            msg = res.message;
                            endTime = new Date().getTime();
                            timeConsuming = endTime - startTime;
                            status = '正常';
                            addLog(timeConsuming, status, data.field.username);
                        } else {
                            msg = res.message;
                            status = '异常';
                            endTime = new Date().getTime();
                            timeConsuming = endTime - startTime;
                            addLog(timeConsuming, status, data.field.username);

                        }
                    }
                });
                setTimeout(function () {
                    if (status=='正常') {
                        layer.closeAll("iframe");
                        window.location.href = 'login.jsp';
                    }
                    top.layer.msg(msg);
                    top.layer.close(index);
                }, 2000);
                return false;
            }
            $("#registerBtn").addClass("layui-btn-disabled");
            return false;
        });

        //格式化时间
        function filterTime(val) {
            if (val < 10) {
                return "0" + val;
            } else {
                return val;
            }
        }

        //定时发布
        var time = new Date();
        var submitTime = time.getFullYear() + '-' + filterTime(time.getMonth() + 1) + '-' + filterTime(time.getDate()) + ' ' + filterTime(time.getHours()) + ':' + filterTime(time.getMinutes()) + ':' + filterTime(time.getSeconds());

        function addLog(timeConsuming, status, operator) {
            $.ajax({
                url: '${pageContext.request.contextPath}/log/addLog',
                method: 'post',
                data: {
                    url: url,
                    timeConsuming: timeConsuming,
                    operator: operator,
                    operatingTime: submitTime,
                    isAbnormal: status,
                    method: method
                }
            })
        }

        function addLogs(timeConsuming, status, operator, url, method) {
            $.ajax({
                url: '${pageContext.request.contextPath}/log/addLog',
                method: 'post',
                data: {
                    url: url,
                    timeConsuming: timeConsuming,
                    operator: operator,
                    operatingTime: submitTime,
                    isAbnormal: status,
                    method: method
                }
            })
        }

    });
</script>
</body>
</html>
