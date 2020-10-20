<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>图片总数--layui后台管理模板</title>
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
<blockquote class="layui-elem-quote news_search" style="height: 25px;padding-bottom: 20px; " >
    <div class="layui-inline">
        <input type="checkbox" style="padding-top: 30px !important;" name="selectAll" id="selectAll" lay-filter="selectAll" lay-skin="primary" title="全选">
    </div>
    <div class="layui-inline">
        <a class="layui-btn layui-btn-sm layui-btn-danger batchDel">批量删除</a>
    </div>
    <div class="layui-inline">
        <a class="layui-btn layui-btn-sm uploadNewImg">上传新图片</a>
    </div>
</blockquote>
<ul class="layer-photos-demo" id="Images"></ul>
</form>
<script type="text/javascript" src="../../layui/layui.js"></script>
<script type="text/javascript">
    layui.config({
        base: "../../js/"
    }).use(['flow', 'form', 'layer', 'upload'], function () {
        var flow = layui.flow,
            form = layui.form,
            layer = parent.layer === undefined ? layui.layer : top.layer,
            upload = layui.upload,
            $ = layui.jquery;

        //流加载图片
        var imgNums = 10;  //单页显示图片数量
        flow.load({
            elem: '#Images', //流加载容器
            done: function (page, next) { //加载页面的图片
                $.get("${pageContext.request.contextPath}/image/showImages?page=" + page + "&limit=" + imgNums, function (res) {
                    //模拟插入
                    var imgList = [], data = res.data;
                    setTimeout(function () {
                        layui.each(data, function (index, item) {
                            imgList.push('<li><img width="380px" height="310px" layer-src="${pageContext.request.contextPath}/static/' + item.src + '" src="${pageContext.request.contextPath}/static/' + item.thumb + '" alt="' + item.alt + '"><div class="operate"><div class="check"><input type="checkbox" name="belle" lay-filter="choose" lay-skin="primary" title="' + item.alt + '"></div><input type="hidden" id="pid" value="' + item.pid + '"/><i class="layui-icon img_del">&#xe640;</i></div></li>');
                        });
                        next(imgList.join(''), page < (res.count / imgNums));
                        form.render();
                    }, 500);
                });
            }
        });

        //设置图片的高度
        $(window).resize(function () {
            $("#Images li img").height($("#Images li img").width());
        });

        //多图片上传
        upload.render({
            elem: '.uploadNewImg',
            url: '${pageContext.request.contextPath}/image/uploadImages',
            accept: 'file',//相当于type属性  文件类型
            acceptMime: 'image/*',//筛选条件  只显示图片类型
            field: 'image',//相当于name属性  文件域的字段名
            multiple: true,
            before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    alert(result);
                    $('#Images').prepend('<li><img layer-src="' + result + '" src="' + result + '" alt="' + file.name + '" class="layui-upload-img"><div class="operate"><div class="check"><input type="checkbox" name="belle" lay-filter="choose" lay-skin="primary" title="' + file.name + '"></div><i class="layui-icon img_del">&#xe640;</i></div></li>')
                    //设置图片的高度
                    $("#Images li img").height($("#Images li img").width());
                    form.render("checkbox");
                });
            }
            //上传接口地址请求成功完毕后触发的成功回调函数
            , done: function (res) {
                //上传完毕
                if (res.code == 0) {
                    layer.msg(res.msg);
                    window.location.reload();
                } else {
                    layer.msg(res.msg);
                    parent.location.reload();
                }
            },
            //上传接口地址请求失败完毕后触发的成功回调函数
            error: function (index, upload) {
                layer.msg("地址请求失败！");
                // uploadInst.upload();//重新上传
                $(".news_search").append("<button class='layui-btn layui-bg-red againUpload'>重新上传</button>")
                form.render();
            }
        });
        //重新上传渲染
        var uploadInst = upload.render({
            elem: 'uploadNewImg'
            , url: '${pageContext.request.contextPath}/image/uploadImages'
            , accept: 'file'//相当于type属性  文件类型
            , acceptMime: 'image/*'//筛选条件  只显示图片类型
            , field: 'image'//相当于name属性  文件域的字段名
            , multiple: true
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#Images').prepend('<li><img layer-src="' + result + '" src="' + result + '" alt="' + file.name + '" class="layui-upload-img"><div class="operate"><div class="check"><input type="checkbox" name="belle" lay-filter="choose" lay-skin="primary" title="' + file.name + '"></div><i class="layui-icon img_del">&#xe640;</i></div></li>')
                    //设置图片的高度
                    $("#Images li img").height($("#Images li img").width());
                    form.render("checkbox");
                });
            }
            , choose: function (obj) {
                obj.preview(function (index, file, result) {
                    //对上传失败的单个文件重新上传，一般在某个事件中使用
                    obj.upload(index, file);
                });
            }
            //上传接口地址请求成功完毕后触发的成功回调函数
            , done: function (res) {
                //上传完毕
                if (res.code == 0) {
                    layer.msg(res.msg);
                    parent.location.reload();
                } else {
                    layer.msg(res.msg);
                    parent.location.reload();
                }
            },
            //上传接口地址请求失败完毕后触发的成功回调函数
            error: function (index, upload) {
                layer.msg("地址请求失败！");
                // uploadInst.upload();//重新上传
                $(".news_search").append("<button class='layui-btn layui-bg-red againUpload'>重新上传</button>")
                form.render();
            }
        });
        //重新上传
        $(".againUpload").click(function () {
            layer.msg("开始重新上传");
            uploadInst.upload();
        });
        //弹出层  点击图片时触发
        $("body").on("click", "#Images img", function () {
            parent.showImg();
        });

        //删除单张图片
        $("body").on("click", ".img_del", function () {
            var _this = $(this);
            layer.confirm('确定删除图片"' + _this.siblings().find("input[type='checkbox']").attr("title") + '"吗？', {
                icon: 3,
                title: '提示信息'
            }, function (index) {
                var pid = _this.siblings("input").val();
                var content;
                $.ajax({
                    url: '${pageContext.request.contextPath}/image/deleteImage?ids=' + pid,
                    success: function (res) {
                        if (res.status) {
                            content = res.message;
                            _this.parents("li").hide(1000);
                            setTimeout(function () {
                                _this.parents("li").remove();
                            }, 950);
                            layer.msg(content);
                            layer.close(index);
                        } else {
                            content = res.message;
                            layer.msg(content);
                            layer.close(index);
                        }
                    }
                });
            });
        });

        //全选
        form.on('checkbox(selectAll)', function (data) {
            var child = $("#Images li input[type='checkbox']");
            child.each(function (index, item) {
                item.checked = data.elem.checked;
            });
            form.render('checkbox');
        });

        //通过判断是否全部选中来确定全选按钮是否选中
        form.on("checkbox(choose)", function (data) {
            var child = $(data.elem).parents('#Images').find('li input[type="checkbox"]');
            var childChecked = $(data.elem).parents('#Images').find('li input[type="checkbox"]:checked');
            if (childChecked.length == child.length) {
                $(data.elem).parents('#Images').siblings("blockquote").find('input#selectAll').get(0).checked = true;
            } else {
                $(data.elem).parents('#Images').siblings("blockquote").find('input#selectAll').get(0).checked = false;
            }
            form.render('checkbox');
        });

        //批量删除
        $(".batchDel").click(function () {
            var $checkbox = $('#Images li input[type="checkbox"]');
            var $checked = $('#Images li input[type="checkbox"]:checked');
            if ($checkbox.is(":checked")) {
                layer.confirm('确定删除选中的图片？', {icon: 3, title: '提示信息'}, function (index) {
                    var index = layer.msg('删除中，请稍候', {icon: 16, time: false, shade: 0.8});
                    $checked.each(function () {
                        // console.log($(this).parent().siblings("input").val());
                        var pid = $(this).parent().siblings("input").val();
                        var content;
                        $.ajax({
                            url: '${pageContext.request.contextPath}/image/deleteImage?ids=' + pid,
                            success: function (res) {
                                if (res.status) {
                                    content = res.message;
                                    tt(content);
                                } else {
                                    content = res.message;
                                    layer.close(index);
                                    layer.msg(content);
                                    form.render();

                                }
                            }
                        });
                    });

                    function tt(message) {
                        $(this).parents("li").hide(1000);
                        setTimeout(function () {
                            $(this).parents("li").remove();
                        }, 950);
                        setTimeout(function () {
                            //删除数据
                            $('#Images li input[type="checkbox"],#selectAll').prop("checked", false);
                            window.location.reload();
                            layer.close(index);
                            layer.msg(message);
                        }, 2000);
                    }
                })
            } else {
                layer.msg("请选择需要删除的图片");
            }
        })

    });
</script>
</body>
</html>