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
            $.get("../../../image/showImages?page=" + page + "&limit=" + imgNums, function (res) {
                //模拟插入
                var imgList = [], data = res.data;
                setTimeout(function () {
                    layui.each(data, function (index, item) {
                        imgList.push('<li><img style="width: 220px;height: 220px;" layer-src="../../' + item.src + '" src="../../' + item.thumb + '" alt="' + item.alt + '"><div class="operate"><div class="check"><input type="checkbox" name="belle" lay-filter="choose" lay-skin="primary" title="' + item.alt + '"></div><i class="layui-icon img_del">&#xe640;</i></div></li>');
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
    var uploadInst = upload.render({
        elem: '.uploadNewImg',
        url: '../../json/userface.json',
        method: 'get',
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
        //调用upload()方法执行
        // , choose: function (obj) {
        //     obj.preview(function (index, file, result) {
        //         alert("又开始上传了");
        //         //对上传失败的单个文件重新上传，一般在某个事件中使用
        //         // obj.upload(index, file);
        //     });
        // }
        //上传接口地址请求成功完毕后触发的成功回调函数
        , done: function (res) {
            //上传完毕
            if (res.code == 0) {
                alert("成功！")
            } else {
                alert("失败！")
            }
        },
        //上传接口地址请求失败完毕后触发的成功回调函数
        error: function (index, upload) {
            alert("地址请求失败！");
            // uploadInst.upload();//重新上传
        }
    });

    //弹出层
    $("body").on("click", "#Images img", function () {
        parent.showImg();
    })

    //删除单张图片
    $("body").on("click", ".img_del", function () {
        var _this = $(this);
        layer.confirm('确定删除图片"' + _this.siblings().find("input").attr("title") + '"吗？', {
            icon: 3,
            title: '提示信息'
        }, function (index) {
            _this.parents("li").hide(1000);
            setTimeout(function () {
                _this.parents("li").remove();
            }, 950);
            layer.close(index);
        });
    })

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
    })

    //批量删除
    $(".batchDel").click(function () {
        var $checkbox = $('#Images li input[type="checkbox"]');
        var $checked = $('#Images li input[type="checkbox"]:checked');
        if ($checkbox.is(":checked")) {
            layer.confirm('确定删除选中的图片？', {icon: 3, title: '提示信息'}, function (index) {
                var index = layer.msg('删除中，请稍候', {icon: 16, time: false, shade: 0.8});
                setTimeout(function () {
                    //删除数据
                    $checked.each(function () {
                        $(this).parents("li").hide(1000);
                        setTimeout(function () {
                            $(this).parents("li").remove();
                        }, 950);
                    })
                    $('#Images li input[type="checkbox"],#selectAll').prop("checked", false);
                    form.render();
                    layer.close(index);
                    layer.msg("删除成功");
                }, 2000);
            })
        } else {
            layer.msg("请选择需要删除的图片");
        }
    })

})