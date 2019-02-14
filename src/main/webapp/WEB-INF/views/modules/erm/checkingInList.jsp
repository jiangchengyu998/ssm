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
		function page(n){
			$("#pageNo").val(n);
			$("#searchForm").submit();
	       	return false;
	       }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${adminPath}/erm/checkingIn/">考勤管理列表</a></li>
		<c:if test="${login.role!='3'}"><li><a href="${adminPath}/erm/checkingIn/form">考勤管理添加</a></li></c:if>
	</ul><br>
	<form:form id="searchForm" modelAttribute="checkingIn" action="${adminPath}/erm/checkingIn/" method="post" class="form-horizontal">
		<input id="pageNo" name="pageNo" type="hidden" value="${pageInfo.pageNum}"/>
		<div class="form-group">
			<label for="firstname" class="col-sm-1 control-label">状态：</label>
			<div class="col-sm-2">
				<form:select path="status" class="form-control ">
					<form:option value="">请选择</form:option>
					<form:option value="0">旷工</form:option>
					<form:option value="1">正常</form:option>
					<form:option value="2">迟到</form:option>
					<form:option value="3">早退</form:option>
				</form:select>
			</div>
			<label for="firstname" class="col-sm-1 control-label">打卡月份：</label>
				<div class="col-sm-2">
					<form:select path="month" class="form-control ">
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
			<label for="firstname" class="col-sm-1 control-label">打卡年份：</label>
				<div class="col-sm-2">
					<input name="year" id="year" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy',isShowClear:false});" value="${checkingIn.year }">
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
				<th>状态</th>
				<th>打卡时间</th>
				<th>打卡月份</th>
				<th>打卡年份</th>
				<th>备注</th>
				<th>用户名</th>
				<th>真实姓名</th>
				<c:if test="${login.role!='3'}"><th>操作</th></c:if>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${pageInfo.list}" var="checkingIn"  varStatus="index_no">
			<tr>
				<td>${index_no.index+1+(pageInfo.pageNum-1)*pageInfo.pageSize }</td>
				<td>
					<a href="${adminPath}/erm/checkingIn/form?id=${checkingIn.id}">
					<c:choose>
						<c:when test="${checkingIn.status =='0'}">
							旷工
						</c:when>
						<c:when test="${checkingIn.status =='1'}">
							正常
						</c:when>
						<c:when test="${checkingIn.status =='2'}">
							迟到
						</c:when>
						<c:when test="${checkingIn.status =='3'}">
							早退
						</c:when>
					</c:choose>
					</a>
				</td>
				<td>
					<fmt:formatDate value="${checkingIn.clockTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${checkingIn.month}
				</td>
				<td>
					${checkingIn.year}
				</td>
				<td>
					${checkingIn.remark}
				</td>
				<td>
						${checkingIn.userName}
				</td>
				<td>
						${checkingIn.trueName}
				</td>
				<c:if test="${login.role!='3'}">
				<td>
    				<a href="${adminPath}/erm/checkingIn/form?id=${checkingIn.id}">
    					<button class="btn btn-primary btn-xs" ><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							编辑
						</button>
    				</a>
					<a href="${adminPath}/erm/checkingIn/delete?id=${checkingIn.id}" onclick="return confirm('确认要删除吗？', this.href)">
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