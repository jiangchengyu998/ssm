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
		<li class="active"><a href="${adminPath}/user/userInfo">个人信息</a></li>
		<li><a href="${adminPath}/user/repassword">密码修改</a></li>
	</ul>
	</div>
	<div class="panel-body">
	<form id="inputForm" modelAttribute="user" action="${adminPath}/user/updateUserInfo" method="post" class="form-horizontal">
		<hidden path="id"/>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">用户名</label>
   				<div class="col-sm-6">
						<input id="username" name="username" htmlEscape="false" disabled="true" maxlength="255" class="form-control " value="${user.username}"/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">邮箱</label>
   				<div class="col-sm-6">
						<input id="email" name="email" htmlEscape="false" maxlength="255" class="form-control "  value="${user.email}"/>
				</div>
			</div>
			
			<%--<div class="form-group" id="roleSelect">--%>
				<%--<label for="firstname" class="col-sm-1 control-label">性别</label>--%>
   				<%--<div class="col-sm-6">--%>
					<%--<form:select path="sex" htmlEscape="false" maxlength="64" class="form-control ">--%>
						<%--<form:option value="男">男</form:option>--%>
						<%--<form:option value="女">女</form:option>--%>
					<%--</form:select>--%>
				<%--</div>--%>
			<%--</div>--%>
			

			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">手机</label>
   				<div class="col-sm-6">
						<input id="phone" name="phone" htmlEscape="false" maxlength="64" class="form-control "  value="${user.phone}"/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label"></label>
   				<div class="col-sm-6">
					<span style="color:green;">${msg }</span>
				</div>
			</div>
			<button class="btn btn-success" type="submit">保 存</button>
			<button class="btn btn-inf" type="button" onclick="javascript:history.go(-1);">返 回</button>
	</form>
	</div>
	</div>
</body>
</html>