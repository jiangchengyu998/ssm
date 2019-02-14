<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>考勤管理管理</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${adminPath}/erm/checkingIn/">考勤管理列表</a></li>
		<li class="active"><a href="${adminPath}/erm/checkingIn/form?id=${checkingIn.id}">考勤管理新增</a></li>
	</ul><br>
	<form:form id="inputForm" modelAttribute="checkingIn" action="${adminPath}/erm/checkingIn/save" method="post" class="form-horizontal" >
		<form:hidden path="id"/>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">状态</label>
   				<div class="col-sm-6">
					<form:select path="status" class="form-control ">
						<form:option value="1">正常</form:option>
						<form:option value="0">旷工</form:option>
						<form:option value="2">迟到</form:option>
						<form:option value="3">早退</form:option>
					</form:select>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">打卡时间</label>
   				<div class="col-sm-6">
			
						<input name="clockTimeStr" type="text" readonly="readonly" maxlength="20" class="form-control Wdate "
							value="<fmt:formatDate value="${checkingIn.clockTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">打卡月份</label>
   				<div class="col-sm-6">
						<form:select path="month" class="form-control ">
							<form:option value="01">一月</form:option>
							<form:option value="02">二月</form:option>
							<form:option value="03">三月</form:option>
							<form:option value="04">四月</form:option>
							<form:option value="05">五月</form:option>
							<form:option value="06">六月</form:option>
							<form:option value="07">七月</form:option>
							<form:option value="08">八月</form:option>
							<form:option value="09">九月</form:option>
							<form:option value="10">十月</form:option>
							<form:option value="11">十一月</form:option>
							<form:option value="12">十二月</form:option>
						</form:select>
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">打卡年份</label>
   				<div class="col-sm-6">
					<input name="year" id="year" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy',isShowClear:false});" value="${checkingIn.year }">
				</div>
			</div>
			
			<div class="form-group" id="roleSelect">
				<label for="firstname" class="col-sm-1 control-label">备注</label>
   				<div class="col-sm-6">
					<form:textarea path="remark" class="form-control "/>
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