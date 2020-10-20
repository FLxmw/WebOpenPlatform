<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>个人资料--layui后台管理模板 2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/public.css" media="all"/>
</head>
<body class="childrenBody">
<form class="layui-form layui-row">
    <div class="layui-col-md3 layui-col-xs12 user_right">
        <div class="layui-upload-list">
            <img class="layui-upload-img layui-circle userFaceBtn userAvatar" id="userFace">
        </div>
        <button type="button" class="layui-btn layui-btn-primary userFaceBtn"><i class="layui-icon">&#xe67c;</i>
            掐指一算，我要换一个头像了
        </button>
        <%--<p>由于是纯静态页面，所以只能显示一张随机的图片</p>--%>
    </div>
    <div class="layui-col-md6 layui-col-xs12">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" value="${username}" name="username" id="username" disabled
                       class="layui-input layui-disabled">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">别名</label>
            <div class="layui-input-block">
                <input type="text" value="${user.aliasName}" name="aliasName" id="aliasName" placeholder="请输入别名"
                       lay-verify="required"
                       class="layui-input aliasName">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户组</label>
            <div class="layui-input-block">
                <c:if test="${user.grade==0}">
                    <input type="text" value="普通会员" disabled class="layui-input layui-disabled">
                </c:if>
                <c:if test="${user.grade==1}">
                    <input type="text" value="中级会员" disabled class="layui-input layui-disabled">
                </c:if>
                <c:if test="${user.grade==2}">
                    <input type="text" value="高级会员" disabled class="layui-input layui-disabled">
                </c:if>
                <c:if test="${user.grade==3}">
                    <input type="text" value="钻石会员" disabled class="layui-input layui-disabled">
                </c:if>
                <c:if test="${user.grade==4}">
                    <input type="text" value="超级会员" disabled class="layui-input layui-disabled">
                </c:if>
            </div>
        </div>
        <div class="layui-form-item" pane="">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block userSex">
                <c:if test="${user.sex=='男'}">
                    <input type="radio" name="sex" value="${user.sex}" title="${user.sex}" checked>
                    <input type="radio" name="sex" value="女" title="女">
                    <input type="radio" name="sex" value="保密" title="保密">
                </c:if>
                <c:if test="${user.sex=='女'}">
                    <input type="radio" name="sex" value="男" title="男">
                    <input type="radio" name="sex" value="${user.sex}" title="${user.sex}" checked>
                    <input type="radio" name="sex" value="保密" title="保密">
                </c:if>
                <c:if test="${user.sex=='保密'}">
                    <input type="radio" name="sex" value="男" title="男">
                    <input type="radio" name="sex" value="女" title="女">
                    <input type="radio" name="sex" value="${user.sex}" title="${user.sex}" checked>
                </c:if>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号码</label>
            <div class="layui-input-block">
                <input type="tel" value="${user.phone}" name="phone" id="phone" placeholder="请输入手机号码" lay-verify="phone"
                       class="layui-input userPhone">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">出生年月</label>
            <div class="layui-input-block">
                <input type="text" value="${user.birthday}" name="birthday" id="birthday" placeholder="请输入出生年月"
                       lay-verify="userBirthday" readonly
                       class="layui-input userBirthday">
            </div>
        </div>
        <div class="layui-form-item userAddress">
            <label class="layui-form-label">家庭住址</label>
            <div class="layui-input-inline">
                <select name="province" lay-filter="province" class="province">
                    <option value="">${user.province}</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="city" lay-filter="city" disabled>
                    <option value="">${user.city}</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="area" lay-filter="area" disabled>
                    <option value="">${user.area}</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">掌握技术</label>
            <div class="layui-input-block userHobby">
                <input type="checkbox" name="like[javascript]" title="Javascript">
                <input type="checkbox" name="like[C#]" title="C#">
                <input type="checkbox" name="like[php]" title="PHP">
                <input type="checkbox" name="like[html]" title="HTML(5)">
                <input type="checkbox" name="like[css]" title="CSS(3)">
                <input type="checkbox" name="like[.net]" title=".net">
                <input type="checkbox" name="like[ASP]" title="ASP">
                <input type="checkbox" name="like[Angular]" title="Angular">
                <input type="checkbox" name="like[VUE]" title="VUE">
                <input type="checkbox" name="like[XML]" title="XML">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="text" value="${user.email}" placeholder="请输入邮箱" lay-verify="email"
                       class="layui-input userEmail" name="email" id="email">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">自我评价</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" name="userDesc" id="userDesc"
                          class="layui-textarea myself">${user.userDesc}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="changeUser">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script type="text/javascript">
    layui.config({
        base: "${pageContext.request.contextPath}/js/"
    }).extend({
        "address": "address"
    });
    layui.use(['form', 'layer', 'upload', 'laydate', "address", "jquery"], function () {
        var form = layui.form,
            layer = parent.layer === undefined ? layui.layer : top.layer,
            upload = layui.upload,
            laydate = layui.laydate,
            $ = layui.jquery,
            address = layui.address;


        //上传头像
        upload.render({
            elem: '.userFaceBtn',
            url: '${pageContext.request.contextPath}/image/uploadImages',
            accept: 'file',//相当于type属性  文件类型
            acceptMime: 'image/*',//筛选条件  只显示图片类型
            field: 'image',//相当于name属性  文件域的字段名  默认为file
            multiple: true,
            done: function (res, index, upload) {
                var src = '${pageContext.request.contextPath}/static/';
                $('#userFace').attr('src', src + res.data.src);
                window.sessionStorage.setItem('userFace', src + res.data.src);
            }
        });

        //添加验证规则
        form.verify({
            userBirthday: function (value) {
                if (!/^(\d{4})[\u4e00-\u9fa5]|[-\/](\d{1}|0\d{1}|1[0-2])([\u4e00-\u9fa5]|[-\/](\d{1}|0\d{1}|[1-2][0-9]|3[0-1]))*$/.test(value)) {
                    return "出生日期格式不正确！";
                }
            }
        });
        //选择出生日期
        laydate.render({
            elem: '.userBirthday',
            // format: 'yyyy年MM月dd日',
            trigger: 'click',
            max: 0,
            mark: {"0-11-22": "生日"},
            done: function (value, date) {
                if (date.month === 11 && date.date === 22) { //点击每年12月15日，弹出提示语
                    layer.msg('今天是望望的生日，也是项目的发布日，快来送上祝福吧！');
                }
            }
        });

        //获取省信息
        address.provinces();

        //提交个人资料
        form.on("submit(changeUser)", function (data) {
            var index = layer.msg('提交中，请稍候', {icon: 16, time: false, shade: 0.8});
            //将填写的用户信息存到session以便下次调取
            var key, userInfoHtml = '';
            userInfoHtml = {
                'username': $("#username").val(),
                'sex': data.field.sex,
                'phone': $("#phone").val(),
                'birthday': $("#birthday").val(),
                'province': data.field.province,
                'city': data.field.city,
                'area': data.field.area,
                'email': data.field.email,
                'userDesc': $("#userDesc").val()
            };
            for (key in data.field) {
                if (key.indexOf("like") != -1) {
                    userInfoHtml[key] = "on";
                }
            }
            window.sessionStorage.setItem("userInfo", JSON.stringify(userInfoHtml));
            setTimeout(function () {
                layer.close(index);
                layer.msg("提交成功！");
                form.render();
            }, 2000);
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        //修改密码
        form.on("submit(changePwd)", function (data) {
            var index = layer.msg('提交中，请稍候', {icon: 16, time: false, shade: 0.8});
            setTimeout(function () {
                layer.close(index);
                alert("2222");
                layer.msg("密码修改成功！");
                $(".pwd").val('');
            }, 2000);
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        })
    })
</script>
<script type="text/javascript">
    layui.config({
        base : "${pageContext.request.contextPath}/js/"
    }).use(['form','jquery',"address"],function() {
        var form = layui.form,
            $ = layui.jquery,
            address = layui.address;

        //判断是否设置过头像，如果设置过则修改顶部、左侧和个人资料中的头像，否则使用默认头像
        if(window.sessionStorage.getItem('userFace')){
            $("#userFace").attr("src",window.sessionStorage.getItem('userFace'));
            $(".userAvatar").attr("src",$(".userAvatar").attr("src").split("images/")[0] + "images/" + window.sessionStorage.getItem('userFace').split("images/")[1]);
        }else{
            $("#userFace").attr("src","${pageContext.request.contextPath}/static/images/face.jpg");
        }

        //判断是否修改过用户信息，如果修改过则填充修改后的信息
        var menuText = $("#top_tabs",parent.document).text();  //判断打开的窗口是否存在“个人资料”页面
        var citys,areas;
        if(window.sessionStorage.getItem('userInfo')){
            //获取省信息
            address.provinces();
            var userInfo = JSON.parse(window.sessionStorage.getItem('userInfo'));
            var citys;
            $("#username").val(userInfo.username); //用户名
            $(".userSex input[value="+userInfo.sex+"]").attr("checked","checked"); //性别
            $("#phone").val(userInfo.phone); //手机号
            $("#birthday").val(userInfo.birthday); //出生年月
            //填充省份信息，同时调取市级信息列表
            $.get("../../static/json/address.json", function (addressData) {
                $(".userAddress select[name='province']").val(userInfo.province); //省
                var value = userInfo.province;
                if (value > 0) {
                    address.citys(addressData[$(".userAddress select[name='province'] option[value='"+userInfo.province+"']").index()-1].childs);
                    citys = addressData[$(".userAddress select[name='province'] option[value='"+userInfo.province+"']").index()-1].childs;
                } else {
                    $('.userAddress select[name=city]').attr("disabled","disabled");
                }
                $(".userAddress select[name='city']").val(userInfo.city); //市
                //填充市级信息，同时调取区县信息列表
                var value = userInfo.city;
                if (value > 0) {
                    address.areas(citys[$(".userAddress select[name=city] option[value='"+userInfo.city+"']").index()-1].childs);
                } else {
                    $('.userAddress select[name=area]').attr("disabled","disabled");
                }
                $(".userAddress select[name='area']").val(userInfo.area); //区
                form.render();
            })
            for(key in userInfo){
                if(key.indexOf("like") != -1){
                    $(".userHobby input[name='"+key+"']").attr("checked","checked");
                }
            }
            $("#email").val(userInfo.email); //用户邮箱
            $("#userDesc").val(userInfo.userDesc); //自我评价
            form.render();
        }
    })
</script>
</body>
</html>
