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
		<li><a href="${adminPath}/sys/user/">系统用户列表</a></li>
		<li class="active"><a href="${adminPath}/sys/user/form?id=${user.id}">系统用户新增</a></li>
	</ul><br>
	<form:form id="inputForm" modelAttribute="user" action="${adminPath}/sys/user/save" method="post" class="form-horizontal"  enctype="multipart/form-data">
		<form:hidden path="id"/>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">用户名</label>
   				<div class="col-sm-6">
			
						<form:input path="username" htmlEscape="false" maxlength="255" class="form-control "/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">密码</label>
   				<div class="col-sm-6">
			
						<form:input path="password" htmlEscape="false" maxlength="255" class="form-control "/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">真实姓名</label>
   				<div class="col-sm-6">
			
						<form:input path="trueName" htmlEscape="false" maxlength="255" class="form-control "/>
				</div>
			</div>

			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">基本工资</label>
				<div class="col-sm-6">

					<form:input path="basicSalary" htmlEscape="false" maxlength="255" class="form-control "/>
				</div>
			</div>

			<!-- 不显示，只为了在更新时没有新上传图片保留原来数据 -->

			<%--<div class="form-group" id="roleSelect" style="display: none;">--%>
				<%--<label for="firstname" class="col-sm-1 control-label">头像</label>--%>
   				<%--<div class="col-sm-6">--%>
						<%--<form:input path="pic" htmlEscape="false" maxlength="500" class="form-control "/>--%>
				<%--</div>--%>
				<%----%>
			<%--</div>--%>
			<%--<div class="form-group" id="roleSelect">--%>
				<%--<label for="firstname" class="col-sm-1 control-label">头像</label>--%>
   				<%--<div class="col-sm-6">--%>
						<%--<input type="file" name="file">--%>
				<%--</div>--%>
			<%--</div>--%>
			
			<%-- <div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">生日</label>
   				<div class="col-sm-6">
			
						<input name="birth" type="text" readonly="readonly" maxlength="20" class="form-control Wdate required"
							value="<fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
						<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div> --%>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">邮箱</label>
   				<div class="col-sm-6">
			
						<form:input path="email" htmlEscape="false" maxlength="255" class="form-control "/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">性别</label>
   				<div class="col-sm-6">
					<form:select path="sex" htmlEscape="false" maxlength="64" class="form-control ">
						<form:option value="男">男</form:option>
						<form:option value="女">女</form:option>
					</form:select>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">家庭住址</label>
   				<div class="col-sm-6">
			
						<form:input path="address" htmlEscape="false" maxlength="255" class="form-control "/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">手机</label>
   				<div class="col-sm-6">
			
						<form:input path="phone" htmlEscape="false" maxlength="64" class="form-control "/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">个人介绍</label>
   				<div class="col-sm-6">
			
						<form:input path="introduce" htmlEscape="false" class="form-control "/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">角色</label>
   				<div class="col-sm-6">
					<form:select path="role" htmlEscape="false" maxlength="64" class="form-control ">
						<form:option value="1">管理员</form:option>
						<form:option value="2">经理</form:option>
						<form:option value="3">普通员工</form:option>
					</form:select>
				</div>
			</div>
			
			<%--<div class="form-group" id="roleSelect">--%>
				<%--<label for="firstname" class="col-sm-1 control-label">是否锁定</label>--%>
   				<%--<div class="col-sm-6">--%>
					<%--<form:select path="isBlock" htmlEscape="false" maxlength="64" class="form-control ">--%>
						<%--<form:option value="0">未锁定</form:option>--%>
						<%--<form:option value="1">锁定</form:option>--%>
					<%--</form:select>--%>
				<%--</div>--%>
			<%--</div>--%>
			<button class="btn btn-success" type="submit">保 存</button>
			<button class="btn btn-inf" type="button" onclick="javascript:history.go(-1);">返 回</button>
	</form:form>
</body>
</html>