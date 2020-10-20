<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui后台管理模板 2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="static/favicon.ico">
    <link rel="stylesheet" href="static/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="static/aliicon/iconfont.css">
    <link rel="stylesheet" href="static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="static/css/index.css" media="all"/>
</head>
<body class="main_body">
<div class="layui-layout layui-layout-admin">
    <!-- 顶部 -->
    <div class="layui-header header">
        <div class="layui-main mag0">
            <a href="#" class="logo">开放平台管理</a>
            <!-- 显示/隐藏菜单 -->
            <a href="javascript:;" class="seraph hideMenu icon-caidan"></a>
            <!-- 顶级菜单 -->
            <ul class="layui-nav mobileTopLevelMenus" mobile>
                <li class="layui-nav-item" data-menu="contentManagement">
                    <a href="javascript:;"><i class="seraph icon-caidan"></i><cite>layuiCMS</cite></a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this" data-menu="contentManagement"><a href="javascript:;"><i
                                class="layui-icon" data-icon="&#xe63c;">&#xe63c;</i><cite>内容管理</cite></a></dd>
                        <dd data-menu="basic"><a href="javascript:;"><i class="fa fa-bars" aria-hidden="true"></i><cite>基础管理</cite></a>
                        </dd>
                        <dd data-menu="memberCenter"><a href="javascript:;"><i class="seraph icon-icon10"
                                                                               data-icon="icon-icon10"></i><cite>用户管理</cite></a>
                        </dd>
                        <dd data-menu="systemSettings"><a href="javascript:;"><i class="layui-icon"
                                                                                 data-icon="&#xe620;">&#xe620;</i><cite>系统管理</cite></a>
                        </dd>
                        <dd data-menu="seraphApi"><a href="javascript:;"><i class="layui-icon" data-icon="&#xe705;">&#xe705;</i><cite>文档管理</cite></a>
                        </dd>
                    </dl>
                </li>
            </ul>
            <ul class="layui-nav topLevelMenus" pc>
                <li class="layui-nav-item layui-this" data-menu="contentManagement">
                    <a href="javascript:;"><i class="layui-icon" data-icon="&#xe63c;">&#xe63c;</i><cite>内容管理</cite></a>
                </li>
                <li class="layui-nav-item" data-menu="basic">
                    <a href="javascript:;"><i class="fa fa-bars" aria-hidden="true"></i><cite>基础管理</cite></a>
                </li>
                <li class="layui-nav-item" data-menu="memberCenter" pc>
                    <a href="javascript:;"><i class="seraph icon-icon10"
                                              data-icon="icon-icon10"></i><cite>用户管理</cite></a>
                </li>
                <li class="layui-nav-item" data-menu="systemSettings" pc>
                    <a href="javascript:;"><i class="layui-icon" data-icon="&#xe620;">&#xe620;</i><cite>系统管理</cite></a>
                </li>
                <li class="layui-nav-item" data-menu="seraphApi" pc>
                    <a href="javascript:;"><i class="layui-icon" data-icon="&#xe705;">&#xe705;</i><cite>文档管理</cite></a>
                </li>
            </ul>
            <!-- 顶部右侧菜单 -->
            <ul class="layui-nav top_menu">
                <li class="layui-nav-item" pc>
                    <a href="javascript:;" class="clearCache"><i class="layui-icon"
                                                                 data-icon="&#xe640;">&#xe640;</i><cite>清除缓存</cite><span
                            class="layui-badge-dot"></span></a>
                </li>
                <li class="layui-nav-item lockcms" pc>
                    <a href="javascript:;"><i class="seraph icon-lock"></i><cite>锁屏</cite></a>
                </li>
                <li class="layui-nav-item" id="userInfo">
                    <a href="javascript:;"><img src="static/images/face.jpg" class="layui-nav-img userAvatar" width="35"
                                                height="35"><cite class="adminName">${param.username}</cite></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;"
                               data-url="${pageContext.request.contextPath}/user/findUser?username=${param.username}"><i
                                class="seraph icon-ziliao"
                                data-icon="icon-ziliao"></i><cite>个人资料</cite></a>
                        </dd>
                        <dd><a href="javascript:;" data-url="page/uu/changePwd.jsp?username=${param.username}"><i
                                class="seraph icon-xiugai"
                                data-icon="icon-xiugai"></i><cite>修改密码</cite></a>
                        </dd>
                        <dd><a href="javascript:;" class="showNotice"><i
                                class="layui-icon">&#xe645;</i><cite>系统公告</cite><span
                                class="layui-badge-dot"></span></a></dd>
                        <dd pc><a href="javascript:;" class="functionSetting"><i class="layui-icon">&#xe620;</i><cite>功能设定</cite><span
                                class="layui-badge-dot"></span></a></dd>
                        <dd pc><a href="javascript:;" class="changeSkin"><i
                                class="layui-icon">&#xe61b;</i><cite>更换皮肤</cite></a></dd>
                        <dd><a href="static/login/login.jsp" class="signOut"><i class="seraph icon-tuichu"></i><cite>退出</cite></a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <!-- 左侧导航 -->
    <div class="layui-side layui-bg-black">
        <div class="user-photo">
            <a class="img" title="我的头像"><img src="static/images/face.jpg" class="userAvatar"></a>
            <p>你好！<span class="userName">${param.username}</span>, 欢迎登录</p>
        </div>
        <!-- 搜索 -->
        <div class="layui-form component">
            <select name="search" id="search" lay-search lay-filter="searchPage">
                <option value="">搜索页面或功能</option>
                <option value="1">layer</option>
                <option value="2">form</option>
            </select>
            <i class="layui-icon">&#xe615;</i>
        </div>
        <div class="navBar layui-side-scroll" id="navBar">
            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item layui-this">
                    <a href="javascript:;" data-url="page/main.html"><i class="layui-icon"
                                                                        data-icon=""></i><cite>后台首页</cite></a>
                </li>
            </ul>
        </div>
    </div>
    <!-- 右侧内容 -->
    <div class="layui-body layui-form">
        <div class="layui-tab mag0" lay-filter="bodyTab" id="top_tabs_box">
            <ul class="layui-tab-title top_tab" id="top_tabs">
                <li class="layui-this" lay-id=""><i class="layui-icon">&#xe68e;</i> <cite>后台首页</cite></li>
            </ul>
            <ul class="layui-nav closeBox">
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon caozuo">&#xe643;</i> 页面操作</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#xe669;</i>
                            刷新当前</a></dd>
                        <dd><a href="javascript:;" class="closePageOther"><i class="seraph icon-prohibit"></i> 关闭其他</a>
                        </dd>
                        <dd><a href="javascript:;" class="closePageAll"><i class="seraph icon-guanbi"></i> 关闭全部</a></dd>
                    </dl>
                </li>
            </ul>
            <div class="layui-tab-content clildFrame">
                <div class="layui-tab-item layui-show">
                    <iframe src="static/page/main.jsp?username=${param.username}"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- 底部 -->
    <div class="layui-footer footer">
        <p><span>copyright @2020 飞龙</span><a onclick="donation()"
                                             class="layui-btn layui-btn-danger layui-btn-sm">捐赠作者</a></p>
    </div>
