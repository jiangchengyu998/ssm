<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>薪资管理管理</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
            $("#type option[value=${clothesType.type}]").attr("selected", true);
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${adminPath}/clothesType">衣物类型管理列表</a></li>
		<li class="active"><a href="${adminPath}/clothesType/form">衣物类型添加</a></li>
	</ul>
	<br>
	<form id="inputForm"  action="${adminPath}/clothesType/save" method="post" class="form-horizontal" >
		<input type="hidden" value="${clothesType.id}" name="id" id="id"  />
			
			<div class="form-group" id="roleSelect">
				<label   class="col-sm-1 control-label">衣服类型名</label>
   				<div class="col-sm-6">
						<input name="typeName" id="typeName" class="form-control" value="${clothesType.typeName}"/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label   class="col-sm-1 control-label">类型</label>
				<div class="col-sm-6">
					<select name="type" id="type" class="form-control">
						<option value='0'>衣服</option>
						<option value='1'>裤子</option>
						<option value='2'>其他</option>
					</select>
					<%--<input name="type" id="type" class="form-control" value="${clothesType.type}"/>--%>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label   class="col-sm-1 control-label">备注</label>
				<div class="col-sm-6">
					<input name="remark" id="remark" class="form-control" value="${clothesType.remark}"/>
				</div>
			</div>
			

			<%--<div class="form-group" id="roleSelect">--%>
				<%--<label   class="col-sm-1 control-label">用户</label>--%>
				<%--<div class="col-sm-6">--%>
					<%--<form:select path="userId" class="form-control ">--%>
						<%--<form:options items="${emps }" itemLabel="trueName" itemValue="id"/>--%>
					<%--</form:select>--%>
				<%--</div>--%>
			<%--</div>--%>
			<button class="btn btn-success" type="submit">保 存</button>
			<button class="btn btn-inf" type="button" onclick="javascript:history.go(-1);">返 回</button>
	</form>
</body>
</html>