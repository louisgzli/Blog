<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>登陆</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="${assetsPath}/css/app.css"/>

    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css"/>       <!--这个为该页面特殊引入,为适应bootstrap的图标-->
    <script type="text/javascript" src="//cdn.bootcss.com/jquery/2.2.0/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>


<div class="main">
    <div class="admin" id="admin_login">           <!--id为该页面特殊标记-->
        <div class="navbar" role="navigation">
            <div class="navbar-header">
                <a class="" href="">
            <span class="navbar-brand">
                <span class="fa fa-book"></span> 博客
            </span>
                </a>
            </div>
        </div>


        <div class="login_box">
            <div class="modal-header">
                <i class="fa fa-desktop fa-2x col-md-2"></i>

                <h3 class="text-center col-md-4 col-md-offset-2">博客登陆系统</h3>
            </div>
            <div class="modal-body">
                <form action="/blog/login" id="loginForm" class="form center-block center-block" method="post">
                    <div class="input-group col-md-6">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                        <input type="text" class="form-control input-lg" id="examInputEmail1" name="username"
                               placeholder="请输入您的账号"/>
                    </div>
                    <div class="input-group col-md-6">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                        <input type="password" class="form-control input-lg" id="examInputPassword1" name="password"
                               placeholder="请输入您的密码"/>
                    </div>

                    <div class="input-group col-md-6">
                        <div class="errorMsg" style="color:#ff6f56"></div>
                        <input type="submit" class="btn btn-lg"  onclick="return userLoginSubmit()" value="登录" id="login-in">
                        <span><a href="#" style="text-align: right" class="forget">忘记密码?</a></span>
                    </div>
                </form>
            </div>

        </div>


    </div>
</div>
<script>

    function userLoginSubmit() {
        console.log('loginSubmit')
        $.ajax({
            type: 'post',
            url: '/blog/login',    //  填进你要处理表单信息的Servlet
            data: $('#loginForm').serialize(),    //   字符串  name1=value1&name2=value2
            success: function(loginMsg) {
                console.log(loginMsg)
                if( loginMsg.status ) {
                    //alert('登陆成功');
                    location.href='/blog/index';    //  路径不对的话改一下
                }
                else {
                    $('.errorMsg').html(loginMsg.message);
                }
            }
        });
        loginForm.reset();
        return false;
    }

</script>
</body>
</html>
