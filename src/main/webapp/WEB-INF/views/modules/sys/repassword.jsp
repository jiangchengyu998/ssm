<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>系统用户管理</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
	</script>
</head>
<body>
	<div class="panel panel-default">
	<div class="panel-heading">
	<ul class="nav nav-tabs">
		<li><a href="${adminPath}/user/userInfo">个人信息</a></li>
		<li class="active"><a href="${adminPath}/user/repassword">密码修改</a></li>
	</ul>
	</div>
	<div class="panel-body">
	<form id="inputForm" action="${adminPath}/user/fixPassword" method="post" class="form-horizontal">
			<div class="form-group" id="oldPassword">
				<label class="col-sm-1 control-label">旧密码</label>
   				<div class="col-sm-6">
						<input type="text" name="oldPassword" value="${oldPassword }" class="form-control "/>
				</div>
			</div>
			
			<div class="form-group" id="newPassword">
				<label class="col-sm-1 control-label">新密码</label>
   				<div class="col-sm-6">
						<input type="password" name="newPassword" value="${newPassword }" class="form-control "/>
				</div>
			</div>
			<div class="form-group" id="againPassword">
				<label  class="col-sm-1 control-label">确认密码</label>
   				<div class="col-sm-6">
						<input type="password" name="againPassword" value="${againPassword }" class="form-control "/>
				</div>
			</div>
			<div class="form-group" id="roleSelect">
				<label class="col-sm-1 control-label"></label>
				 <span style="color: red;">${msg }</span>
			</div>
			<button class="btn btn-success" type="submit">保 存</button>
			<button class="btn btn-inf" type="button" onclick="javascript:history.go(-1);">返 回</button>
	</form>
	</div>
	</div>
</body>
</html>