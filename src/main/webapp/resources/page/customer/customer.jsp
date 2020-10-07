<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>数组表格</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
</head>
<body>
<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>
<form action="#" class="layui-form" method="post">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label>用户名:</label>
            <div class="layui-inline">
                <input type="text" name="username" autocomplete="off" placeholder="请输入用户名"
                       class="layui-input">
            </div>
            状态:
            <div class="layui-inline">
                <select name="state">
                    <option value="">请选择</option>
                    <option value="0">无效</option>
                    <option value="1">有效</option>
                </select>
            </div>
            <button class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-search" lay-submit
                    lay-filter="doSearch">搜索
            </button>
        </div>
    </div>
</form>
<!-- 搜索条件结束 -->


<!-- 数据表格开始 -->
<table class="layui-hide" id="userTable" lay-filter="userTable"></table>
<div style="display: none;" id="userToolBar">
    <button type="button" class="layui-btn layui-btn-sm" lay-event="add">增加</button>
    <button type="button" class="layui-btn layui-btn-sm" lay-event="batchDelete">批量删除</button>
</div>
<div id="userBar" style="display: none;">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</div>
<!-- 数据表格结束 -->

<!-- 添加和修改的弹出层开始 -->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
    <form class="layui-form " action="" method="post" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-inline">
            <%--<label class="layui-form-label">编号:</label>--%>
            <div class="layui-input-inline">
                <input type="hidden" name="id" lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户名:</label>
                <div class="layui-input-inline">
                    <input type="text" name="username" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">密码:</label>
                <div class="layui-input-inline">
                    <input type="text" name="password" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">年龄:</label>
                <div class="layui-input-inline">
                    <input type="text" name="age" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">性别:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="sex" value="1" checked="checked" title="男">
                    <input type="radio" name="sex" value="0" title="女">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">地址:</label>
                <div class="layui-input-inline">
                    <input type="text" name="address" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center; margin-top: 50px;">
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-release"
                        lay-filter="doSubmit" lay-submit="">提交
                </button>
                <button type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh">重置
                </button>
            </div>
        </div>
    </form>

</div>
<!-- 添加和修改的弹出层结束 -->

<script src="../../layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['jquery', 'layer', 'form', 'table', 'laydate'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var laydate = layui.laydate;

        //绑定时间选择器
        laydate.render({
            elem: '#startTime'
        });
        laydate.render({
            elem: '#endTime'
        });
        laydate.render({
            elem: '#birthday'
            , type: 'date'
        })

        var tableIns;
        //渲染数据表格
        tableIns = table.render({
            elem: '#userTable'   //渲染的目标对象
            , url: '${pageContext.request.contextPath}/customer/showCustomers' //数据接口
            , title: '客户数据表'//数据导出来的标题
            , toolbar: "#userToolBar"   //表格的工具条
            , height: 'full-20'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , skin: 'row' //行边框风格  row列边框  nob无边框
            , even: true //开启隔行背景
            , totalRow: true
            , text: {
                none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
            }
            , done: function (res, curr, count) {

            }
            , page: true  //是否启用分页
            , cols: [[   //列表数据
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', sort: true, align: 'center', totalRowText: "合计"}
                , {field: 'username', title: '用户名', align: 'center'}
                , {field: 'password', title: '密码', align: 'center'}
                , {field: 'nickname', title: '公司名', align: 'center'}
                , {field: 'address', title: '公司地址', align: 'center'}
                , {field: 'money', title: '账户余额', align: 'center', totalRow: true}
                , {
                    field: 'state', title: '用户状态', align: 'center', templet: function (data) {
                        return data.state == 0 ? '<span  class="layui-badge layui-bg-green" style="margin: 5px;">有效</span>' : '<span  class="layui-badge layui-bg-red" style="margin: 5px;">无效</span>';
                    }
                }
                , {fixed: 'right', title: '操作', toolbar: '#userBar', width: 220, align: 'center'}
            ]]
        })


        //监听头部工具栏事件
        table.on("toolbar(userTable)", function (obj) {
            switch (obj.event) {
                case 'add':
                    openAddUser();
                    break;
                case 'batchDelete':
                    layer.msg('批量删除');
                    var checkStatus = table.checkStatus('userTable'); //idTest 即为基础参数 id 对应的值
                    var datas = checkStatus.data;
                    console.log(datas)
                    $(datas).each(function (index) {
                        console.log(datas[index].id)
                        $.ajax({
                            url: '${pageContext.request.contextPath}/user/deleteUser?id=' + datas[index].id,
                            success: function () {
                                tableIns.reload();//表格重载
                            }
                        })
                    });
                    // console.log(checkStatus.data) //获取选中行的数据
                    break;
            }
            ;
        })

        //监听行工具事件
        table.on('tool(userTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            // console.log(data)
            // console.log(data.id)
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'del') { //删除
                layer.msg("删除");
                layer.confirm('真的删除行么', function (index) {
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax({
                        url: '${pageContext.request.contextPath}/user/deleteUser?id=' + data.id,
                        success: function (data) {
                            obj.del()//删除对应行（tr）的DOM结构，并更新缓存
                        }
                    })
                });
            } else if (layEvent === 'edit') { //编辑
                openUpdateUser(data);
            }
        });

        var url;
        var mainIndex;

        //打开添加页面
        function openAddUser() {
            mainIndex = layer.open({
                type: 1,
                title: '添加用户',
                content: $("#saveOrUpdateDiv"),
                area: ['800px', '400px'],
                success: function (index) {
                    //清空表单数据
                    // JS转Jquery$(obj)
                    // Jquery转JS []
                    $("#dataFrm")[0].reset();
                    url = "${pageContext.request.contextPath}/user/addUser";
                }
            });
        }

        //打开修改页面
        function openUpdateUser(data) {
            mainIndex = layer.open({
                type: 1,
                title: '修改用户',
                content: $("#saveOrUpdateDiv"),
                area: ['800px', '400px'],
                success: function (index) {
                    //console.log(data)
                    form.val("dataFrm", data) //回显数据，直接给表单赋值
                    url = "${pageContext.request.contextPath}/user/updateUser";
                }
            });
        }

        //保存 提交表单数据
        form.on("submit(doSubmit)", function (obj) {
            console.log(obj.field)
            var json = JSON.stringify(obj.field)
            console.log(JSON.stringify(obj.field))
            console.log(url)
            //序列化表单数据成字符串
            var params = $("#dataFrm").serialize();//直接转换成数据
            //id=02&username=admin&email=2285538755%40qq.com&city=%E6%B7%B1%E5%9C%B3&sex=1
            $.ajax({
                url: url,
                contentType: "application/json;charset=UTF-8",
                data: json,
                type: "POST",
                dataType: "json",
                success: function (data) {
                    console.log(data)
                    //关闭弹出层
                    layer.close(mainIndex)
                    //刷新数据 表格
                    tableIns.reload();
                }
            })
        });

        //提交搜索条件表单
        form.on("submit(doSearch)", function (obj) {
            console.log(obj.field)
            tableIns.reload({
                url: '${pageContext.request.contextPath}/customer/search',
                page: {
                    curr: 1 //重新从第 1 页开始
                }
            })
        });
    });
</script>
</body>
</html>
