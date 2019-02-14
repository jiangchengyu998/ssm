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
		function page(n){
			$("#pageNo").val(n);
			$("#searchForm").submit();
	       	return false;
	       }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${adminPath}/erm/salary/">薪资管理列表</a></li>
	<c:if test="${login.role!='3'}">
		<li><a href="${adminPath}/erm/salary/form">薪资管理添加</a></li>
	</c:if>

	</ul><br>
	<form:form id="searchForm" modelAttribute="salary" action="${adminPath}/erm/salary/" method="post" class="form-horizontal">
		<input id="pageNo" name="pageNo" type="hidden" value="${pageInfo.pageNum}"/>
		<div class="form-group">
			<label for="firstname" class="col-sm-1 control-label">工资年份：</label>
				<div class="col-sm-2">
					<input name="salaryYear" id="salaryYear" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy',isShowClear:false});" value="${checkingIn.year }">
				</div>
			<label for="firstname" class="col-sm-1 control-label">工资月份：</label>
			<div class="col-sm-2">
				<form:select path="salaryMonth" class="form-control ">
					<form:option value="">请选择</form:option>
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
			<c:if test="${login.role!='3'}">
				<label for="firstname" class="col-sm-1 control-label">用户名称：</label>
				<div class="col-sm-2">
					<form:input path="userName" htmlEscape="false" class="form-control input-sm" placeholder="用户名或者真实姓名"/>
				</div>
			</c:if>
			<button class="btn btn-success" type="submit">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				查询
			</button>
			<%--<a href="${adminPath}/erm/salary/createSalary">--%>
					<%--生成工资--%>
			<%--</a>--%>
		</div>
	</form:form>
	<c:if test="${msg!=null}">
	<div class="alert alert-info alert-dismissible" role="alert">
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	  <strong>提示!</strong>${msg}
	</div>
	</c:if>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th>基本工资</th>
				<th>奖金</th>
				<th>扣款</th>
				<th>应发工资</th>
				<th>实发工资</th>
				<th>工资年份</th>
				<th>月份</th>
				<th>是否下发</th>
				<th>备注</th>
				<th>用户名</th>
				<th>真实姓名</th>
			<c:if test="${login.role!='3'}">
				<th>操作</th>
			</c:if>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${pageInfo.list}" var="salary"  varStatus="index_no">
			<tr>
				<td>${index_no.index+1+(pageInfo.pageNum-1)*pageInfo.pageSize }</td>
				<td><a href="${adminPath}/erm/salary/form?id=${salary.id}">
					${salary.basicSalary}
				</a></td>
				<td>
					${salary.bonus}
				</td>
				<td>
					${salary.cutSalary}
				</td>
				<td>
					${salary.totalPaySalary}
				</td>
				<td>
					${salary.salary}
				</td>
				<td>
					${salary.salaryYear}
				</td>
				<td>
					${salary.salaryMonth}
				</td>
				<td>
					${salary.ifSendOut}
				</td>
				<td>
					${salary.remark}
				</td>
				<td>
					${salary.userName}
				</td>
				<td>
					${salary.trueName}
				</td>
				<c:if test="${login.role!='3'}">
				<td>
    				<a href="${adminPath}/erm/salary/form?id=${salary.id}">
    					<button class="btn btn-primary btn-xs" ><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							编辑
						</button>
    				</a>
					<a href="${adminPath}/erm/salary/delete?id=${salary.id}" onclick="return confirm('确认要删除吗？', this.href)">
						<button class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							删除
						</button>
					</a>
				</td>
				</c:if>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<!-- 分页条 -->
	<!-- 显示分页信息 -->
	<div class="row">
		<!--分页文字信息  -->
		<div class="col-md-6">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
			页,总 ${pageInfo.total } 条记录</div>
		<!-- 分页条信息 -->
		<div class="col-md-6">
			<nav aria-label="Page navigation">
			<ul class="pagination">
				<li><a href="javascript:void(0);" onclick="page(${pageInfo.pageNum-1});">首页</a></li>
				<c:if test="${pageInfo.hasPreviousPage }">
					<li><a href="javascript:void(0);" onclick="page(${pageInfo.pageNum-1});"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>


				<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
					<c:if test="${page_Num == pageInfo.pageNum }">
						<li class="active"><a href="#">${page_Num }</a></li>
					</c:if>
					<c:if test="${page_Num != pageInfo.pageNum }">
						<li><a href="javascript:void(0);" onclick="page(${page_Num});">${page_Num }</a></li>
					</c:if>

				</c:forEach>
				<c:if test="${pageInfo.hasNextPage }">
					<li><a href="javascript:void(0);" onclick="page(${pageInfo.pageNum+1 });"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
				<li><a href="javascript:void(0);" onclick="page(${pageInfo.pages });">末页</a></li>
			</ul>
			</nav>
		</div>
	</div>
</body>
</html>