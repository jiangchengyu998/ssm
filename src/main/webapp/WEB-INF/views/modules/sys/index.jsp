<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>JeeSSM框架模板</title>
    <link rel="stylesheet" href="${ctxStatic }/ui/js/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/ui/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctxStatic }/ui/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/ui/css/skins/_all-skins.css">
</head>
<body class="hold-transition skin-blue sidebar-mini" style="overflow:hidden;">
    <div id="ajax-loader" style="cursor: progress; position: fixed; top: -50%; left: -50%; width: 200%; height: 200%; background: #fff; z-index: 10000; overflow: hidden;">
        <img src="${ctxStatic }/ui/img/ajax-loader.gif" style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; margin: auto;" />
    </div>
    <div class="wrapper">
        <!--头部信息-->
        <header class="main-header">
            <a href="http://www.learun.cn/adms/index.html" target="_blank" class="logo">
                <span class="logo-mini">员工</span>
                <span class="logo-lg"><strong>${productName }</strong></span>
            </a>
            <nav class="navbar navbar-static-top">
                <a class="sidebar-toggle">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <!-- <li class="dropdown messages-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-envelope-o "></i>
                                <span class="label label-success">4</span>
                            </a>
                        </li>
                        <li class="dropdown notifications-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-bell-o"></i>
                                <span class="label label-warning">10</span>
                            </a>
                        </li>
                        <li class="dropdown tasks-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-flag-o"></i>
                                <span class="label label-danger">9</span>
                            </a>
                        </li> -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <%--<img src="${login.pic }" class="user-image" alt="User Image">--%>
                                <span class="hidden-xs">用户：</span>
                                <span class="hidden-xs">${login.trueName }</span>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a class="menuItem" data-id="userInfo" href="${adminPath }/sys/user/userInfo"><i class="fa fa-user"></i>个人信息</a></li>
                                <li class="divider"></li>
                                <li><a href="${adminPath }/sys/user/logout"><i class="ace-icon fa fa-power-off"></i>安全退出</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!--左边导航-->
        <div class="main-sidebar">
            <div class="sidebar">
                <%--<div class="user-panel">--%>
                    <%--<div class="pull-left image">--%>
                        <%--<img src="${login.pic }" class="img-circle" alt="User Image">--%>
                    <%--</div>--%>
                    <%--<div class="pull-left info">--%>
                        <%--<p>${login.trueName }</p>--%>
                        <%--<!-- <a><i class="fa fa-circle text-success"></i>在线</a> -->--%>
                    <%--</div>--%>
                <%--</div>--%>
                <!-- <form action="#" method="get" class="sidebar-form">
                    <div class="input-group">
                        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2534754276&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:2534754276:51" alt="点击这里给我发消息" title="点击这里给我发消息"/></a>
                    </div>
                </form> -->
                <ul class="sidebar-menu" id="sidebar-menu">
                    <!--<li class="header">导航菜单</li>-->
                    <li class="treeview active"><a href="#"><i class="fa fa-desktop"></i><span>系统管理</span><i class="fa fa-angle-left pull-right"></i></a>
                    	<ul class="treeview-menu menu-open" style="display: block;">
                            <c:if test="${login.role!='3'}">
                    		<li><a class="menuItem" data-id="7ae94059-9aa5-48eb-8330-4e2a6565b193" href="${adminPath }/sys/user"><i class="fa fa-leaf"></i>用户管理</a></li>
                            </c:if>
                    		<li><a class="menuItem" data-id="7ae94059-9aa5-48eb-8330-4e2a6565b194" href="${adminPath }/erm/checkingIn"><i class="fa fa-leaf"></i>考勤管理</a></li>
                    		<li><a class="menuItem" data-id="7ae94059-9aa5-48eb-8330-4e2a6565b195" href="${adminPath }/erm/salary"><i class="fa fa-leaf"></i>工资管理</a></li>
                    	</ul>
                    </li>
                    <li class="treeview"><a href="#"><i class="fa fa-desktop"></i><span>个人信息</span><i class="fa fa-angle-left pull-right"></i></a>
                    	<ul class="treeview-menu" style="display: none;">
                    		<li><a class="menuItem" data-id="7ae94059-9aa5-48eb-8330-4e2a6565b196" href="${adminPath }/sys/user/userInfo"><i class="fa fa-leaf"></i>个人中心</a></li>
                    	</ul>
                    </li>
                </ul>
               
            </div>
        </div>
        <!--中间内容-->
        <div id="content-wrapper" class="content-wrapper">
            <div class="content-tabs">
                <button class="roll-nav roll-left tabLeft">
                    <i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs menuTabs">
                    <div class="page-tabs-content" style="margin-left: 0px;">
                        <a href="javascript:;" class="menuTab active" data-id="index">考勤管理<i class="fa fa-remove"></i></a>
                    </div>
                </nav>
                <button class="roll-nav roll-right tabRight">
                    <i class="fa fa-forward" style="margin-left: 3px;"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown tabClose" data-toggle="dropdown">
                        页签操作<i class="fa fa-caret-down" style="padding-left: 3px;"></i>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><a class="tabReload" href="javascript:void();">刷新当前</a></li>
                        <li><a class="tabCloseCurrent" href="javascript:void();">关闭当前</a></li>
                        <li><a class="tabCloseAll" href="javascript:void();">全部关闭</a></li>
                        <li><a class="tabCloseOther" href="javascript:void();">除此之外全部关闭</a></li>
                    </ul>
                </div>
                <button class="roll-nav roll-right fullscreen"><i class="fa fa-arrows-alt"></i></button>
            </div>
            <div class="content-iframe" style="overflow: hidden;">
                <div class="mainContent" id="content-main" style="margin: 10px; margin-bottom: 0px; padding: 0;">
                    <iframe class="LRADMS_iframe" width="100%" height="100%" src="${adminPath }/erm/checkingIn/" frameborder="0" data-id="index"></iframe>
                </div>
            </div>
        </div>
    </div>
    <script src="${ctxStatic }/ui/js/jquery/jQuery-2.2.0.min.js"></script>
    <script src="${ctxStatic }/ui/js/bootstrap/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/ui/js/index.js"></script>
</body>
</html>