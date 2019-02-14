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
		<li><a href="${adminPath}/erm/salary/">薪资管理列表</a></li>
		<li class="active"><a href="${adminPath}/erm/salary/form?id=${salary.id}">薪资管理新增</a></li>
	</ul><br>
	<form:form id="inputForm" modelAttribute="salary" action="${adminPath}/erm/salary/save" method="post" class="form-horizontal" >
		<form:hidden path="id"/>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">基本工资</label>
   				<div class="col-sm-6">
			
						<form:input path="basicSalary" htmlEscape="false" class="form-control  number"/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">奖金</label>
   				<div class="col-sm-6">
			
						<form:input path="bonus" htmlEscape="false" class="form-control  number"/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">扣款</label>
   				<div class="col-sm-6">
			
						<form:input path="cutSalary" htmlEscape="false" class="form-control  number"/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">应发工资</label>
   				<div class="col-sm-6">
			
						<form:input path="totalPaySalary" htmlEscape="false" class="form-control  number"/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">实发工资</label>
   				<div class="col-sm-6">
			
						<form:input path="salary" htmlEscape="false" class="form-control  number"/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">工资年份</label>
   				<div class="col-sm-6">
			
						<form:input path="salaryYear" htmlEscape="false" maxlength="50" class="form-control "/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">工资月份</label>
   				<div class="col-sm-6">
			
						<form:input path="salaryMonth" htmlEscape="false" maxlength="50" class="form-control "/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">是否下发</label>
   				<div class="col-sm-6">
			
						<form:input path="ifSendOut" htmlEscape="false" maxlength="11" class="form-control  digits"/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">备注</label>
   				<div class="col-sm-6">
			
						<form:input path="remark" htmlEscape="false" maxlength="500" class="form-control "/>
				</div>
			</div>

			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">用户</label>
				<div class="col-sm-6">
					<form:select path="userId" class="form-control ">
						<form:options items="${emps }" itemLabel="trueName" itemValue="id"/>
					</form:select>
				</div>
			</div>
			<button class="btn btn-success" type="submit">保 存</button>
			<button class="btn btn-inf" type="button" onclick="javascript:history.go(-1);">返 回</button>
	</form:form>
</body>
</html>