<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>系统基本参数--layui后台管理模板 2.0</title>
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
<form class="layui-form" action="#" method="post" lay-filter="dataFrm" id="dataFrm">
    <table class="layui-table mag0" id="appInfoTable" lay-filter="appInfoTable">
        <colgroup>
            <col width="25%">
            <col width="45%">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>参数说明</th>
            <th>参数值</th>
            <th pc>变量名</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><input type="hidden" name="id" class="id"/></td>
        </tr>
        <tr>
            <td>网站名称</td>
            <td><input type="text" name="netName" class="layui-input netName" lay-verify="required"
                       placeholder="请输入模版名称"></td>
            <td pc>netName</td>
        </tr>
        <tr>
            <td>当前版本</td>
            <td><input type="text" name="version" class="layui-input version" placeholder="请输入当前模版版本"></td>
            <td pc>version</td>
        </tr>
        <tr>
            <td>开发作者</td>
            <td><input type="text" name="author" class="layui-input author" placeholder="请输入开发作者"></td>
            <td pc>author</td>
        </tr>
        <tr>
            <td>网站首页</td>
            <td><input type="text" name="homePage" class="layui-input homePage" placeholder="请输入网站首页"></td>
            <td pc>homePage</td>
        </tr>
        <tr>
            <td>服务器环境</td>
            <td><input type="text" name="serverEn" class="layui-input serverEn" placeholder="请输入服务器环境"></td>
            <td pc>serverEn</td>
        </tr>
        <tr>
            <td>数据库版本</td>
            <td><input type="text" name="dbVersion" class="layui-input dbVersion" placeholder="请输入数据库版本"></td>
            <td pc>dbVersion</td>
        </tr>
        <tr>
            <td>最大上传限制</td>
            <td><input type="text" name="maxUpload" class="layui-input maxUpload" placeholder="请输入最大上传限制"></td>
            <td pc>maxUpload</td>
        </tr>
        <tr>
            <td>用户权限</td>
            <td><input type="text" name="userLimit" class="layui-input userLimit" placeholder="请输入当前用户权限"></td>
            <td pc>userLimit</td>
        </tr>
        <tr>
            <td>版权信息</td>
            <td><input type="text" name="powerby" class="layui-input powerby" placeholder="请输入网站版权信息"></td>
            <td pc>powerby</td>
        </tr>
        <tr>
            <td>网站描述</td>
            <td><textarea name="description" placeholder="请输入网站描述" class="layui-textarea description"></textarea></td>
            <td pc>description</td>
        </tr>
        <tr>
            <td>网站备案号</td>
            <td><input type="text" name="record" class="layui-input record" placeholder="请输入网站备案号"></td>
            <td pc>record</td>
        </tr>
        </tbody>
    </table>
    <div class="magt10 layui-right">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="systemParameter">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="../../layui/layui.js"></script>
