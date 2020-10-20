<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>文章列表--layui后台管理模板 2.0</title>
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
<form class="layui-form linksAdd">
    <input type="hidden" name="id" class="id"/>
    <div class="layui-form-item">
        <div class="layui-upload-list linkLogo">
            <img class="layui-upload-img linkLogoImg">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">网站名称</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input linkName" lay-verify="required" placeholder="请输入网站名称"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">网站地址</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input linkUrl" lay-verify="required|url" placeholder="请输入网站地址"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">站长邮箱</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input masterEmail" lay-verify="required|email" placeholder="请输入站长邮箱"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">展示位置</label>
        <div class="layui-input-block">
            <input type="checkbox" class="layui-input showAddress" lay-text="首页|子页" lay-skin="switch"
                   lay-filter="switchTest"/>
        </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn layui-block" lay-filter="addLink" lay-submit>提交</button>
    </div>
</form>
<script type="text/javascript" src="../../layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer', 'laydate', 'table', 'upload'], function () {
        var form = layui.form,
            layer = parent.layer === undefined ? layui.layer : top.layer,
            $ = layui.jquery,
            upload = layui.upload;

        var img_src;
        //上传logo
        upload.render({
            elem: '.linkLogo',
            url: '${pageContext.request.contextPath}/image/uploadImages',
            accept: 'file',//相当于type属性  文件类型
            acceptMime: 'image/*',//筛选条件  只显示图片类型
            field: 'image',//相当于name属性  文件域的字段名  默认为file
            multiple: true,
            done: function (res, index, upload) {
                console.log(res.data.src);
                img_src = res.data.src;
                var imgSrc = '${pageContext.request.contextPath}/static/';
                $('.linkLogoImg').attr('src', imgSrc + res.data.src);
                $('.linkLogo').css("background", "#fff");
            }
        });

        //格式化时间
        function filterTime(val) {
            if (val < 10) {
                return "0" + val;
            } else {
                return val;
            }
        }

        //添加时间
        var time = new Date();
        var submitTime = time.getFullYear() + '-' + filterTime(time.getMonth() + 1) + '-' + filterTime(time.getDate()) + ' ' + filterTime(time.getHours()) + ':' + filterTime(time.getMinutes()) + ':' + filterTime(time.getSeconds());

        var check;
        //监听指定开关
        form.on('switch(switchTest)', function (data) {
            check = this.checked ? 'checked' : '';
        });

        form.on("submit(addLink)", function (data) {
            alert(img_src);
            //弹出loading
            var index = top.layer.msg('数据提交中，请稍候', {icon: 16, time: false, shade: 0.8});
            //ajax返回信息描述
            var msg;
            // 实际使用时的提交信息
            $.ajax({
                url: "${param.url}",
                data: {
                    id: $(".id").val(),
                    logo: img_src,  //logo
                    websiteName: $(".linkName").val(),  //网站名称
                    websiteUrl: $(".linkUrl").val(),    //网址
                    masterEmail: $('.masterEmail').val(),    //站长邮箱
                    showAddress: check,    //展示位置
                    addTime: submitTime    //发布时间
                },
                method: 'post',
                success: function (res) {
                    if (res.status) {
                        msg = res.message;
                    } else {
                        msg = res.message;
                    }
                }
            });
            setTimeout(function () {
                top.layer.close(index);
                top.layer.msg(msg);
                layer.closeAll("iframe");
                //刷新父页面
                $(".layui-tab-item.layui-show", parent.document).find("iframe")[0].contentWindow.location.reload();
            }, 500);
            return false;
        })

    });
</script>
</body>
</html>