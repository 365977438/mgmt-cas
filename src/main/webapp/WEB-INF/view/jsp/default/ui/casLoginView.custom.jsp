<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>优居-管理后台统一登录</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="./assets/css/bootstrap.css" />
		<link rel="stylesheet" href="./assets/css/font-awesome.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="./assets/css/ace-fonts.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="./assets/css/ace.css" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="./assets/css/ace-part2.css" />
		<![endif]-->

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="./assets/css/ace-ie.css" />
		<![endif]-->

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="./assets/js/html5shiv.js"></script>
		<script src="./assets/js/respond.js"></script>
		<![endif]-->
		<script type="text/javascript">
			// 地址栏不是以sso地址开头
			var loginServer = '<spring:eval expression="@propertyConfigurer.getProperty(\'server.name\')" />';
			var loginServer = loginServer.substring(loginServer.indexOf('://')+3);
			console.log(loginServer);
			if(top.location.href.indexOf(loginServer)<0) {
				alert('当前系统登录已过期,将尝试重新登录');
				window.location.reload();
			}
		</script>
	</head>

	<body class="login-layout light-login">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="ace-icon fa fa-leaf green"></i>
									<span class="red">优居</span>
									<span class="white" id="id-text2">管理后台</span>
								</h1>
								
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<div class="space-6"></div>
											
											<form:form method="post" id="fm1" class="login-form" commandName="${commandName}" htmlEscape="true">
											
												<form:errors path="*" id="msg" cssClass="alert alert-danger" element="div" />

												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<form:input cssClass="form-control" placeholder="用户名" id="username" path="username" autocomplete="false" htmlEscape="true"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<form:password cssClass="form-control" placeholder="密码" id="password" path="password" autocomplete="off" htmlEscape="true"/>
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<div class="space"></div>

													<div class="block clearfix">
														<input type="hidden" name="lt" value="${loginTicket}" />
											            <input type="hidden" name="execution" value="${flowExecutionKey}" />
											            <input type="hidden" name="_eventId" value="submit" />
														<button type="submit" class="btn btn-sm btn-block btn-primary">
															<i class="ace-icon fa fa-key"></i>
															<span class="bigger-110">登录</span>
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form:form>
											
											<div class="space-6"></div>
											
											
										</div><!-- /.widget-main -->
										
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->


							</div><!-- /.position-relative -->

							<div class="navbar-fixed-top align-right">
								<br />
								&nbsp;
								<a id="btn-login-dark" href="#">深沉</a>
								&nbsp;
								<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-blur" href="#">模糊</a>
								&nbsp;
								<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-light" href="#">浅色</a>
								&nbsp; &nbsp; &nbsp;
							</div>
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='./assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='./assets/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='./assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			function setCookie(name, value, days) {
			    var expires;
	
			    if (days) {
			        var date = new Date();
			        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
			        expires = "; expires=" + date.toGMTString();
			    } else {
			        expires = "";
			    }
			    document.cookie = encodeURIComponent(name) + "=" + encodeURIComponent(value) + expires + "; path=/";
			}
	
			function getCookie(name) {
			    var nameEQ = encodeURIComponent(name) + "=";
			    var ca = document.cookie.split(';');
			    for (var i = 0; i < ca.length; i++) {
			        var c = ca[i];
			        while (c.charAt(0) === ' ') c = c.substring(1, c.length);
			        if (c.indexOf(nameEQ) === 0) return decodeURIComponent(c.substring(nameEQ.length, c.length));
			    }
			    return null;
			}
	
			function removeCookie(name) {
			    setCookie(name, "", -1);
			}
		
			//you don't need this, just used for changing background
			jQuery(function($) {
			 
		     var loginStyle = getCookie("loginStyle");
		     if (loginStyle) {
		    	 if (loginStyle == "dark") {
		    		 $('body').attr('class', 'login-layout');
					 $('#id-text2').attr('class', 'white');
		    	 } else if (loginStyle=="light") {
		    		 $('body').attr('class', 'login-layout light-login');
					 $('#id-text2').attr('class', 'grey');
		    	 } else {
		    		 $('body').attr('class', 'login-layout blur-login');
					 $('#id-text2').attr('class', 'white');
		    	 }
		     }
		     
			 $('#btn-login-dark').on('click', function(e) {
				$('body').attr('class', 'login-layout');
				$('#id-text2').attr('class', 'white');
				
				setCookie("loginStyle", "dark");
				e.preventDefault();
			 });
			 
			 $('#btn-login-light').on('click', function(e) {
				$('body').attr('class', 'login-layout light-login');
				$('#id-text2').attr('class', 'grey');
				setCookie("loginStyle", "light");
				
				e.preventDefault();
			 });
			 $('#btn-login-blur').on('click', function(e) {
				$('body').attr('class', 'login-layout blur-login');
				$('#id-text2').attr('class', 'white');
				setCookie("loginStyle", "blur");
				
				e.preventDefault();
			 });
			 
			});
		</script>
	</body>
</html>
