<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户中心--layui后台管理模板 2.0</title>
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
                <a class="layui-btn layui-btn-normal addNews_btn">添加用户</a>
            </div>
            <div class="layui-inline">
                <a class="layui-btn layui-btn-danger layui-btn-normal delAll_btn">批量删除</a>
            </div>
        </form>
    </blockquote>
    <table id="userList" lay-filter="userList"></table>

    <!--操作-->
    <script type="text/html" id="userListBar">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="usable">已启用</a>
        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
    </script>
</form>
<script type="text/javascript" src="../../layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer', 'table', 'laytpl'], function () {
        var form = layui.form,
            layer = parent.layer === undefined ? layui.layer : top.layer,
            $ = layui.jquery,
            laytpl = layui.laytpl,
            table = layui.table;
        console.log(window.localStorage.getItem("access_token"));
        //用户列表
        var tableIns = table.render({
            elem: '#userList',
            url: '${pageContext.request.contextPath}/user/showTable',
            cellMinWidth: 95,
            page: true,
            height: "full-125",
            limits: [5, 10, 15, 20, 25],
            id: "userListTable",
            cols: [[
                {type: "checkbox", fixed: "left", width: 50},
                {field: 'id', title: 'ID', width: 60, align: "center"},
                {field: 'username', title: '用户名', minWidth: 70, align: "center"},
                {field: 'password', title: '密码', minWidth: 100, align: "center"},
                {
                    field: 'email', title: '邮箱', minWidth: 160, align: 'center', templet: function (d) {
                        return '<a class="layui-blue" href="mailto:' + d.email + '">' + d.email + '</a>';
                    }
                },
                {field: 'sex', title: '性别', align: 'center', width: 70},
                {
                    field: 'state', title: '用户状态', align: 'center', templet: function (d) {
                        return d.state == "1" ? "正常使用" : "限制使用";
                    }
                },
                {
                    field: 'grade', title: '用户等级', align: 'center', templet: function (d) {
                        if (d.grade == "0") {
                            return "未注册会员";
                        } else if (d.grade == "1") {
                            return "普通会员";
                        } else if (d.grade == "2") {
                            return "中级会员";
                        } else if (d.grade == "3") {
                            return "高级会员";
                        } else if (d.grade == "4") {
                            return "钻石会员";
                        } else if (d.grade == "5") {
                            return "超级会员";
                        }
                    }
                },
                {field: 'endtime', title: '最后登录时间', align: 'center', minWidth: 170},
                {field: 'userDesc', title: '用户简介', align: 'center'},
                {title: '操作', minWidth: 175, templet: '#userListBar', fixed: "right", align: "center"}
            ]]
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

        //添加用户
        function addUser(obj) {
            var url = obj == null ? '${pageContext.request.contextPath}/user/addUser' : '${pageContext.request.contextPath}/user/updateUser';
            var index = layui.layer.open({
                title: obj == null ? "添加用户" : "编辑用户",
                type: 2,
                content: "userAdd.jsp?url=" + url,
                success: function (layero, index) {
                    var body = layui.layer.getChildFrame('body', index);
                    if (obj) {
                        body.find(".id").val(obj.id);  //用户id
                        body.find(".username").val(obj.username);  //登录名
                        body.find(".password").val(obj.password);  //登陆密码
                        body.find(".email").val(obj.email);  //邮箱
                        body.find(".sex input[value=" + obj.sex + "]").prop("checked", "checked");  //性别
                        body.find(".grade").val(obj.grade);  //会员等级
                        body.find(".state").val(obj.state);    //用户状态
                        body.find(".userDesc").text(obj.userDesc);    //用户简介
                        form.render();
                    }
                    setTimeout(function () {
                        layui.layer.tips('点击此处返回用户列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    }, 500)
                }
            });
            layui.layer.full(index);
            window.sessionStorage.setItem("index", index);
            //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
            $(window).on("resize", function () {
                layui.layer.full(window.sessionStorage.getItem("index"));
            })
        }

        $(".addNews_btn").click(function () {
            addUser(null);
        });

        //批量删除
        $(".delAll_btn").click(function () {
            var checkStatus = table.checkStatus('userListTable'),
                data = checkStatus.data;
            if (data.length > 0) {
                layer.confirm('确定删除选中的用户？', {icon: 3, title: '提示信息'}, function (con) {
                    $(data).each(function (index) {
                        $.ajax({
                            url: "${pageContext.request.contextPath}/user/deleteUser?ids=" + data[index].id,
                            success: function (res) {
                                if (res.status) {
                                    layer.msg(res.message);
                                    tableIns.reload({
                                        page:{
                                            curr:1
                                        }
                                    });
                                    layer.close(con);
                                } else {
                                    layer.msg(res.message);
                                    tableIns.reload({
                                        page:{
                                            curr:1
                                        }
                                    });
                                    layer.close(con);
                                }
                            }
                        });
                    })
                })

            } else {
                layer.msg("请选择需要删除的用户");
            }
        });

        //列表操作
        table.on('tool(userList)', function (obj) {
            var layEvent = obj.event,
                data = obj.data;

            if (layEvent === 'edit') { //编辑
                addUser(data);
            } else if (layEvent === 'usable') { //启用禁用
                var _this = $(this),
                    usableText = "是否确定禁用此用户？",
                    btnText = "已禁用";
                if (_this.text() == "已禁用") {
                    usableText = "是否确定启用此用户？",
                        btnText = "已启用";
                }
                layer.confirm(usableText, {
                    icon: 3,
                    title: '系统提示',
                    cancel: function (index) {
                        layer.close(index);
                    }
                }, function (index) {
                    _this.text(btnText);
                    layer.close(index);
                }, function (index) {
                    layer.close(index);
                });
            } else if (layEvent === 'del') { //删除
                layer.confirm('确定删除此用户？', {icon: 3, title: '提示信息'}, function (index) {
                    $.get("${pageContext.request.contextPath}/user/deleteUser", {
                        ids: data.id  //将需要删除的newsId作为参数传入
                    }, function (res) {
                        if (res.status) {
                            layer.msg(res.message);
                            tableIns.reload({
                                page:{
                                    curr:1
                                }
                            });
                            layer.close(index);
                        } else {
                            layer.msg(res.message);
                            tableIns.reload({
                                page:{
                                    curr:1
                                }
                            });
                            layer.close(index);
                        }
                    })
                });
            }
        });

    })

</script>
</body>
</html>