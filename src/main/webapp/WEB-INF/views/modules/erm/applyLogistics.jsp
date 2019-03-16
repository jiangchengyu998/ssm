<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<jsp:useBean id="apply" class="com.ssm.entity.TApply" scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>填写物流信息</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a>填写物流信息</a></li>
	</ul>
	<br>
	<form:form id="inputForm" modelAttribute="apply" action="${adminPath}/apply/save" method="post" class="form-horizontal">
		<input type="hidden" value="${id}" name="id" id="id"/>

		<%--状态（0-用户申请，1-管理员同意（等待用户寄送衣服），2-用户已经寄出衣服，3-管理员收到衣服并且回执。4-不同意）--%>
		<input type="hidden" value="2" name="status" id="status"/>

		<div class="form-group" id="roleSelect">
			<label for="typeId" class="col-sm-1 control-label">物流公司</label>
			<div class="col-sm-6">
				<input name="logisticsNumber" id="logisticsNumber" class="form-control" />
			</div>
		</div>

		<div class="form-group" id="roleSelect">
			<label   class="col-sm-1 control-label">物流单号</label>
			<div class="col-sm-6">
				<input name="logisticsCompany" id="logisticsCompany" class="form-control" />
			</div>
		</div>
			
			<button class="btn btn-success" type="submit">保 存</button>
			<button class="btn btn-inf" type="button" onclick="javascript:history.go(-1);">返 回</button>
	</form:form>
</body>
</html>