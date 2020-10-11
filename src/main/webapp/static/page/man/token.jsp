<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>数组表格</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <style type="text/css">
        body .demo-class .layui-layer-title {
            background: #c00;
            color: #fff;
            border: none;
        }

        body .demo-class .layui-layer-btn {
            background: #F8F8FF;
            padding: 5px;
        }


        body .demo-class .layui-layer-btn .layui-layer-btn1 {
            background: #D3D3D3;
        }

        body .demo-class .layui-layer-content {
            font-family: "楷体";
            font-size: 22px;
            background: #FFFAF0;
        }
        body .open-class .layui-layer-btn .layui-layer-btn1 {
            background: #D3D3D3;
        }
    </style>
</head>
<body>
<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>
<form action="#" class="layui-form" style="margin-left: 20px">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label>Token:</label>
            <div class="layui-inline">
                <input type="text" name="accessToken" autocomplete="off" placeholder="请输入Token通行密钥"
                       class="layui-input">
            </div>
            <button class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-search" lay-submit
                    lay-filter="doSearch">搜索
            </button>
        </div>
    </div>
</form>
<!-- 搜索条件结束 -->


<!-- 数据表格开始 -->
<table class="layui-hide" id="tokenTable" lay-filter="tokenTable"></table>
<div style="display: none;" id="tokenToolBar">
    <button type="button" class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon">&#xe654;</i>增加</button>
    <button type="button" class="layui-btn layui-btn-sm layui-btn-danger " lay-event="batchDelete"><i
            class="layui-icon">&#xe640;</i>批量删除
    </button>
</div>
<div id="tokenBar" style="display: none;">
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="edit"><i class="layui-icon">&#xe642;</i>编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</a>
</div>
<!-- 数据表格结束 -->

<!-- 添加和修改的弹出层开始 -->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
    <form class="layui-form " action="" method="post" lay-filter="dataFrm" id="dataFrm">
        <input type="hidden" hidden="hidden" name="id">
        <div class="layui-form-item">
            <label class="layui-form-label">用户ID:</label>
            <div class="layui-input-block">
                <input type="text" name="aid" required lay-verify="required" placeholder="请输入用户ID"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Token</label>
            <div class="layui-input-block">
                <input type="text" name="accessToken" required lay-verify="required" placeholder="请输入Token通行密钥"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">开始时间：</label>
            <div class="layui-input-block">
                <input type="text" name="startTime" id="startTime" required lay-verify="required" placeholder="请选择开始时间"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">结束时间：</label>
            <div class="layui-input-block">
                <input type="text" name="expireTime" id="expireTime" required lay-verify="required" placeholder="请选择结束时间"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </form>

</div>
<!-- 添加和修改的弹出层结束 -->