<%--<script type="text/javascript" src="../../js/cache.js"></script>--%>
<script type="text/javascript">
    var cacheStr = window.sessionStorage.getItem("cache"),
        oneLoginStr = window.sessionStorage.getItem("oneLogin");
    layui.use(['form','jquery',"layer"],function() {
        var form = layui.form,
            $ = layui.jquery,
            layer = parent.layer === undefined ? layui.layer : top.layer;

        //判断是否web端打开
        if(!/http(s*):\/\//.test(location.href)){
            layer.alert("请先将项目部署到 localhost 下再进行访问【建议通过tomcat、webstorm、hb等方式运行，不建议通过iis方式运行】，否则部分数据将无法显示");
        }else{    //判断是否处于锁屏状态【如果关闭以后则未关闭浏览器之前不再显示】
            if(window.sessionStorage.getItem("lockcms") != "true" && window.sessionStorage.getItem("showNotice") != "true"){
                showNotice();
            }
        }

        //判断是否设置过头像，如果设置过则修改顶部、左侧和个人资料中的头像，否则使用默认头像
        if(window.sessionStorage.getItem('userFace') &&  $(".userAvatar").length > 0){
            $("#userFace").attr("src",window.sessionStorage.getItem('userFace'));
            $(".userAvatar").attr("src",$(".userAvatar").attr("src").split("images/")[0] + "images/" + window.sessionStorage.getItem('userFace').split("images/")[1]);
        }else{
            $("#userFace").attr("src","${pageContext.request.contextPath}/static/images/face.jpg");
        }

        //公告层
        function showNotice(){
            layer.open({
                type: 1,
                title: "系统公告",
                area: '300px',
                shade: 0.8,
                id: 'LAY_layuipro',
                btn: ['火速围观'],
                moveType: 1,
                content: '<div style="padding:15px 20px; text-align:justify; line-height: 22px; text-indent:2em;border-bottom:1px solid #e2e2e2;"><p class="layui-red">请使用模版前请务必仔细阅读首页右下角的《更新日志》，避免使用中遇到一些简单的问题造成困扰。</p></pclass></p><p>1.0发布以后发现很多朋友将代码上传到各种素材网站，当然这样帮我宣传我谢谢大家，但是有部分朋友上传到素材网站后将下载分值设置的相对较高，需要朋友们充钱才能下载。本人发现后通过和站长、网站管理员联系以后将分值调整为不需要充值才能下载或者直接免费下载。在此郑重提示各位：<span class="layui-red">本模版已进行作品版权证明，不管以何种形式获取的源码，请勿进行出售或者上传到任何素材网站，否则将追究相应的责任。</span></p></div>',
                success: function(layero){
                    var btn = layero.find('.layui-layer-btn');
                    btn.css('text-align', 'center');
                    btn.on("click",function(){
                        tipsShow();
                    });
                },
                cancel: function(index, layero){
                    tipsShow();
                }
            });
        }
        function tipsShow(){
            window.sessionStorage.setItem("showNotice","true");
            if($(window).width() > 432){  //如果页面宽度不足以显示顶部“系统公告”按钮，则不提示
                layer.tips('系统公告躲在了这里', '#userInfo', {
                    tips: 3,
                    time : 1000
                });
            }
        }
        $(".showNotice").on("click",function(){
            showNotice();
        });

        //锁屏
        function lockPage(){
            layer.open({
                title : false,
                type : 1,
                content : '<div class="admin-header-lock" id="lock-box">'+
                    '<div class="admin-header-lock-img"><img src="images/face.jpg" class="userAvatar"/></div>'+
                    '<div class="admin-header-lock-name" id="lockUserName">驊驊龔頾</div>'+
                    '<div class="input_btn">'+
                    '<input type="password" class="admin-header-lock-input layui-input" autocomplete="off" placeholder="请输入密码解锁.." name="lockPwd" id="lockPwd" />'+
                    '<button class="layui-btn" id="unlock">解锁</button>'+
                    '</div>'+
                    '<p>请输入“123456”，否则不会解锁成功哦！！！</p>'+
                    '</div>',
                closeBtn : 0,
                shade : 0.9,
                success : function(){
                    //判断是否设置过头像，如果设置过则修改顶部、左侧和个人资料中的头像，否则使用默认头像
                    if(window.sessionStorage.getItem('userFace') &&  $(".userAvatar").length > 0){
                        $(".userAvatar").attr("src",$(".userAvatar").attr("src").split("images/")[0] + "images/" + window.sessionStorage.getItem('userFace').split("images/")[1]);
                    }
                }
            })
            $(".admin-header-lock-input").focus();
        }
        $(".lockcms").on("click",function(){
            window.sessionStorage.setItem("lockcms",true);
            lockPage();
        })
        // 判断是否显示锁屏
        if(window.sessionStorage.getItem("lockcms") == "true"){
            lockPage();
        }
        // 解锁
        $("body").on("click","#unlock",function(){
            if($(this).siblings(".admin-header-lock-input").val() == ''){
                layer.msg("请输入解锁密码！");
                $(this).siblings(".admin-header-lock-input").focus();
            }else{
                if($(this).siblings(".admin-header-lock-input").val() == "123456"){
                    window.sessionStorage.setItem("lockcms",false);
                    $(this).siblings(".admin-header-lock-input").val('');
                    layer.closeAll("page");
                }else{
                    layer.msg("密码错误，请重新输入！");
                    $(this).siblings(".admin-header-lock-input").val('').focus();
                }
            }
        });
        $(document).on('keydown', function(event) {
            var event = event || window.event;
            if(event.keyCode == 13) {
                $("#unlock").click();
            }
        });

        //退出
        $(".signOut").click(function(){
            window.sessionStorage.removeItem("menu");
            menu = [];
            window.sessionStorage.removeItem("curmenu");
        })

        //功能设定
        $(".functionSetting").click(function(){
            layer.open({
                title: "功能设定",
                area: ["380px", "280px"],
                type: "1",
                content :  '<div class="functionSrtting_box">'+
                    '<form class="layui-form">'+
                    '<div class="layui-form-item">'+
                    '<label class="layui-form-label">开启Tab缓存</label>'+
                    '<div class="layui-input-block">'+
                    '<input type="checkbox" name="cache" lay-skin="switch" lay-text="开|关">'+
                    '<div class="layui-word-aux">开启后刷新页面不关闭打开的Tab页</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="layui-form-item">'+
                    '<label class="layui-form-label">Tab切换刷新</label>'+
                    '<div class="layui-input-block">'+
                    '<input type="checkbox" name="changeRefresh" lay-skin="switch" lay-text="开|关">'+
                    '<div class="layui-word-aux">开启后切换窗口刷新当前页面</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="layui-form-item">'+
                    '<label class="layui-form-label">单一登陆</label>'+
                    '<div class="layui-input-block">'+
                    '<input type="checkbox" name="oneLogin" lay-filter="multipleLogin" lay-skin="switch" lay-text="是|否">'+
                    '<div class="layui-word-aux">开启后不可同时多个地方登录</div>'+
                    '</div>'+
                    '</div>'+
                    '<div class="layui-form-item skinBtn">'+
                    '<a href="javascript:;" class="layui-btn layui-btn-sm layui-btn-normal" lay-submit="" lay-filter="settingSuccess">设定完成</a>'+
                    '<a href="javascript:;" class="layui-btn layui-btn-sm layui-btn-primary" lay-submit="" lay-filter="noSetting">朕再想想</a>'+
                    '</div>'+
                    '</form>'+
                    '</div>',
                success : function(index, layero){
                    //如果之前设置过，则设置它的值
                    $(".functionSrtting_box input[name=cache]").prop("checked",cacheStr=="true" ? true : false);
                    $(".functionSrtting_box input[name=changeRefresh]").prop("checked",changeRefreshStr=="true" ? true : false);
                    $(".functionSrtting_box input[name=oneLogin]").prop("checked",oneLoginStr=="true" ? true : false);
                    //设定
                    form.on("submit(settingSuccess)",function(data){
                        window.sessionStorage.setItem("cache",data.field.cache=="on" ? "true" : "false");
                        window.sessionStorage.setItem("changeRefresh",data.field.changeRefresh=="on" ? "true" : "false");
                        window.sessionStorage.setItem("oneLogin",data.field.oneLogin=="on" ? "true" : "false");
                        window.sessionStorage.removeItem("menu");
                        window.sessionStorage.removeItem("curmenu");
                        location.reload();
                        return false;
                    });
                    //取消设定
                    form.on("submit(noSetting)",function(){
                        layer.closeAll("page");
                    });
                    //单一登陆提示
                    form.on('switch(multipleLogin)', function(data){
                        layer.tips('温馨提示：此功能需要开发配合，所以没有功能演示，敬请谅解', data.othis,{tips: 1})
                    });
                    form.render();  //表单渲染
                }
            })
        })

        //判断是否修改过系统基本设置，去显示底部版权信息
        if(window.sessionStorage.getItem("systemParameter")){
            systemParameter = JSON.parse(window.sessionStorage.getItem("systemParameter"));
            $(".footer p span").text(systemParameter.powerby);
        }

        //更换皮肤
        function skins(){
            var skin = window.sessionStorage.getItem("skin");
            if(skin){  //如果更换过皮肤
                if(window.sessionStorage.getItem("skinValue") != "自定义"){
                    $("body").addClass(window.sessionStorage.getItem("skin"));
                }else{
                    $(".layui-layout-admin .layui-header").css("background-color",skin.split(',')[0]);
                    $(".layui-bg-black").css("background-color",skin.split(',')[1]);
                    $(".hideMenu").css("background-color",skin.split(',')[2]);
                }
            }
        }
        skins();
        $(".changeSkin").click(function(){
            layer.open({
                title : "更换皮肤",
                area : ["310px","280px"],
                type : "1",
                content : '<div class="skins_box">'+
                    '<form class="layui-form">'+
                    '<div class="layui-form-item">'+
                    '<input type="radio" name="skin" value="默认" title="默认" lay-filter="default" checked="">'+
                    '<input type="radio" name="skin" value="橙色" title="橙色" lay-filter="orange">'+
                    '<input type="radio" name="skin" value="蓝色" title="蓝色" lay-filter="blue">'+
                    '<input type="radio" name="skin" value="自定义" title="自定义" lay-filter="custom">'+
                    '<div class="skinCustom">'+
                    '<input type="text" class="layui-input topColor" name="topSkin" placeholder="顶部颜色" />'+
                    '<input type="text" class="layui-input leftColor" name="leftSkin" placeholder="左侧颜色" />'+
                    '<input type="text" class="layui-input menuColor" name="btnSkin" placeholder="顶部菜单按钮" />'+
                    '</div>'+
                    '</div>'+
                    '<div class="layui-form-item skinBtn">'+
                    '<a href="javascript:;" class="layui-btn layui-btn-sm layui-btn-normal" lay-submit="" lay-filter="changeSkin">确定更换</a>'+
                    '<a href="javascript:;" class="layui-btn layui-btn-sm layui-btn-primary" lay-submit="" lay-filter="noChangeSkin">朕再想想</a>'+
                    '</div>'+
                    '</form>'+
                    '</div>',
                success : function(index, layero){
                    var skin = window.sessionStorage.getItem("skin");
                    if(window.sessionStorage.getItem("skinValue")){
                        $(".skins_box input[value="+window.sessionStorage.getItem("skinValue")+"]").attr("checked","checked");
                    };
                    if($(".skins_box input[value=自定义]").attr("checked")){
                        $(".skinCustom").css("visibility","inherit");
                        $(".topColor").val(skin.split(',')[0]);
                        $(".leftColor").val(skin.split(',')[1]);
                        $(".menuColor").val(skin.split(',')[2]);
                    };
                    form.render();
                    $(".skins_box").removeClass("layui-hide");
                    $(".skins_box .layui-form-radio").on("click",function(){
                        var skinColor;
                        if($(this).find("div").text() == "橙色"){
                            skinColor = "orange";
                        }else if($(this).find("div").text() == "蓝色"){
                            skinColor = "blue";
                        }else if($(this).find("div").text() == "默认"){
                            skinColor = "";
                        }
                        if($(this).find("div").text() != "自定义"){
                            $(".topColor,.leftColor,.menuColor").val('');
                            $("body").removeAttr("class").addClass("main_body "+skinColor+"");
                            $(".skinCustom").removeAttr("style");
                            $(".layui-bg-black,.hideMenu,.layui-layout-admin .layui-header").removeAttr("style");
                        }else{
                            $(".skinCustom").css("visibility","inherit");
                        }
                    })
                    var skinStr,skinColor;
                    $(".topColor").blur(function(){
                        $(".layui-layout-admin .layui-header").css("background-color",$(this).val()+" !important");
                    })
                    $(".leftColor").blur(function(){
                        $(".layui-bg-black").css("background-color",$(this).val()+" !important");
                    })
                    $(".menuColor").blur(function(){
                        $(".hideMenu").css("background-color",$(this).val()+" !important");
                    })

                    form.on("submit(changeSkin)",function(data){
                        if(data.field.skin != "自定义"){
                            if(data.field.skin == "橙色"){
                                skinColor = "orange";
                            }else if(data.field.skin == "蓝色"){
                                skinColor = "blue";
                            }else if(data.field.skin == "默认"){
                                skinColor = "";
                            }
                            window.sessionStorage.setItem("skin",skinColor);
                        }else{
                            skinStr = $(".topColor").val()+','+$(".leftColor").val()+','+$(".menuColor").val();
                            window.sessionStorage.setItem("skin",skinStr);
                            $("body").removeAttr("class").addClass("main_body");
                        }
                        window.sessionStorage.setItem("skinValue",data.field.skin);
                        layer.closeAll("page");
                    });
                    form.on("submit(noChangeSkin)",function(){
                        $("body").removeAttr("class").addClass("main_body "+window.sessionStorage.getItem("skin")+"");
                        $(".layui-bg-black,.hideMenu,.layui-layout-admin .layui-header").removeAttr("style");
                        skins();
                        layer.closeAll("page");
                    });
                },
                cancel : function(){
                    $("body").removeAttr("class").addClass("main_body "+window.sessionStorage.getItem("skin")+"");
                    $(".layui-bg-black,.hideMenu,.layui-layout-admin .layui-header").removeAttr("style");
                    skins();
                }
            })
        })

    })
