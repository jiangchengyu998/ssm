<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>薪资管理管理</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${adminPath}/clothes">衣物管理列表</a></li>
		<li class="active"><a href="${adminPath}/clothes/form">衣物添加</a></li>
	</ul>
	<br>
	<form id="inputForm"  action="${adminPath}/clothes/save" method="post" class="form-horizontal" >
		<input type="hidden" value="${clothes.id}" name="id" id="id"  />
			
			<div class="form-group" id="roleSelect">
				<label   class="col-sm-1 control-label">类型id</label>
   				<div class="col-sm-6">
						<input name="typeId" id="typeId" class="form-control" value="${clothes.typeId}"/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label   class="col-sm-1 control-label">描述</label>
				<div class="col-sm-6">
					<input name="clothesDescribe" id="clothesDescribe" class="form-control" value="${clothes.clothesDescribe}"/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label   class="col-sm-1 control-label">用户id</label>
				<div class="col-sm-6">
					<input name="userId" id="userId" class="form-control" value="${clothes.userId}"/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label   class="col-sm-1 control-label">申请id</label>
				<div class="col-sm-6">
					<input name="applyId" id="applyId" class="form-control" value="${clothes.applyId}"/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label   class="col-sm-1 control-label">备注</label>
				<div class="col-sm-6">
					<input name="remark" id="remark" class="form-control" value="${clothes.remark}"/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label   class="col-sm-1 control-label">大小</label>
				<div class="col-sm-6">
					<input name="size" id="size" class="form-control" value="${clothes.size}"/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label   class="col-sm-1 control-label">颜色</label>
				<div class="col-sm-6">
					<input name="color" id="color" class="form-control" value="${clothes.color}"/>
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