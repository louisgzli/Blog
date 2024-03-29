<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">
    <head>
        <title>Animated Form Switching with jQuery</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="description" content="Expand, contract, animate forms with jQuery wihtout leaving the page" />
        <meta name="keywords" content="expand, form, css3, jquery, animate, width, height, adapt, unobtrusive javascript"/>
		<%--<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon"/>--%>
        <link rel="stylesheet" type="text/css" href="${assetsPath}/css/style.css" />
		<script src="${assetsPath}/js/cufon-yui.js" type="text/javascript"></script>
		<script src="${assetsPath}/js/ChunkFive_400.font.js" type="text/javascript"></script>
		<script type="text/javascript">
			Cufon.replace('h1',{ textShadow: '1px 1px #fff'});
			Cufon.replace('h2',{ textShadow: '1px 1px #fff'});
			Cufon.replace('h3',{ textShadow: '1px 1px #000'});
			Cufon.replace('.back');
		</script>
    </head>
    <body>
		<div class="wrapper">
			<h1>Animated Form Switching</h1>
			<h2>Demo: click the <span>orange links</span> to see the form animating and switching</h2>
			<div class="content">
				<div id="form_wrapper" class="form_wrapper">
					<form class="register active" id="loginForm" action="${rootPath}/user/register" method="post">
						<h3>Register</h3>
						<div class="column">
							<div>
								<label>UserName:</label>
								<input type="text" name="username" />
								<span class="error">This is an error</span>
							</div>
							<div>
								<label>sex:</label>
								<%--<select  name="sex" class="bottom">--%>
									<%--<option value="男">男</option>
									<option value="女">女</option>--%>
								</p>
								&nbsp	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input name="sex" type="radio" value="男" />男
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									<input name="sex" type="radio" value="女" />女
								<%--</select>--%>
								<span class="error">This is an error</span>
							</div>
							<div>
								<label>City:</label>
								<input type="text" value="中国：" name="city"/>
								<span class="error">This is an error</span>
							</div>
						</div>
						<div class="column">
							<div>
								<label>Interest:</label>
								<input type="text" name="interest"/>
								<span class="error">This is an error</span>
							</div>
							<div>
								<label>Email:</label>
								<input type="text" name="email"/>
								<span class="error">This is an error</span>
							</div>
							<div>
								<label>Password:</label>
								<input type="password" name="password"/>
								<span class="error">This is an error</span>
							</div>
						</div>
						<div class="bottom">
							<div class="remember">
								<input type="checkbox" />
								<span>Send me updates</span>
							</div>
							<div class="errorMsg" style="color:#ff6f56"></div>
							<input type="submit" value="Register"  onclick="return userRegisterSubmit()"/>
							<a href="${rootPath}/user/login" rel="login" class="linkform">You have an account already? Log in here</a>
							<div class="clear"></div>
						</div>
					</form>
					<form class="login">
						<h3>Login</h3>
						<div>
							<label>Username:</label>
							<input type="text" />
							<span class="error">This is an error</span>
						</div>
						<div>
							<label>Password: <a href="forgot_password.jsp" rel="forgot_password" class="forgot linkform">Forgot your password?</a></label>
							<input type="password" />
							<span class="error">This is an error</span>
						</div>
						<div class="bottom">
							<div class="remember"><input type="checkbox" /><span>Keep me logged in</span></div>
							<input type="submit" value="Login" />
							<a href="${rootPath}/user/register" rel="register" class="linkform">You don't have an account yet? Register here</a>
							<div class="clear"></div>
						</div>
					</form>
					<form class="forgot_password">
						<h3>Forgot Password</h3>
						<div>
							<label>Username or Email:</label>
							<input type="text" />
							<span class="error">This is an error</span>
						</div>
						<div class="bottom">
							<input type="submit" value="Send reminder" />
							<a href="login.jsp" rel="login" class="linkform">Suddenly remebered? Log in here</a>
							<a href="${rootPath}/user/login" rel="register" class="linkform">You don't have an account? Register here</a>
							<div class="clear"></div>
						</div>
					</form>
				</div>
				<div class="clear"></div>
			</div>
			<a class="back" href="http://tympanus.net/codrops/2011/01/06/animated-form-switching/">back to the Codrops tutorial</a>
		</div>
		

		<!-- The JavaScript -->
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
		<script type="text/javascript">
			$(function() {
					//the form wrapper (includes all forms)
				var $form_wrapper	= $('#form_wrapper'),
					//the current form is the one with class active
					$currentForm	= $form_wrapper.children('form.active'),
					//the change form links
					$linkform		= $form_wrapper.find('.linkform');
						
				//get width and height of each form and store them for later						
				$form_wrapper.children('form').each(function(i){
					var $theForm	= $(this);
					//solve the inline display none problem when using fadeIn fadeOut
					if(!$theForm.hasClass('active'))
						$theForm.hide();
					$theForm.data({
						width	: $theForm.width(),
						height	: $theForm.height()
					});
				});
				
				//set width and height of wrapper (same of current form)
				setWrapperWidth();
				
				/*
				clicking a link (change form event) in the form
				makes the current form hide.
				The wrapper animates its width and height to the 
				width and height of the new current form.
				After the animation, the new form is shown
				*/
				$linkform.bind('click',function(e){
					var $link	= $(this);
					var target	= $link.attr('rel');
					$currentForm.fadeOut(400,function(){
						//remove class active from current form
						$currentForm.removeClass('active');
						//new current form
						$currentForm= $form_wrapper.children('form.'+target);
						//animate the wrapper
						$form_wrapper.stop()
									 .animate({
										width	: $currentForm.data('width') + 'px',
										height	: $currentForm.data('height') + 'px'
									 },500,function(){
										//new form gets class active
										$currentForm.addClass('active');
										//show the new form
										$currentForm.fadeIn(400);
									 });
					});
					e.preventDefault();
				});
				
				function setWrapperWidth(){
					$form_wrapper.css({
						width	: $currentForm.data('width') + 'px',
						height	: $currentForm.data('height') + 'px'
					});
				}
				
				/*
				for the demo we disabled the submit buttons
				if you submit the form, you need to check the 
				which form was submited, and give the class active 
				to the form you want to show
				*/
				$form_wrapper.find('input[type="submit"]')
							 .click(function(e){
								e.preventDefault();
							 });	
			});
        </script>
		<script>

			function userRegisterSubmit() {
				console.log('loginSubmit')
				$.ajax({
					type: 'post',
					url: '/blog/user/register',    //  填进你要处理表单信息的Servlet
					data: $('#loginForm').serialize(),    //   字符串  name1=value1&name2=value2
					success: function(loginMsg) {
						console.log(loginMsg)
						if( loginMsg.status ) {
							console.log("-----")
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