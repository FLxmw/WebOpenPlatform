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
<form class="layui-form">
    <blockquote class="layui-elem-quote quoteBox">
        <form class="layui-form">
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <input type="text" class="layui-input searchVal" placeholder="请输入搜索的内容"/>
                </div>
                <a class="layui-btn search_btn" data-type="reload">搜索</a>
            </div>
            <div class="layui-inline">
                <a class="layui-btn layui-btn-normal addNews_btn">添加文章</a>
            </div>
            <div class="layui-inline">
                <a class="layui-btn layui-btn-danger layui-btn-normal delAll_btn">批量删除</a>
            </div>
        </form>
    </blockquote>
    <table id="newsList" lay-filter="newsList"></table>
    <!--审核状态-->
    <script type="text/html" id="newsStatus">
        {{#  if(d.newsStatus == "1"){ }}
        <span class="layui-red">等待审核</span>
        {{#  } else if(d.newsStatus == "0"){ }}
        <span class="layui-blue">已存草稿</span>
        {{#  } else { }}
        审核通过
        {{#  }}}
    </script>

    <!--操作-->
    <script type="text/html" id="newsListBar">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
        <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="look">预览</a>
    </script>
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

        //新闻列表
        var tableIns = table.render({
            elem: '#newsList',
            url: '${pageContext.request.contextPath}/news/showTable',
            cellMinWidth: 95,
            page: true,
            height: "full-125",
            limit: 20,
            limits: [10, 15, 20, 25],
            id: "newsListTable",
            cols: [[
                {type: "checkbox", fixed: "left", width: 30},
                {field: 'id', title: 'ID', width: 60, align: "center"},
                {field: 'newsName', title: '文章标题', width: 250, align: "center"},
                {field: 'newsAuthor', title: '发布者', align: 'center'},
                {field: 'newsStatus', title: '发布状态', align: 'center', templet: "#newsStatus"},
                {
                    field: 'newsImg', title: '文章图片', align: 'center', templet: function (d) {
                        return '<img src="' + d.newsImg + '"/>'
                    }
                },
                {field: 'newsLook', title: '浏览权限', align: 'center'},
                {
                    field: 'newsTop', title: '是否置顶', align: 'center', templet: function (d) {
                        return '<input type="checkbox" name="newsTop" lay-filter="newsTop" lay-skin="switch" lay-text="是|否" ' + d.newsTop + '>'
                    }
                },
                {
                    field: 'newsTime', title: '发布时间', align: 'center', minWidth: 110, templet: function (d) {
                        return d.newsTime.substring(0, 10);
                    }
                },
                {title: '操作', width: 170, templet: '#newsListBar', fixed: "right", align: "center"}
            ]]
        });

        //是否置顶
        form.on('switch(newsTop)', function (data) {
            var index = layer.msg('修改中，请稍候', {icon: 16, time: false, shade: 0.8});
            setTimeout(function () {
                layer.close(index);
                if (data.elem.checked) {
                    layer.msg("置顶成功！");
                } else {
                    layer.msg("取消置顶成功！");
                }
            }, 500);
        });

        //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
        $(".search_btn").on("click", function () {
            if ($(".searchVal").val() != '') {
                table.reload("newsListTable", {
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

        //添加文章
        function addNews(data) {
            console.log("编辑文章的数据：" + data);
            var url = data == null ? '${pageContext.request.contextPath}/news/addNews' : '${pageContext.request.contextPath}/news/updateNews';
            var index = layui.layer.open({
                title: data == null ? "添加文章" : "编辑文章",
                type: 2,
                content: "newsAdd.jsp?url=" + url,
                success: function (layero, index) {
                    var body = layui.layer.getChildFrame('body', index);
                    if (data) {
                        body.find(".id").val(data.id);
                        body.find(".newsName").val(data.newsName);
                        body.find(".newsAuthor").val(data.newsAuthor);
                        body.find(".digest").val(data.digest);
                        body.find(".newsImg").attr("src", data.newsImg);
                        body.find("#news_content").val(data.content);
                        body.find(".newsStatus select").val(data.newsStatus);
                        body.find(".newsLook input[name='newsLook'][title='" + data.newsLook + "']").prop("checked", "checked");
                        body.find(".newsTop input[name='newsTop']").prop("checked", data.newsTop);
                        form.render();
                    }
                    setTimeout(function () {
                        layui.layer.tips('点击此处返回文章列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    }, 500)
                }
            });
            layui.layer.full(index);
            //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
            $(window).on("resize", function () {
                layui.layer.full(index);
            })
        }

        //点击添加按钮执行
        $(".addNews_btn").click(function () {
            addNews();
        });

        //批量删除
        $(".delAll_btn").click(function () {
            var checkStatus = table.checkStatus('newsListTable'),
                data = checkStatus.data;
            console.log(data);
            if (data.length > 0) {
                layer.confirm('确定删除选中的文章？', {icon: 3, title: '提示信息'}, function (index) {
                    $(data).each(function (index) {
                        $.ajax({
                            url: '${pageContext.request.contextPath}/news/deleteNews?ids=' + data[index].id,
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
        table.on('tool(newsList)', function (obj) {
            var layEvent = obj.event,
                data = obj.data;

            if (layEvent === 'edit') { //编辑
                addNews(data);
            } else if (layEvent === 'del') { //删除
                layer.confirm('确定删除此文章？', {icon: 3, title: '提示信息'}, function (index) {
                    $.ajax({
                        url: '${pageContext.request.contextPath}/news/deleteNews?ids=' + data.id,
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
            } else if (layEvent === 'look') { //预览
                $.ajax({
                    url: "${pageContext.request.contextPath}/news/showContent?id=" + data.id,
                    success: function (res) {
                        var cons = res.content;
                        console.log(cons.substring(cons.lastIndexOf('h')));
                        var url = cons.substring(cons.lastIndexOf('h'));
                        alert(url);
                        layer.open({
                            type: 2,
                            title:"文章内容详情",
                            content: url,
                            area:['1200px','600px'],//宽高
                            offset: 'auto',	 //offset默认情况下不用设置。但如果你不想垂直水平居中
                            icon:1    //只对type=0的效
                            ,shade:[0.8, '#F8F8FF']
                            ,shadeClose:true  //点击遮罩是否关闭弹层
                            ,anim: 4 //设置动画
                            ,maxmin :true //是否显示最大化和最小化的按钮 type=1 type=2有效
                            ,success:function(layero, index){
                                //alert(index);
                            }
                        });
                    }
                });
            }
        });

    })
</script>
</body>
</html>