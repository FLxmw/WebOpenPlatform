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
            <label>客户ID:</label>
            <div class="layui-inline">
                <input type="text" name="cusId" autocomplete="off" placeholder="请输入客户ID"
                       class="layui-input">
            </div>
            状态:
            <div class="layui-inline">
                <select name="state">
                    <option value="">请选择</option>
                    <option value="0">未支付</option>
                    <option value="1">已支付</option>
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
<table class="layui-hide" id="rechargeTable" lay-filter="rechargeTable"></table>
<div style="display: none;" id="rechargeToolBar">
    <button type="button" class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon">&#xe654;</i>增加</button>
    <button type="button" class="layui-btn layui-btn-sm layui-btn-danger " lay-event="batchDelete"><i
            class="layui-icon">&#xe640;</i>批量删除
    </button>
</div>
<div id="rechargeBar" style="display: none;">
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="edit"><i class="layui-icon">&#xe642;</i>编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</a>
</div>
<!-- 数据表格结束 -->

<!-- 添加和修改的弹出层开始 -->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
    <form class="layui-form " action="" method="post" lay-filter="dataFrm" id="dataFrm">
        <input type="hidden" hidden="hidden" name="id" id="id">
        <div class="layui-form-item">
            <label class="layui-form-label">客户ID:</label>
            <div class="layui-input-block">
                <input type="text" name="cusId" id="cusId" required lay-verify="required" placeholder="请输入客户ID"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">订单号</label>
            <div class="layui-input-block">
                <input type="text" name="orderId" id="orderId" required lay-verify="required" placeholder="请输入订单号"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item  releaseDate">
            <label class="layui-form-label">创建时间</label>
            <div class="layui-input-block">
                <input type="text" name="createTime" id="createTime" class="layui-input createTime" placeholder="请选择日期和时间"
                       readonly/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">更新时间：</label>
            <div class="layui-input-block">
                <input type="text" name="updateTime" id="updateTime" class="layui-input updateTime" placeholder="请选择日期和时间"
                       readonly/>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">账户金额(元)：</label>
            <div class="layui-input-block">
                <input type="number" name="money" id="money" required lay-verify="required" placeholder="请输入账号金额"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">支付状态：</label>
            <div class="layui-input-block" id="state">
                <input type="radio" name="state" title="已支付" value="1" />
                <input type="radio" name="state" title="未支付" value="0"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">支付类型：</label>
            <div class="layui-input-block" id="paymentType">
                <input type="radio" name="paymentType"  value="1" >支付宝
                <input type="radio" name="paymentType"  value="2">微信
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

        var tableIns;
        //渲染数据表格
        tableIns = table.render({
            elem: '#rechargeTable'   //渲染的目标对象
            , url: '${pageContext.request.contextPath}/recharge/showTable' //数据接口
            , title: '应用数据表'//数据导出来的标题
            , toolbar: "#rechargeToolBar"   //表格的工具条
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
                , {field: 'id', title: 'ID', sort: true, align: 'center', width: 60, totalRowText: "合计"}
                , {field: 'cusId', title: '客户ID', align: 'center', width: 80}
                , {field: 'orderId', title: '订单编号', align: 'center', width: 150}
                , {field: 'createTime', title: '创建时间', align: 'center', width: 180}
                , {field: 'updateTime', title: '更新时间', align: 'center', width: 180}
                , {
                    field: 'paymentType', title: '支付类型', align: 'center', templet: function (data) {
                        return data.paymentType == 1 ? '<span  class="layui-badge layui-bg-blue" style="margin: 5px;">支付宝</span>' : '<span  class="layui-badge layui-bg-green" style="margin: 5px;">微信</span>';
                    }
                }
                , {field: 'money', title: '充值金额(元)', align: 'center', totalRow: true, width: 120}
                , {
                    field: 'state', title: '充值状态', align: 'center', templet: function (data) {
                        return data.state == 1 ? '<span  class="layui-badge layui-bg-green" style="margin: 5px;">已支付</span>' : '<span  class="layui-badge layui-bg-red" style="margin: 5px;">未支付</span>';
                    }
                }
                , {fixed: 'right', title: '操作', toolbar: '#rechargeBar', width: 160, align: 'center'}
            ]]
        })

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
        laydate.render({
            elem: '.createTime',
            type: 'datetime',
            format: 'yyyy-MM-dd HH:mm:ss',
            trigger: "click",
            done: function (value, date, endDate) {
                submitTime = value;
                console.log(submitTime);
            }
        });
        laydate.render({
            elem: '.updateTime',
            type: 'datetime',
            format: 'yyyy-MM-dd HH:mm:ss',
            trigger: "click",
            done: function (value, date, endDate) {
                submitTime = value;
                console.log(submitTime);
            }
        });
        //监听头部工具栏事件
        table.on("toolbar(rechargeTable)", function (obj) {
            switch (obj.event) {
                case 'add':
                    openEditRecharge(null);
                    break;
                case 'batchDelete':
                    layer.confirm('你真的要删除选中的吗?', {
                        icon: 2,
                        title: '温馨提示',
                        skin: 'demo-class',
                        area: ['330px', '180px']
                    }, function (index) {
                        layer.close(index);
                        var checkStatus = table.checkStatus('rechargeTable'); //idTest 即为基础参数 id 对应的值
                        var datas = checkStatus.data;
                        console.log(datas);
                        $(datas).each(function (index) {
                            console.log(datas[index].id);
                            $.ajax({
                                url: '${pageContext.request.contextPath}/recharge/deleteRecharge?ids=' + datas[index].id,
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
        table.on('tool(rechargeTable)', function (obj) {
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
                        url: '${pageContext.request.contextPath}/recharge/deleteRecharge?ids=' + data.id,
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
                openEditRecharge(data);
            }
        });

        var mainIndex;

        //打开添加/编辑页面
        function openEditRecharge(data) {
            console.log($("#dataFrm").serialize());
            mainIndex = layer.open({
                type: 1,
                title: data == null ? '添加订单' : '编辑订单',
                content: $("#saveOrUpdateDiv"),
                area: ['800px', '500px'],
                skin: 'open-class',
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
                    layer.load(1);
                    $.ajax({
                        url: '${pageContext.request.contextPath}/recharge/' + (data == null ? "addRecharge" : "updateRecharge"),
                        data: {
                            id: $("#id").val(),
                            cusId: $("#cusId").val(),
                            orderId: $("#orderId").val(),
                            createTime: submitTime,
                            updateTime: submitTime,
                            money: $("#money").val(),
                            state: $("#state").val(),
                            paymentType: $("#paymentType").val()
                        },
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
                , btn1: function () {
                    tableIns.reload()
                }
                , success: function (index) {
                    form.render();
                    if (data != null) {
                        form.val("dataFrm", data)
                    } else {
                        $("#dataFrm")[0].reset()
                    }
                }
            });
        }

        //提交搜索条件表单
        form.on("submit(doSearch)", function (obj) {
            console.log(obj.field);
            tableIns.reload({
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: obj.field
            });
            return false;
        });
    });
</script>
</body>
</html>
