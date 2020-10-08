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
<form action="#" class="layui-form">
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
            <button class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-search" lay-submit lay-filter="doSearch">搜索</button>
        </div>
    </div>
</form>
<!-- 搜索条件结束 -->


<!-- 数据表格开始 -->
<table class="layui-hide" id="appInfoTable" lay-filter="appInfoTable"></table>
<div style="display: none;" id="appInfoToolBar">
    <button type="button" class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon">&#xe654;</i>增加</button>
    <button type="button" class="layui-btn layui-btn-sm layui-btn-danger " lay-event="batchDelete"><i class="layui-icon">&#xe640;</i>批量删除</button>
</div>
<div  id="appInfoBar" style="display: none;">
    <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe642;</i>编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</a>
</div>
<!-- 数据表格结束 -->

<!-- 添加和修改的弹出层开始 -->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv" >
    <form class="layui-form " action="" method="post" lay-filter="dataFrm" id="dataFrm" >
        <input type="hidden" hidden="hidden" name="id">
        <div class="layui-form-item">
            <label class="layui-form-label">应用名称</label>
            <div class="layui-input-block">
                <input type="text" name="appName" required lay-verify="required"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">选择所属客户</label>
            <div class="layui-input-inline">
                <select name="cusId" id="customerId">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">appKey</label>
            <div class="layui-input-block">
                <input type="text" name="appKey" required lay-verify="required"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">秘钥</label>
            <div class="layui-input-block">
                <input type="text" name="appSecret" required lay-verify="required"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">回调地址</label>
            <div class="layui-input-block">
                <input type="text" name="redirectUrl" required lay-verify="required"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">日调用量限制</label>
            <div class="layui-input-block">
                <input type="text" name="limit" required lay-verify="required"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">描述</label>
            <div class="layui-input-block">
                <input type="text" name="description" required lay-verify="required"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="radio" name="state" title="有效" value="1" checked/>
                <input type="radio" name="state" title="无效" value="0"/>
            </div>
        </div>
        <div class="layui-form-item" style="margin-left: 170px;">
            <div class="layui-input-block">
                <button type="button"  class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-release" lay-filter="doSubmit" lay-submit="" >提交</button>
                <button type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh" >重置</button>
            </div>
        </div>
    </form>

</div>
<!-- 添加和修改的弹出层结束 -->