</script>
<script type="text/javascript">
    layui.use(['form', 'layer', 'jquery','table'], function () {
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery;

        //加载默认数据
        $.ajax({
            url: '${pageContext.request.contextPath}/apiSysParam/getApiSystemparam',
            type: "post",
            success: function (data) {
                fillData(data);
            }
        });

        //填充数据方法
        function fillData(data) {
            $(".id").val(data.id);//id
            $(".version").val(data.version);      //当前版本
            $(".author").val(data.author);        //开发作者
            $(".homePage").val(data.homePage);    //网站首页
            $(".serverEn").val(data.serverEn);        //服务器环境
            $(".dbVersion").val(data.dbVersion);    //数据库版本
            $(".maxUpload").val(data.maxUpload);  //最大上传限制
            $(".userLimit").val(data.userLimit);//当前用户权限
            $(".netName").val(data.netName);      //模版名称
            $(".description").val(data.description);//站点描述
            $(".powerby").val(data.powerby);      //版权信息
            $(".record").val(data.record);      //网站备案号
        };

        // var systemParameter;
        form.on("submit(systemParameter)", function (data) {
            $.ajax({
                url: '${pageContext.request.contextPath}/apiSysParam/updateApiSystemparam',
                data: data.field,
                method: 'post',
                success: function (res) {
                    if (res.status) {
                        layer.msg(res.message);
                    } else {
                        layer.msg(res.message);
                    }
                }
            });
        });

    })

</script>
</body>
</html>
