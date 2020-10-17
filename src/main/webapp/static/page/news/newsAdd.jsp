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
<form class="layui-form layui-row layui-col-space10">
    <input type="hidden" name="id" class="id">
    <div class="layui-col-md9 layui-col-xs12">
        <div class="layui-row layui-col-space10">
            <div class="layui-col-md9 layui-col-xs7">
                <div class="layui-form-item magt3">
                    <label class="layui-form-label">文章标题</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input newsName" lay-verify="newsName" placeholder="请输入文章标题"
                               name="newsName">
                    </div>
                </div>
                <div class="layui-form-item magt3">
                    <label class="layui-form-label">作者</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input newsAuthor" lay-verify="newsAuthor" placeholder="请输入文章作者"
                               name="newsAuthor">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">内容摘要</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容摘要" class="layui-textarea digest" name="digest"></textarea>
                    </div>
                </div>
            </div>
            <div class="layui-col-md3 layui-col-xs5">
                <div class="layui-upload-list thumbBox mag0 magt3">
                    <%--<input type="text" class="layui-upload-img newsImg" name="newsImg">--%>
                    <img class="layui-upload-img newsImg" name="newsImg">
                </div>
            </div>
        </div>
        <div class="layui-form-item magb0">
            <label class="layui-form-label">文章内容</label>
            <div class="layui-input-block">
                <textarea class="layui-textarea layui-hide content" name="content" lay-verify="content"
                          id="news_content"></textarea>
            </div>
        </div>
    </div>
    <div class="layui-col-md3 layui-col-xs12">
        <blockquote class="layui-elem-quote title"><i class="seraph icon-caidan"></i> 分类目录</blockquote>
        <div class="border category">
            <div class="">
                <p style="height: 30px;"><input type="checkbox" name="news" title="新闻" lay-skin="primary"/></p>
                <p style="height: 30px;"><input type="checkbox" name="goods" title="商品" lay-skin="primary"/></p>
                <p style="height: 30px;"><input type="checkbox" name="notice" title="公告" lay-skin="primary"/></p>
                <p style="height: 30px;"><input type="checkbox" name="images" title="图片" lay-skin="primary"/></p>
            </div>
        </div>
        <blockquote class="layui-elem-quote title magt10"><i class="layui-icon">&#xe609;</i> 发布</blockquote>
        <div class="border">
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon">&#xe60e;</i> 状　态</label>
                <div class="layui-input-block newsStatus">
                    <select name="status" lay-verify="required">
                        <option value="0">保存草稿</option>
                        <option value="1">等待审核</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon">&#xe609;</i> 发　布</label>
                <div class="layui-input-block">
                    <input type="radio" name="release" title="立即发布" lay-skin="primary" lay-filter="release" checked/>
                    <input type="radio" name="release" title="定时发布" lay-skin="primary" lay-filter="release"/>
                </div>
            </div>
            <div class="layui-form-item layui-hide releaseDate">
                <label class="layui-form-label"></label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" id="release" placeholder="请选择日期和时间" readonly/>
                </div>
            </div>
            <div class="layui-form-item newsLook">
                <label class="layui-form-label"><i class="seraph icon-look"></i> 公开度</label>
                <div class="layui-input-block">
                    <input type="radio" name="newsLook" title="开放浏览" lay-skin="primary" checked/>
                    <input type="radio" name="newsLook" title="私密浏览" lay-skin="primary"/>
                </div>
            </div>
            <div class="layui-form-item newsTop">
                <label class="layui-form-label"><i class="seraph icon-zhiding"></i> 置　顶</label>
                <div class="layui-input-block">
                    <input type="checkbox" name="newsTop" lay-skin="switch" lay-text="是|否">
                </div>
            </div>
            <hr class="layui-bg-gray"/>
            <div class="layui-right">
                <a class="layui-btn layui-btn-sm" lay-filter="addNews" lay-submit><i
                        class="layui-icon">&#xe605;</i>发布</a>
                <button type="reset" class="layui-btn layui-btn-sm layui-btn-normal">
                    <i class="layui-icon">&#xe669;</i>重置</button>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript" src="../../layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer', 'layedit', 'laydate', 'upload'], function () {
        var form = layui.form,
            layer = parent.layer === undefined ? layui.layer : top.layer,
            laypage = layui.laypage,
            upload = layui.upload,
            layedit = layui.layedit,
            laydate = layui.laydate,
            $ = layui.jquery;

        //上传服务器
        layedit.set({
            uploadImage: {
                url: '${pageContext.request.contextPath}/image/uploadEditImage' //接口url
            }
        });
        //注意：layedit.set 一定要放在 build 前面，否则配置全局接口将无效。
        //创建一个编辑器
        var editIndex = layedit.build('news_content', {
            height: 535
        });

        //提交时把值同步到文本域中
        form.verify({
            //content富文本域中的lay-verify值
            content: function (value) {
                alert(value);
                return layedit.sync(editIndex);
            }
        });


        //上传缩略图
        upload.render({
            elem: '.thumbBox',
            url: '${pageContext.request.contextPath}/image/uploadImages',
            field: 'image',
            accept: 'file',//相当于type属性  文件类型
            acceptMime: 'image/*',//筛选条件  只显示图片类型
            done: function (res, index, upload) {
                // var num = parseInt(4 * Math.random());  //生成0-4的随机数，随机显示一个头像信息
                console.log(res);
                console.log(res.data);
                console.log(res.data.src);
                $('.newsImg').attr('src', '../../' + res.data.src);
                $('.thumbBox').css("background", "#fff");
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

        //定时发布
        var time = new Date();
        var submitTime = time.getFullYear() + '-' + filterTime(time.getMonth() + 1) + '-' + filterTime(time.getDate()) + ' ' + filterTime(time.getHours()) + ':' + filterTime(time.getMinutes()) + ':' + filterTime(time.getSeconds());
        laydate.render({
            elem: '#release',
            type: 'datetime',
            trigger: "click",
            done: function (value, date, endDate) {
                submitTime = value;
            }
        });
        form.on("radio(release)", function (data) {
            if (data.elem.title == "定时发布") {
                $(".releaseDate").removeClass("layui-hide");
                $(".releaseDate #release").attr("lay-verify", "required");
            } else {
                $(".releaseDate").addClass("layui-hide");
                $(".releaseDate #release").removeAttr("lay-verify");
                submitTime = time.getFullYear() + '-' + (time.getMonth() + 1) + '-' + time.getDate() + ' ' + time.getHours() + ':' + time.getMinutes() + ':' + time.getSeconds();
            }
        });

        form.verify({
            newsName: function (val) {
                if (val == '') {
                    return "文章标题不能为空";
                }
            }
            // ,content : function(val){
            //     if(val == ''){
            //         return "文章内容不能为空";
            //     }
            // }
        });

        form.on("submit(addNews)", function (data) {
            // 执行layedit.build返回的值
            var desc = layedit.getContent(editIndex).split('<audio controls="controls" style="display: none;"></audio>')[0];
            //截取文章内容中的一部分文字放入文章摘要
            var abstract = layedit.getText(editIndex).substring(0, 50);
            //弹出loading
            var index = top.layer.msg('数据提交中，请稍候', {icon: 16, time: false, shade: 0.8});
            // 实际使用时的提交信息
            var msg;
            var img = $(".newsImg").attr("src");
            console.log(img);
            $.ajax({
                url: "${param.url}",
                method: 'post',
                data: {
                    id: $(".id").val(),
                    newsName: $(".newsName").val(),  //文章标题
                    newsAuthor: $(".newsAuthor").val(),
                    digest: $(".digest").val(),  //文章摘要
                    content: layedit.getContent(editIndex).split('<audio controls="controls" style="display: none;"></audio>')[0],  //文章内容
                    newsImg: $(".newsImg").attr("src"),  //缩略图
                    classify: '1',    //文章分类
                    newsStatus: $('.newsStatus select').val(),    //发布状态
                    newsTime: submitTime,    //发布时间
                    newsTop: data.field.newsTop == "on" ? "checked" : "",    //是否置顶
                    newsLook: data.field.newsLook == "on" ? "开放浏览" : "私密浏览"
                },
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
                parent.location.reload();
            }, 2000);
            return false;
        });
    });
</script>
</body>
</html>