<script src="../../layui/layui.js"></script>
<script type="text/javascript">
    layui.use([ 'jquery', 'layer', 'form', 'table','laydate' ], function() {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var laydate=layui.laydate;

        //绑定时间选择器
        laydate.render({
            elem:'#startTime'
        });
        laydate.render({
            elem:'#endTime'
        });
        laydate.render({
            elem:'#birthday'
            ,type:'date'
        })

        var tableIns;
        //渲染数据表格
        tableIns=table.render({
            elem: '#appInfoTable'   //渲染的目标对象
            ,url:'${pageContext.request.contextPath}/appInfo/showTable' //数据接口
            ,title: '客户数据表'//数据导出来的标题
            ,toolbar:"#appInfoToolBar"   //表格的工具条
            ,height:'full-20'
            ,cellMinWidth:100 //设置列的最小默认宽度
            , skin: 'row' //行边框风格  row列边框  nob无边框
            , even: true //开启隔行背景
            ,totalRow: true
            , text: {
                none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
            }
            ,done:function(res, curr, count){

            }
            ,page: true  //是否启用分页
            ,cols: [[   //列表数据
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', title:'ID', sort:true,align:'center',totalRowText: "合计"}
                ,{field:'corpName', title:'公司名',align:'center'}
                ,{field:'appName', title:'应用名称',align:'center'}
                ,{field:'appKey', title:'appKey', align:'center'}
                ,{field:'appSecret', title:'秘钥', align:'center'}
                ,{field:'redirectUrl', title:'回调地址', align:'center'}
                , {field: 'limit', title: '日调用量限制', align:'center'}
                , {field: 'description', title: '描述', align:'center'}
                ,{field:'state', title:'应用状态', align:'center',templet:function (data) {
                        return data.state==1?'<span  class="layui-badge layui-bg-green" style="margin: 5px;">有效</span>':'<span  class="layui-badge layui-bg-red" style="margin: 5px;">无效</span>';
                    }}
                ,{fixed: 'right', title:'操作', toolbar: '#appInfoBar', width:220,align:'center'}
            ]]
        })


        //监听头部工具栏事件
        table.on("toolbar(appInfoTable)",function(obj){
            switch(obj.event){
                case 'add':
                    openEditAppInfo(null);
                    break;
                case 'batchDelete':
                    var checkStatus = table.checkStatus('appInfoTable'); //idTest 即为基础参数 id 对应的值
                    var datas=checkStatus.data;
                    console.log(datas);
                    $(datas).each(function (index) {
                        console.log(datas[index].id)
                        $.ajax({
                            url:'${pageContext.request.contextPath}/appInfo/deleteAppInfo?ids='+datas[index].id,
                            success:function (data) {
                                if (data.status){
                                    layer.msg(data.message);
                                    tableIns.reload();//表格重载
                                }else {
                                    layer.msg(data.message);
                                }
                            }
                        })
                    });
                    // console.log(checkStatus.data) //获取选中行的数据
                    break;
            };
        })

        //监听行工具事件
        table.on('tool(appInfoTable)', function(obj){
            var data = obj.data; //获得当前行数据
            console.log(data);
            console.log(data.id)
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'del'){ //删除
                layer.msg("删除");
                layer.confirm('真的删除行么', function(index){
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax({
                        url:'${pageContext.request.contextPath}/appInfo/deleteAppInfo?ids='+data.id,
                        success:function (data) {
                            if (data.status){
                                layer.msg(data.message)
                                obj.del()//删除对应行（tr）的DOM结构，并更新缓存
                            }else {
                                layer.msg(data.message)
                            }
                        }
                    })
                });
            } else if(layEvent === 'edit'){ //编辑
                openEditAppInfo(data);
            }
        });

        var url;
        var mainIndex;
        //打开添加/编辑页面
        function openEditAppInfo(data){
            mainIndex=layer.open({
                type:1,
                title:'编辑|添加应用',
                content:$("#saveOrUpdateDiv"),
                area:['800px','500px'],
                success:function(index){
                    //清空表单数据
                    // JS转Jquery$(obj)
                    // Jquery转JS []
                    $("#dataFrm")[0].reset();
                    $.ajax({
                        url:'${pageContext.request.contextPath}/appInfo/getCustomers',
                        type:'POST',
                        success:function (res) {
                            if (res){
                                for (var i = 0; i <res.length ; i++) {
                                    if (data&&data.cusId==res[i].id) {
                                        $("#customerId").append('<option selected value="'+res[i].id+'">'+res[i].nickname+'</option>')
                                    }else {
                                        $("#customerId").append('<option value="' + res[i].id + '">' + res[i].nickname + '</option>');
                                    }
                                }
                                form.render();
                            }
                        }
                    });
                    url="${pageContext.request.contextPath}/appInfo/addAppInfo";
                }
            });
        }
        //打开修改页面
        function openEditAppInfo(data){
            mainIndex=layer.open({
                type:1,
                title:'修改用户',
                content:$("#saveOrUpdateDiv"),
                area:['800px','500px'],
                success:function(index){
                    //console.log(data)
                    form.val("dataFrm",data) ;//回显数据，直接给表单赋值
                    $.ajax({
                        url:'${pageContext.request.contextPath}/appInfo/getCustomers',
                        type:'POST',
                        success:function (res) {
                            if (res){
                                for (var i = 0; i <res.length ; i++) {
                                    if (data&&data.cusId&&data.cusId==res[i].id) {
                                        $("#customerId").append('<option selected value="'+res[i].id+'">'+res[i].nickname+'</option>')
                                    }else {
                                        $("#customerId").append('<option value="' + res[i].id + '">' + res[i].nickname + '</option>');
                                    }
                                }
                                form.render();
                            }
                        }
                    });
                    url="${pageContext.request.contextPath}/appInfo/updateAppInfo";

                }
            });
        }
        //保存 提交表单数据
        form.on("submit(doSubmit)",function(obj){
            console.log(obj.field)
            var json=JSON.stringify(obj.field)
            console.log(JSON.stringify(obj.field))
            console.log(url)
            //序列化表单数据成字符串
            var params=$("#dataFrm").serialize();//直接转换成数据
            console.log(params)
            //id=02&username=admin&email=2285538755%40qq.com&city=%E6%B7%B1%E5%9C%B3&sex=1
            $.ajax({
                url:url,
                data:json,
                contentType:"application/json;charset=UTF-8",
                type:"POST",
                success:function (data) {
                   if (data.status){
                       layer.msg(data.message)
                       //关闭弹出层
                       layer.close(mainIndex)
                       //刷新数据 表格
                       tableIns.reload()
                   } else {
                       layer.msg(data.message)
                   }
                }
            })
        });

        //提交搜索条件表单
        form.on("submit(doSearch)",function (obj) {
            console.log(obj.field);
            tableIns.reload({
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: obj.field
            });
            <%--$.ajax({--%>
                <%--url:'${pageContext.request.contextPath}/appInfo/search',--%>
                <%--data:obj.field,--%>
                <%--method:'POST',--%>
                <%--success:function (data) {--%>
                    <%--tableIns.reload({--%>
                        <%--page: {--%>
                            <%--curr: 1 //重新从第 1 页开始--%>
                        <%--},--%>
                        <%--where: data.field--%>
                    <%--})--%>
                <%--}--%>
            <%--})--%>
        });
    });
</script>
</body>
</html>