</div>

<!-- 移动导航 -->
<div class="site-tree-mobile"><i class="layui-icon">&#xe602;</i></div>
<div class="site-mobile-shade"></div>
<script type="text/javascript" src="static/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['layer'], function () {
        var layer = layui.layer;
        var username = "${username}";
        if (!username) {
            window.location.href = 'static/login/login.jsp'
        }
    });
</script>
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
                    '<div class="admin-header-lock-img"><img src="static/images/face.jpg" class="userAvatar"/></div>' +
                    '<div class="admin-header-lock-name" id="lockUserName" style="color: #FF4500;font-size: 20px;">飞龙</div>' +
                    '<div class="input_btn">' +
                    '<input type="password" class="admin-header-lock-input layui-input layui-bg-blue" autocomplete="off" placeholder="请输入密码解锁.." name="lockPwd" id="lockPwd" />' +
                    '<button class="layui-btn layui-btn-warm" id="unlock">解锁</button>' +
                    '</div>' +
                    '<p style="color:#32CD32">请输入“123456”，否则不会解锁成功哦！！！</p>' +
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
    var $, tab, dataStr, layer;

    console.log(window.localStorage.getItem("access_token"));
    //用于
    layui.config({
        base: "js/"
    }).extend({
        "bodyTab": "bodyTab"
    });
    layui.use(['bodyTab', 'form', 'element', 'layer', 'jquery'], function () {
        var form = layui.form,
            element = layui.element;
        $ = layui.$;
        layer = parent.layer === undefined ? layui.layer : top.layer;
        tab = layui.bodyTab({
            openTabNum: "50",  //最大可打开窗口数量
            url: "${pageContext.request.contextPath}/navs/getNavs" //获取菜单json地址
        });


        //通过顶部菜单获取左侧二三级菜单   注：此处只做演示之用，实际开发中通过接口传参的方式获取导航数据
        function getData(json) {
            $.getJSON(tab.tabConfig.url, function (data) {
                // dataStr = data;
                // //重新渲染左侧菜单
                // tab.render();
                if (json == "contentManagement") {
                    dataStr = data.contentManagement;
                    //重新渲染左侧菜单
                    tab.render();
                } else if (json == "memberCenter") {
                    dataStr = data.memberCenter;
                    //重新渲染左侧菜单
                    tab.render();
                } else if (json == "systemSettings") {
                    dataStr = data.systemSettings;
                    //重新渲染左侧菜单
                    tab.render();
                } else if (json == "seraphApi") {
                    dataStr = data.seraphApi;
                    //重新渲染左侧菜单
                    tab.render();
                } else if (json == "basic") {
                    dataStr = data.basic;
                    //重新渲染左侧菜单
                    tab.render();
                }
            })
        }

        //页面加载时判断左侧菜单是否显示
        //通过顶部菜单获取左侧菜单
        $(".topLevelMenus li,.mobileTopLevelMenus dd").click(function () {
            if ($(this).parents(".mobileTopLevelMenus").length != "0") {
                $(".topLevelMenus li").eq($(this).index()).addClass("layui-this").siblings().removeClass("layui-this");
            } else {
                $(".mobileTopLevelMenus dd").eq($(this).index()).addClass("layui-this").siblings().removeClass("layui-this");
            }
            $(".layui-layout-admin").removeClass("showMenu");
            $("body").addClass("site-mobile");
            getData($(this).data("menu"));
            //渲染顶部窗口
            tab.tabMove();
        })

        //隐藏左侧导航
        $(".hideMenu").click(function () {
            if ($(".topLevelMenus li.layui-this a").data("url")) {
                layer.msg("此栏目状态下左侧菜单不可展开");  //主要为了避免左侧显示的内容与顶部菜单不匹配
                return false;
            }
            $(".layui-layout-admin").toggleClass("showMenu");
            //渲染顶部窗口
            tab.tabMove();
        })

        //通过顶部菜单获取左侧二三级菜单   注：此处只做演示之用，实际开发中通过接口传参的方式获取导航数据
        getData("contentManagement");

        //手机设备的简单适配
        $('.site-tree-mobile').on('click', function () {
            $('body').addClass('site-mobile');
        });
        $('.site-mobile-shade').on('click', function () {
            $('body').removeClass('site-mobile');
        });

        // 添加新窗口
        $("body").on("click", ".layui-nav .layui-nav-item a:not('.mobileTopLevelMenus .layui-nav-item a')", function () {
            //如果不存在子级
            if ($(this).siblings().length == 0) {
                addTab($(this));
                $('body').removeClass('site-mobile');  //移动端点击菜单关闭菜单层
            }
            $(this).parent("li").siblings().removeClass("layui-nav-itemed");
        })

        //清除缓存
        $(".clearCache").click(function () {
            window.sessionStorage.clear();
            window.localStorage.clear();
            var index = layer.msg('清除缓存中，请稍候', {icon: 16, time: false, shade: 0.8});
            setTimeout(function () {
                layer.close(index);
                layer.msg("缓存清除成功！");
            }, 1000);
        })

        //刷新后还原打开的窗口
        if (cacheStr == "true") {
            if (window.sessionStorage.getItem("menu") != null) {
                menu = JSON.parse(window.sessionStorage.getItem("menu"));
                curmenu = window.sessionStorage.getItem("curmenu");
                var openTitle = '';
                for (var i = 0; i < menu.length; i++) {
                    openTitle = '';
                    if (menu[i].icon) {
                        if (menu[i].icon.split("-")[0] == 'icon') {
                            openTitle += '<i class="seraph ' + menu[i].icon + '"></i>';
                        } else {
                            openTitle += '<i class="layui-icon">' + menu[i].icon + '</i>';
                        }
                    }
                    openTitle += '<cite>' + menu[i].title + '</cite>';
                    openTitle += '<i class="layui-icon layui-unselect layui-tab-close" data-id="' + menu[i].layId + '">&#x1006;</i>';
                    element.tabAdd("bodyTab", {
                        title: openTitle,
                        content: "<iframe src='" + menu[i].href + "' data-id='" + menu[i].layId + "'></frame>",
                        id: menu[i].layId
                    })
                    //定位到刷新前的窗口
                    if (curmenu != "undefined") {
                        if (curmenu == '' || curmenu == "null") {  //定位到后台首页
                            element.tabChange("bodyTab", '');
                        } else if (JSON.parse(curmenu).title == menu[i].title) {  //定位到刷新前的页面
                            element.tabChange("bodyTab", menu[i].layId);
                        }
                    } else {
                        element.tabChange("bodyTab", menu[menu.length - 1].layId);
                    }
                }
                //渲染顶部窗口
                tab.tabMove();
            }
        } else {
            window.sessionStorage.removeItem("menu");
            window.sessionStorage.removeItem("curmenu");
        }
    })

    //打开新窗口
    function addTab(_this) {
        tab.tabAdd(_this);
    }

    //捐赠弹窗
    function donation() {
        layer.tab({
            area: ['260px', '350px'],
            tab: [{
                title: "微信",
                content: "<div style='padding:30px;overflow:hidden;background:#d2d0d0;'><img src='static/images/weixin.png'></div>"
            }, {
                title: "支付宝",
                content: "<div style='padding:30px;overflow:hidden;background:#d2d0d0;'><img src='static/images/alipay.jpg'></div>"
            }]
        })
    }

    //图片管理弹窗
    function showImg() {
        $.getJSON('${pageContext.request.contextPath}/image/showPhoto', function (json) {
            layer.photos({
                photos: json,
                anim: 5
            });
        });
    }
</script>
</body>
</html>
