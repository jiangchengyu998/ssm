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
	<ul class="nav nav-tabs">
		<li><a href="${adminPath}/userList">系统用户列表</a></li>
		<li class="active"><a href="${adminPath}/form?id=${user.id}">用户添加</a></li>
	</ul><br>
	<form id="inputForm" action="${adminPath}/user/save" method="post" class="form-horizontal">
		<input type="hidden" id="id" name="id" value="${user.id}"/>
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">用户名</label>
   				<div class="col-sm-6">
						<input id="username" name="username"  maxlength="255" class="form-control " value="${user.username}"/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">密码</label>
   				<div class="col-sm-6">
						<input type="password" name="password" htmlEscape="false" maxlength="255" class="form-control " value="${user.password}"/>
				</div>
			</div>
			

			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">邮箱</label>
   				<div class="col-sm-6">
			
						<input name="email" htmlEscape="false" maxlength="255" class="form-control " value="${user.email}"/>
				</div>
			</div>
			
			<%--<div class="form-group" id="roleSelect">--%>
				<%--<label for="firstname" class="col-sm-1 control-label">性别</label>--%>
   				<%--<div class="col-sm-6">--%>
					<%--<select path="sex" htmlEscape="false" maxlength="64" class="form-control ">--%>
						<%--<option value="男">男</option>--%>
						<%--<form:option value="女">女</form:option>--%>
					<%--</select>--%>
				<%--</div>--%>
			<%--</div>--%>
			

			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">手机</label>
   				<div class="col-sm-6">
						<input name="phone" htmlEscape="false" maxlength="64" class="form-control " value="${user.phone}"/>
				</div>
			</div>
			
			<button class="btn btn-success" type="submit">保 存</button>
			<button class="btn btn-inf" type="button" onclick="javascript:history.go(-1);">返 回</button>
	</form>
</body>
</html>