<script src="../../layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['jquery', 'layer', 'form', 'table','laydate'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var laydate=layui.laydate;

        laydate.render({
            elem:"#expireTime",
            type:'datetime'
        });
        laydate.render({
            elem:"#startTime",
            type:'datetime'
        });

        var tableIns;
        //渲染数据表格
        tableIns = table.render({
            elem: '#tokenTable'   //渲染的目标对象
            , url: '${pageContext.request.contextPath}/token/showTable' //数据接口
            , title: 'token数据表'//数据导出来的标题
            , toolbar: "#tokenToolBar"   //表格的工具条
            // , height: 'full-130'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , skin: 'row' //行边框风格  row列边框  nob无边框
            , even: true //开启隔行背景
            , totalRow: true
            , text: {
                none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
            }
            , page: true  //是否启用分页
            , cols: [[   //列表数据
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', sort: true, align: 'center',width:80}
                , {field: 'aid', title: '用户ID', align: 'center',width:80}
                , {field: 'accessToken', title: 'Token密钥', align: 'center'}
                , {field: 'startTime', title: '开始时间', align: 'center',width:200}
                , {field: 'expireTime', title: '过期时间', align: 'center',width:200}
                , {fixed: 'right', title: '操作', toolbar: '#tokenBar', width:150, align: 'center'}
            ]]
        })


        //监听头部工具栏事件
        table.on("toolbar(tokenTable)", function (obj) {
            switch (obj.event) {
                case 'add':
                    openEditToken(null);
                    break;
                case 'batchDelete':
                    layer.confirm('你真的要删除选中的吗?', {
                        icon: 2,
                        title: '温馨提示',
                        skin: 'demo-class',
                        area: ['330px', '180px']
                    }, function (index) {
                        layer.close(index);
                        var checkStatus = table.checkStatus('tokenTable'); //idTest 即为基础参数 id 对应的值
                        var datas = checkStatus.data;
                        console.log(datas);
                        $(datas).each(function (index) {
                            console.log(datas[index].id);
                            $.ajax({
                                url: '${pageContext.request.contextPath}/token/deleteToken?ids=' + datas[index].id,
                                success: function (data) {
                                    if (data.status) {
                                        layer.msg(data.message);
                                        tableIns.reload();//表格重载
                                    } else {
                                        layer.msg(data.message);
                                    }
                                }
                            })
                        });
                    });
                    break;
            }
        });

        //监听行工具事件
        table.on('tool(tokenTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            console.log(data);
            // console.log(data.id)
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'del') { //删除
                layer.msg("删除");
                layer.confirm('真的要删除这一条数据吗？', {
                    icon: 2,
                    title: '温馨提示',
                    skin: 'demo-class',
                    area: ['350px', '180px']
                }, function (index) {
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax({
                        url: '${pageContext.request.contextPath}/token/deleteToken?ids=' + data.id,
                        success: function (data) {
                            if (data.status) {
                                layer.msg(data.message)
                                obj.del()//删除对应行（tr）的DOM结构，并更新缓存
                            } else {
                                layer.msg(data.message)
                            }
                        }
                    })
                });
            } else if (layEvent === 'edit') { //编辑
                openEditToken(data);
            }
        });

        var mainIndex;

        //打开添加/编辑页面
        function openEditToken(data) {
            mainIndex = layer.open({
                type: 1,
                title: data == null ? '添加Token' : '编辑Token',
                content: $("#saveOrUpdateDiv"),
                area: ['800px', '500px'],
                skin:'open-class',
                btn: [
                    '<span class="layui-icon layui-icon-release" >提交</span>',
                    '<span class="layui-icon layui-icon-close" >取消</span >'
                ],
                btnAlign: 'c'
                , closeBtn: 2  //设置关闭按钮的样式  1  默认
                , shade: [0.8, '#393D49']
                , shadeClose: false  //点击遮罩是否关闭弹层
                , anim: 4 //设置动画
                , maxmin: true //是否显示最大化和最小化的按钮 type=1 type=2有效
                //点击按钮的回调
                , yes: function (index, layero) {
                    console.log($("#dataFrm").serialize());
                    console.log(layero);
                    layer.load(1);
                    $.ajax({
                        url: '${pageContext.request.contextPath}/token/' + (data == null ? "addToken" : "updateToken"),
                        data: $("#dataFrm").serialize(),
                        method: 'post',
                        success: function (res) {
                            if (res.status) {
                                layer.msg(res.message);
                                //关闭弹出层
                                layer.close(mainIndex);
                                //刷新数据 表格
                                tableIns.reload()
                            } else {
                                layer.msg(res.message)
                            }
                            layer.closeAll('loading');//关闭加载层
                        }
                    })

                }
                ,btn1:function () {
                    tableIns.reload()
                }
                , success: function (index) {
                    form.render();
                    if (data != null) {
                        form.val("dataFrm", data)
                    }else {
                        $("#dataFrm")[0].reset()
                    }
                }
            });
        }

        //提交搜索条件表单
        form.on("submit(doSearch)", function (obj) {
        });
    });
</script>
</body>
</html>
