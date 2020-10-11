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
<script type="text/javascript" src="../../js/cache.js"></script>
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
