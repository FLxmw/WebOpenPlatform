<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html class="loginHtml">
<head>
    <meta charset="utf-8">
    <title>登录--layui后台管理模板 2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="../favicon.ico">
    <%--<link rel="stylesheet" href="../aliicon/iconfont.css">--%>
    <link rel="stylesheet" href="../layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="../css/public.css" media="all"/>
</head>
<body class="loginBody">
<form class="layui-form" style="height:450px;">
    <div class="login_face"><img src="../images/face.jpg" class="userAvatar"></div>
    <div class="layui-center layui-anim-rotate layui-bg-orange layui-btn-radius"
         style="font-size: 25px; margin-bottom: 15px; ">飞龙畅想系统世界
    </div>
    <div class="layui-form-item input-item">
        <label for="userName">用户名</label>
        <input type="text" placeholder="请输入用户名" autocomplete="off" id="userName" class="layui-input"
               lay-verify="required" name="username">
    </div>
    <div class="layui-form-item input-item">
        <label for="password">密码</label>
        <input type="password" placeholder="请输入密码" autocomplete="off" id="password" class="layui-input"
               lay-verify="required" name="password">
    </div>
    <div class="layui-form-item input-item" id="imgCode">
        <label for="code">验证码</label>
        <input type="text" style="width: 140px" placeholder="请输入验证码" autocomplete="off" id="code" class="layui-input">
        <img src="${pageContext.request.contextPath}/code/createCode" id="verCode"
             onclick="this.src='${pageContext.request.contextPath}/code/createCode?code=' + new Date()*1"
        >
    </div>
    <div class="layui-form-item">
        <button id="loginBtn" class="layui-btn layui-block" lay-filter="login" lay-submit>登录</button>
    </div>
    <div class="code" align="center">
        <span style="font-size: 18px;">没有账号？</span> <a id="register" class="layui-icon" href="javascript:;"
                                                       style="color: red;">立即注册</a>
    </div>
    <div class="layui-form-item layui-row">
        <%--<i class="iconfont iconQQ "></i>--%>
        <ul>
            <li><img src="../images/QQ.png" class="layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></li>
            <li><img src="../images/WeChat2%20.png"
                     class="layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></li>
            <li><img src="../images/微博.png" class="layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></li>
        </ul>
        <%--<a href="javascript:;" class="iconfont &#xe667; layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4">&#xe667;</a>--%>
        <%--<a href="javascript:;" class="wechat layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>--%>
        <%--<a href="javascript:;" class="weibo layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>--%>
    </div>
</form>

<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/cache.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer', 'jquery'], function () {
        var form = layui.form,
            layer = parent.layer === undefined ? layui.layer : top.layer,
            $ = layui.jquery;

        $(".loginBody .seraph").click(function () {
            layer.msg("这只是做个样式，至于功能，你见过哪个后台能这样登录的？还是老老实实的找管理员去注册吧", {
                time: 5000
            });
        });
        var url = '${pageContext.request.contextPath}/user/login';
        var method = 'POST';
        //登录按钮
        form.on("submit(login)", function (data) {
            var status;
            console.log(data.field);//当前容器的全部表单字段，名值对形式：{name: value}
            var startTime = new Date().getTime();
            var endTime;
            var timeConsuming;
            var codeUrl = '${pageContext.request.contextPath}/user/checkCode?code=' + $("#code").val();
            var codeMethod = 'GET';
            $(this).text("登录中...").attr("disabled", "disabled").addClass("layui-disabled");
            setTimeout(function () {
                $.ajax({
                    url: url,
                    method: method,
                    data: {
                        username: data.field.username,
                        password: data.field.password,
                    },
                    success: function (res) {
                        if (res.status) {
                            endTime = new Date().getTime();
                            timeConsuming = endTime - startTime;
                            status = '正常';
                            addLog(timeConsuming, status, data.field.username);
                            window.localStorage.setItem("access_token", res.result);
                            document.cookie = "access_token=" + res.result;
                        } else {
                            status = '异常';
                            endTime = new Date().getTime();
                            timeConsuming = endTime - startTime;
                            addLog(timeConsuming, status, data.field.username);
                            layer.msg(res.message);
                            window.location.reload();
                        }
                    }
                });
                $.ajax({
                    url: codeUrl,
                    method: codeMethod,
                    success: function (res) {
                        if (res.status) {
                            window.location.href = '${pageContext.request.contextPath}/static/index.jsp?username=' + $("#userName").val();
                        } else {
                            layer.msg(res.message);
                            $("#code").val(null);
                            $("#loginBtn").text("登录").removeAttr("disabled", "disabled").removeClass("layui-disabled");
                        }
                    }

                })
            }, 1000);
        });


        <%--//验证码--%>
        <%--$("#verCode").click(function () {--%>
        <%--$("#verCode").src = '${pageContext.request.contextPath}/code/createCode?code=' + new Date();--%>
        <%--});--%>

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

        //表单输入效果
        $(".loginBody .input-item").click(function (e) {
            e.stopPropagation();
            $(this).addClass("layui-input-focus").find(".layui-input").focus();
        });
        $(".loginBody .layui-form-item .layui-input").focus(function () {
            $(this).parent().addClass("layui-input-focus");
        });
        $(".loginBody .layui-form-item .layui-input").blur(function () {
            $(this).parent().removeClass("layui-input-focus");
            if ($(this).val() != '') {
                $(this).parent().addClass("layui-input-active");
            } else {
                $(this).parent().removeClass("layui-input-active");
            }
        });

        $("#register").click(function () {
            layer.open({
                type: 2,
                title: '注册用户',
                content: "register.jsp",
                area: ['800px', '500px'],//宽高
                offset: 'auto',	 //offset默认情况下不用设置。但如果你不想垂直水平居中
                icon: 1    //只对type=0的效
                , shade: [0.8, '#F8F8FF']
                , shadeClose: true  //点击遮罩是否关闭弹层
                , anim: 4 //设置动画
                , maxmin: true //是否显示最大化和最小化的按钮 type=1 type=2有效
            })
        })
    })

</script>
</body>
</html>
