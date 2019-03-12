<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<jsp:useBean id="apply" class="com.ssm.entity.TApply" scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>我的捐赠申请</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${adminPath}/apply">我的捐赠申请</a></li>
		<li class="active"><a href="${adminPath}/apply/form">爱心申请</a></li>
	</ul>
	<br>
	<form:form id="inputForm" modelAttribute="apply" action="${adminPath}/apply/save" method="post" class="form-horizontal">
		<input type="hidden" value="${apply.id}" name="id" id="id"/>

		<div class="form-group" id="roleSelect">
			<label for="typeId" class="col-sm-1 control-label">裤子数量</label>
			<div class="col-sm-6">
				<input name="pantsNum" id="pantsNum" class="form-control" value="${apply.pantsNum}"/>
			</div>
		</div>

		<div class="form-group" id="roleSelect">
				<label   class="col-sm-1 control-label">衣服数量</label>
				<div class="col-sm-6">
					<input name="clothesNum" id="clothesNum" class="form-control" value="${apply.clothesNum}"/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label   class="col-sm-1 control-label">备注</label>
				<div class="col-sm-6">
					<input name="remark" id="remark" class="form-control" value="${apply.remark}"/>
				</div>
			</div>
			
			<button class="btn btn-success" type="submit">保 存</button>
			<button class="btn btn-inf" type="button" onclick="javascript:history.go(-1);">返 回</button>
	</form:form>
</body>
</html>