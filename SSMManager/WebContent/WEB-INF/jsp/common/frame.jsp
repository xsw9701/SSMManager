<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<link rel="shortcut icon" href="resource/favicon.ico" />
<title>小区物业管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="resource/css/animate.min.css" rel="stylesheet">
<link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet">
</head>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body class="fixed-sidebar full-height-layout gray-bg"
	style="overflow: hidden">
	<div id="wrapper">
		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
		<div class="nav-close">
			<i class="fa fa-times-circle"></i>
		</div>
		<div class="sidebar-collapse">
			<ul class="nav" id="side-menu">
				<li class="nav-header">
					<div class="dropdown profile-element">
						<span><img alt="image" class="img-circle"
							src="resource/img/logo.png" width="60px" /></span> <a
							data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
							class="clear"> <span class="block m-t-xs"><strong
									class="font-bold">${user.name}</strong></span> <span
								class="text-muted text-xs block">${user.userName }<b
									class="caret"></b></span>
						</span>
						</a>
						<ul class="dropdown-menu animated fadeInRight m-t-xs">
							<c:if test="${user.type=='0'}">
								<li><a class="J_menuItem" href="/SSMManager/user/toInfo">个人资料</a></li>
							</c:if>
							<li><a href="/SSMManager/user/loginOut">安全退出</a></li>
						</ul>
					</div>

				</li>
				<c:if test="${user.type=='1'}">
					<li><a class="J_menuItem" href="user/toList"><i
							class="fa fa-user"></i>用户列表</a> <a class="J_menuItem"
						href="floor/toList"><i class="fa fa-user"></i>楼房列表</a> <a
						class="J_menuItem" href="complaint/toList"><i
							class="fa fa-user"></i>投诉列表</a> <a class="J_menuItem"
						href="fee/toList"><i class="fa fa-user"></i>费用列表</a> <a
						class="J_menuItem" href="notice/toList"><i class="fa fa-user"></i>公告列表</a>
						<a class="J_menuItem" href="owner/toList"><i
							class="fa fa-user"></i>住户列表</a> <a class="J_menuItem"
						href="repair/toList"><i class="fa fa-user"></i>维修列表</a> <a
						class="J_menuItem" href="place/toList"><i class="fa fa-user"></i>车位列表</a>
					</li>
				</c:if>
				<c:if test="${user.type=='0' }">
					<li><a class="J_menuItem" href="complaint/toList"><i
							class="fa fa-user"></i>投诉列表</a> <a class="J_menuItem"
						href="fee/toList"><i class="fa fa-user"></i>费用列表</a> <a
						class="J_menuItem" href="repair/toList"><i class="fa fa-user"></i>维修列表</a>
					</li>
				</c:if>

			</ul>
		</div>
		</nav>
		<!--左侧导航结束-->
		<!--右侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation"
					style="margin-bottom: 0">
				<div class="navbar-header">
					<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
						href="#"><i class="fa fa-bars"></i> </a>

				</div>
				</nav>
			</div>
			<div class="row content-tabs">
				<button class="roll-nav roll-left J_tabLeft">
					<i class="fa fa-backward"></i>
				</button>
				<nav class="page-tabs J_menuTabs">
				<div class="page-tabs-content">

					<a href="javascript:;" class="active J_menuTab"
						data-id="index_v1.html">首页</a>
				</div>
				</nav>
				<button class="roll-nav roll-right J_tabRight">
					<i class="fa fa-forward"></i>
				</button>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown J_tabClose" data-toggle="dropdown">
						关闭操作<span class="caret"></span>

					</button>
					<ul role="menu" class="dropdown-menu dropdown-menu-right">
						<li class="J_tabShowActive"><a>定位当前选项卡</a></li>
						<li class="divider"></li>
						<li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
						<li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
					</ul>
				</div>
				<a href="/SSMManager/user/loginOut"
					class="roll-nav roll-right J_tabExit"><i
					class="fa fa fa-sign-out"></i> 退出</a>
			</div>
			<div class="row J_mainContent" id="content-main">
				<c:if test="${user.type=='1' }">
					<iframe class="J_iframe" name="iframe0" width="100%" height="100%"
						src="common/toAdmin" frameborder="0" data-id="index_v1.html"
						seamless> </iframe>
				</c:if>

				<c:if test="${user.type=='0' }">
					<iframe class="J_iframe" name="iframe0" width="100%" height="100%"
						src="common/toUser" frameborder="0" data-id="index_v1.html"
						seamless></iframe>
				</c:if>
			</div>
			<div class="footer">
				<div class="pull-right">&copy; 2018-2019 小区物业管理系统</div>
			</div>
		</div>
	</div>
	<script src="resource/js/jquery.min.js?v=2.1.4"></script>
	<script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
	<script src="resource/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="resource/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resource/js/plugins/layer/layer.min.js"></script>
	<script src="resource/js/hplus.min.js?v=4.0.0"></script>
	<script type="text/javascript" src="resource/js/contabs.min.js"></script>
	<script src="resource/js/plugins/pace/pace.min.js"></script>
</body>

</html>
