<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>友情链接--layui后台管理模板 2.0</title>
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
<blockquote class="layui-elem-quote quoteBox">
    <form class="layui-form">
        <div class="layui-inline">
            <div class="layui-input-inline">
                <input type="text" class="layui-input searchVal" placeholder="请输入搜索的内容"/>
            </div>
            <a class="layui-btn search_btn" data-type="reload">搜索</a>
        </div>
        <div class="layui-inline">
            <a class="layui-btn layui-btn-normal addLink_btn">添加友链</a>
        </div>
        <div class="layui-inline">
            <a class="layui-btn layui-btn-danger layui-btn-normal delAll_btn">批量删除</a>
        </div>
    </form>
</blockquote>
<table id="linkList" lay-filter="linkList"></table>

<script type="text/javascript" src="../../layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer', 'laydate', 'table', 'upload'], function () {
        var form = layui.form,
            layer = parent.layer === undefined ? layui.layer : top.layer,
            $ = layui.jquery,
            table = layui.table;

        //友链列表
        var tableIns = table.render({
            elem: '#linkList',
            url: '${pageContext.request.contextPath}/link/showTable',
            page: true,
            cellMinWidth: 95,
            height: "full-104",
            limit: 20,
            limits: [10, 15, 20, 25],
            id: "linkListTab",
            cols: [[
                {type: "checkbox", fixed: "left", width: 50},
                {field: 'id', title: 'ID', align: 'center', width: 50},
                {
                    field: 'logo', title: 'LOGO', width: 150, align: "center", templet: function (d) {
                        return '<a href="' + d.websiteUrl + '" target="_blank"><img src="${pageContext.request.contextPath}/static/' + d.logo + '" height="26" /></a>';
                    }
                },
                {field: 'websiteName', title: '网站名称', align: 'center', width: 150},
                {
                    field: 'websiteUrl', title: '网站地址', align: 'center', width: 150, templet: function (d) {
                        return '<a class="layui-blue" href="' + d.websiteUrl + '" target="_blank">' + d.websiteUrl + '</a>';
                    }
                },
                {field: 'masterEmail', title: '站长邮箱', minWidth: 200, align: 'center'},
                {
                    field: 'showAddress', title: '位置', align: 'center', width: 80, templet: function (d) {
                        return d.showAddress == "checked" ? "首页" : "子页";
                    }
                },
                {field: 'addTime', title: '添加时间', align: 'center', minWidth: 100},
                {
                    title: '操作', align: 'center', width: 130, fixed: "right", align: "center", templet: function () {
                        return '<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a><a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>';
                    }
                }
            ]]
        });

        //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
        $(".search_btn").on("click", function () {
            if ($(".searchVal").val() != '') {
                table.reload("linkListTab", {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    },
                    where: {
                        key: $(".searchVal").val()  //搜索的关键字
                    }
                })
            } else {
                layer.msg("请输入搜索的内容");
            }
        });

        //添加友链
        function addLink(data) {
            var url = data == null ? '${pageContext.request.contextPath}/link/addLink' : '${pageContext.request.contextPath}/link/updateLink';
            layer.open({
                title: data == null ? "添加友链" : "编辑友链",
                type: 2,
                area: ["300px", "385px"],
                content: "${pageContext.request.contextPath}/static/page/systemSetting/linksAdd.jsp?url=" + url,
                success: function (layero, index) {
                    var body = $($(".layui-layer-iframe", parent.document).find("iframe")[0].contentWindow.document.body);
                    if (data) {
                        body.find(".id").val(data.id);
                        body.find(".linkLogo").css("background", "#fff");
                        body.find(".linkLogoImg").attr("src", data.logo);
                        body.find(".linkName").val(data.websiteName);
                        body.find(".linkUrl").val(data.websiteUrl);
                        body.find(".masterEmail").val(data.masterEmail);
                        body.find(".showAddress").prop("checked", data.showAddress);
                        form.render();
                    }
                    setTimeout(function () {
                        layui.layer.tips('点击此处返回友链列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    }, 500)
                }
            })
        }

        $(".addLink_btn").click(function () {
            addLink();
        });

        //批量删除
        $(".delAll_btn").click(function () {
            var checkStatus = table.checkStatus('linkListTab'),
                data = checkStatus.data;
            if (data.length > 0) {
                layer.confirm('确定删除选中的友链？', {icon: 3, title: '提示信息'}, function (index) {
                    $(data).each(function (index) {
                        $.ajax({
                            url: '${pageContext.request.contextPath}/link/deleteLink?ids=' + data[index].id,
                            success: function (res) {
                                if (res.status) {
                                    tableIns.reload();
                                    layer.close(index);
                                    layer.msg(res.message);
                                } else {
                                    tableIns.reload();
                                    layer.close(index);
                                    layer.msg(res.message);
                                }
                            }
                        });
                    })
                })
            } else {
                layer.msg("请选择需要删除的文章");
            }
        });

        //列表操作
        table.on('tool(linkList)', function (obj) {
            var layEvent = obj.event,
                data = obj.data;

            if (layEvent === 'edit') { //编辑
                addLink(data);
            } else if (layEvent === 'del') { //删除
                layer.confirm('确定删除此友链？', {icon: 3, title: '提示信息'}, function (index) {
                    $.ajax({
                        url: '${pageContext.request.contextPath}/link/deleteLink?ids=' + data.id,
                        success: function (res) {
                            if (res.status) {
                                tableIns.reload();
                                layer.close(index);
                                layer.msg(res.message);
                            } else {
                                tableIns.reload();
                                layer.close(index);
                                layer.msg(res.message);
                            }
                        }
                    });
                });
            }
        });
    });
</script>
</body>
</html>