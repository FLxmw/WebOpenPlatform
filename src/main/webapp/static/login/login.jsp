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
         style="font-size: 25px; margin-bottom: 15px; ">飞龙畅游世界平台
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
        <input type="text" style="width: 130px;" placeholder="请输入验证码" autocomplete="off" id="code" class="layui-input">
        <img src="${pageContext.request.contextPath}/code/createCode" id="verCode"
             onclick="this.src='${pageContext.request.contextPath}/code/createCode?code=' + new Date()*1"
        />
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
    </div>
</form>

<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript">
    var cacheStr = window.sessionStorage.getItem("cache"),
        oneLoginStr = window.sessionStorage.getItem("oneLogin");
    layui.use(['form', 'jquery', "layer"], function () {
        var form = layui.form,
            $ = layui.jquery,
            layer = parent.layer === undefined ? layui.layer : top.layer;

        //判断是否web端打开
        if (!/http(s*):\/\//.test(location.href)) {
            layer.alert("请先将项目部署到 localhost 下再进行访问【建议通过tomcat、webstorm、hb等方式运行，不建议通过iis方式运行】，否则部分数据将无法显示");
        } else {    //判断是否处于锁屏状态【如果关闭以后则未关闭浏览器之前不再显示】
            if (window.sessionStorage.getItem("lockcms") != "true" && window.sessionStorage.getItem("showNotice") != "true") {
                showNotice();
            }
        }

        //判断是否设置过头像，如果设置过则修改顶部、左侧和个人资料中的头像，否则使用默认头像
        if (window.sessionStorage.getItem('userFace') && $(".userAvatar").length > 0) {
            $("#userFace").attr("src", window.sessionStorage.getItem('userFace'));
            $(".userAvatar").attr("src", $(".userAvatar").attr("src").split("images/")[0] + "images/" + window.sessionStorage.getItem('userFace').split("images/")[1]);
        } else {
            $("#userFace").attr("src", "${pageContext.request.contextPath}/static/images/face.jpg");
        }

        //公告层
        function showNotice() {
            layer.open({
                type: 1,
                title: "系统公告",
                area: '300px',
                shade: 0.8,
                id: 'LAY_layuipro',
                btn: ['火速围观'],
                moveType: 1,
                content: '<div style="padding:15px 20px; text-align:justify; line-height: 22px; text-indent:2em;border-bottom:1px solid #e2e2e2;"><p class="layui-red">请使用模版前请务必仔细阅读首页右下角的《更新日志》，避免使用中遇到一些简单的问题造成困扰。</p></pclass></p><p>1.0发布以后发现很多朋友将代码上传到各种素材网站，当然这样帮我宣传我谢谢大家，但是有部分朋友上传到素材网站后将下载分值设置的相对较高，需要朋友们充钱才能下载。本人发现后通过和站长、网站管理员联系以后将分值调整为不需要充值才能下载或者直接免费下载。在此郑重提示各位：<span class="layui-red">本模版已进行作品版权证明，不管以何种形式获取的源码，请勿进行出售或者上传到任何素材网站，否则将追究相应的责任。</span></p></div>',
                success: function (layero) {
                    var btn = layero.find('.layui-layer-btn');
                    btn.css('text-align', 'center');
                    btn.on("click", function () {
                        tipsShow();
                    });
                },
                cancel: function (index, layero) {
                    tipsShow();
                }
            });
        }

        function tipsShow() {
            window.sessionStorage.setItem("showNotice", "true");
            if ($(window).width() > 432) {  //如果页面宽度不足以显示顶部“系统公告”按钮，则不提示
                layer.tips('系统公告躲在了这里', '#userInfo', {
                    tips: 3,
                    time: 1000
                });
            }
        }

        $(".showNotice").on("click", function () {
            showNotice();
        });

        //锁屏
        function lockPage() {
            layer.open({
                title: false,
                type: 1,
                content: '<div class="admin-header-lock" id="lock-box">' +
                    '<div class="admin-header-lock-img"><img src="images/face.jpg" class="userAvatar"/></div>' +
                    '<div class="admin-header-lock-name" id="lockUserName">驊驊龔頾</div>' +
                    '<div class="input_btn">' +
                    '<input type="password" class="admin-header-lock-input layui-input" autocomplete="off" placeholder="请输入密码解锁.." name="lockPwd" id="lockPwd" />' +
                    '<button class="layui-btn" id="unlock">解锁</button>' +
                    '</div>' +
                    '<p>请输入“123456”，否则不会解锁成功哦！！！</p>' +
                    '</div>',
                closeBtn: 0,
                shade: 0.9,
                success: function () {
                    //判断是否设置过头像，如果设置过则修改顶部、左侧和个人资料中的头像，否则使用默认头像
                    if (window.sessionStorage.getItem('userFace') && $(".userAvatar").length > 0) {
                        $(".userAvatar").attr("src", $(".userAvatar").attr("src").split("images/")[0] + "images/" + window.sessionStorage.getItem('userFace').split("images/")[1]);
                    }
                }
            })
            $(".admin-header-lock-input").focus();
        }

        $(".lockcms").on("click", function () {
            window.sessionStorage.setItem("lockcms", true);
            lockPage();
        })
        // 判断是否显示锁屏
        if (window.sessionStorage.getItem("lockcms") == "true") {
            lockPage();
        }
        // 解锁
        $("body").on("click", "#unlock", function () {
            if ($(this).siblings(".admin-header-lock-input").val() == '') {
                layer.msg("请输入解锁密码！");
                $(this).siblings(".admin-header-lock-input").focus();
            } else {
                if ($(this).siblings(".admin-header-lock-input").val() == "123456") {
                    window.sessionStorage.setItem("lockcms", false);
                    $(this).siblings(".admin-header-lock-input").val('');
                    layer.closeAll("page");
                } else {
                    layer.msg("密码错误，请重新输入！");
                    $(this).siblings(".admin-header-lock-input").val('').focus();
                }
            }
        });
        $(document).on('keydown', function (event) {
            var event = event || window.event;
            if (event.keyCode == 13) {
                $("#unlock").click();
            }
        });

        //退出
        $(".signOut").click(function () {
            window.sessionStorage.removeItem("menu");
            menu = [];
            window.sessionStorage.removeItem("curmenu");
        })

        //功能设定
        $(".functionSetting").click(function () {
            layer.open({
                title: "功能设定",
                area: ["380px", "280px"],
                type: "1",
                content: '<div class="functionSrtting_box">' +
                    '<form class="layui-form">' +
                    '<div class="layui-form-item">' +
                    '<label class="layui-form-label">开启Tab缓存</label>' +
                    '<div class="layui-input-block">' +
                    '<input type="checkbox" name="cache" lay-skin="switch" lay-text="开|关">' +
                    '<div class="layui-word-aux">开启后刷新页面不关闭打开的Tab页</div>' +
                    '</div>' +
                    '</div>' +
                    '<div class="layui-form-item">' +
                    '<label class="layui-form-label">Tab切换刷新</label>' +
                    '<div class="layui-input-block">' +
                    '<input type="checkbox" name="changeRefresh" lay-skin="switch" lay-text="开|关">' +
                    '<div class="layui-word-aux">开启后切换窗口刷新当前页面</div>' +
                    '</div>' +
                    '</div>' +
                    '<div class="layui-form-item">' +
                    '<label class="layui-form-label">单一登陆</label>' +
                    '<div class="layui-input-block">' +
                    '<input type="checkbox" name="oneLogin" lay-filter="multipleLogin" lay-skin="switch" lay-text="是|否">' +
                    '<div class="layui-word-aux">开启后不可同时多个地方登录</div>' +
                    '</div>' +
                    '</div>' +
                    '<div class="layui-form-item skinBtn">' +
                    '<a href="javascript:;" class="layui-btn layui-btn-sm layui-btn-normal" lay-submit="" lay-filter="settingSuccess">设定完成</a>' +
                    '<a href="javascript:;" class="layui-btn layui-btn-sm layui-btn-primary" lay-submit="" lay-filter="noSetting">朕再想想</a>' +
                    '</div>' +
                    '</form>' +
                    '</div>',
                success: function (index, layero) {
                    //如果之前设置过，则设置它的值
                    $(".functionSrtting_box input[name=cache]").prop("checked", cacheStr == "true" ? true : false);
                    $(".functionSrtting_box input[name=changeRefresh]").prop("checked", changeRefreshStr == "true" ? true : false);
                    $(".functionSrtting_box input[name=oneLogin]").prop("checked", oneLoginStr == "true" ? true : false);
                    //设定
                    form.on("submit(settingSuccess)", function (data) {
                        window.sessionStorage.setItem("cache", data.field.cache == "on" ? "true" : "false");
                        window.sessionStorage.setItem("changeRefresh", data.field.changeRefresh == "on" ? "true" : "false");
                        window.sessionStorage.setItem("oneLogin", data.field.oneLogin == "on" ? "true" : "false");
                        window.sessionStorage.removeItem("menu");
                        window.sessionStorage.removeItem("curmenu");
                        location.reload();
                        return false;
                    });
                    //取消设定
                    form.on("submit(noSetting)", function () {
                        layer.closeAll("page");
                    });
                    //单一登陆提示
                    form.on('switch(multipleLogin)', function (data) {
                        layer.tips('温馨提示：此功能需要开发配合，所以没有功能演示，敬请谅解', data.othis, {tips: 1})
                    });
                    form.render();  //表单渲染
                }
            })
        })

        //判断是否修改过系统基本设置，去显示底部版权信息
        if (window.sessionStorage.getItem("systemParameter")) {
            systemParameter = JSON.parse(window.sessionStorage.getItem("systemParameter"));
            $(".footer p span").text(systemParameter.powerby);
        }

        //更换皮肤
        function skins() {
            var skin = window.sessionStorage.getItem("skin");
            if (skin) {  //如果更换过皮肤
                if (window.sessionStorage.getItem("skinValue") != "自定义") {
                    $("body").addClass(window.sessionStorage.getItem("skin"));
                } else {
                    $(".layui-layout-admin .layui-header").css("background-color", skin.split(',')[0]);
                    $(".layui-bg-black").css("background-color", skin.split(',')[1]);
                    $(".hideMenu").css("background-color", skin.split(',')[2]);
                }
            }
        }

        skins();
        $(".changeSkin").click(function () {
            layer.open({
                title: "更换皮肤",
                area: ["310px", "280px"],
                type: "1",
                content: '<div class="skins_box">' +
                    '<form class="layui-form">' +
                    '<div class="layui-form-item">' +
                    '<input type="radio" name="skin" value="默认" title="默认" lay-filter="default" checked="">' +
                    '<input type="radio" name="skin" value="橙色" title="橙色" lay-filter="orange">' +
                    '<input type="radio" name="skin" value="蓝色" title="蓝色" lay-filter="blue">' +
                    '<input type="radio" name="skin" value="自定义" title="自定义" lay-filter="custom">' +
                    '<div class="skinCustom">' +
                    '<input type="text" class="layui-input topColor" name="topSkin" placeholder="顶部颜色" />' +
                    '<input type="text" class="layui-input leftColor" name="leftSkin" placeholder="左侧颜色" />' +
                    '<input type="text" class="layui-input menuColor" name="btnSkin" placeholder="顶部菜单按钮" />' +
                    '</div>' +
                    '</div>' +
                    '<div class="layui-form-item skinBtn">' +
                    '<a href="javascript:;" class="layui-btn layui-btn-sm layui-btn-normal" lay-submit="" lay-filter="changeSkin">确定更换</a>' +
                    '<a href="javascript:;" class="layui-btn layui-btn-sm layui-btn-primary" lay-submit="" lay-filter="noChangeSkin">朕再想想</a>' +
                    '</div>' +
                    '</form>' +
                    '</div>',
                success: function (index, layero) {
                    var skin = window.sessionStorage.getItem("skin");
                    if (window.sessionStorage.getItem("skinValue")) {
                        $(".skins_box input[value=" + window.sessionStorage.getItem("skinValue") + "]").attr("checked", "checked");
                    }
                    ;
                    if ($(".skins_box input[value=自定义]").attr("checked")) {
                        $(".skinCustom").css("visibility", "inherit");
                        $(".topColor").val(skin.split(',')[0]);
                        $(".leftColor").val(skin.split(',')[1]);
                        $(".menuColor").val(skin.split(',')[2]);
                    }
                    ;
                    form.render();
                    $(".skins_box").removeClass("layui-hide");
                    $(".skins_box .layui-form-radio").on("click", function () {
                        var skinColor;
                        if ($(this).find("div").text() == "橙色") {
                            skinColor = "orange";
                        } else if ($(this).find("div").text() == "蓝色") {
                            skinColor = "blue";
                        } else if ($(this).find("div").text() == "默认") {
                            skinColor = "";
                        }
                        if ($(this).find("div").text() != "自定义") {
                            $(".topColor,.leftColor,.menuColor").val('');
                            $("body").removeAttr("class").addClass("main_body " + skinColor + "");
                            $(".skinCustom").removeAttr("style");
                            $(".layui-bg-black,.hideMenu,.layui-layout-admin .layui-header").removeAttr("style");
                        } else {
                            $(".skinCustom").css("visibility", "inherit");
                        }
                    })
                    var skinStr, skinColor;
                    $(".topColor").blur(function () {
                        $(".layui-layout-admin .layui-header").css("background-color", $(this).val() + " !important");
                    })
                    $(".leftColor").blur(function () {
                        $(".layui-bg-black").css("background-color", $(this).val() + " !important");
                    })
                    $(".menuColor").blur(function () {
                        $(".hideMenu").css("background-color", $(this).val() + " !important");
                    })

                    form.on("submit(changeSkin)", function (data) {
                        if (data.field.skin != "自定义") {
                            if (data.field.skin == "橙色") {
                                skinColor = "orange";
                            } else if (data.field.skin == "蓝色") {
                                skinColor = "blue";
                            } else if (data.field.skin == "默认") {
                                skinColor = "";
                            }
                            window.sessionStorage.setItem("skin", skinColor);
                        } else {
                            skinStr = $(".topColor").val() + ',' + $(".leftColor").val() + ',' + $(".menuColor").val();
                            window.sessionStorage.setItem("skin", skinStr);
                            $("body").removeAttr("class").addClass("main_body");
                        }
                        window.sessionStorage.setItem("skinValue", data.field.skin);
                        layer.closeAll("page");
                    });
                    form.on("submit(noChangeSkin)", function () {
                        $("body").removeAttr("class").addClass("main_body " + window.sessionStorage.getItem("skin") + "");
                        $(".layui-bg-black,.hideMenu,.layui-layout-admin .layui-header").removeAttr("style");
                        skins();
                        layer.closeAll("page");
                    });
                },
                cancel: function () {
                    $("body").removeAttr("class").addClass("main_body " + window.sessionStorage.getItem("skin") + "");
                    $(".layui-bg-black,.hideMenu,.layui-layout-admin .layui-header").removeAttr("style");
                    skins();
                }
            })
        })

    })
</script>
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
                        password: data.field.password
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
                            window.location.href = '${pageContext.request.contextPath}/index.jsp?username=' + $("#userName").val();
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
