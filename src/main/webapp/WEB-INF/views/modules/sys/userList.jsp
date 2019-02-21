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
		function page(n){
			$("#pageNum").val(n);
			$("#searchForm").submit();
	       	return false;
	       }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${adminPath}/userList">系统用户列表</a></li>
		<li><a href="${adminPath}/form">用户添加</a></li>
	</ul><br>
	<form id="searchForm" action="${adminPath}/userList" method="post" class="form-horizontal">
		<input id="pageNum" name="pageNum" type="hidden" value="${pageInfo.pageNum}"/>
		<div class="form-group">
				<div class="col-sm-1">
   					<input id="username" name="username" class="form-control input-sm" placeholder="用户名"/>
   				</div>
				<div class="col-sm-1">
   					<input id="phone" name="phone" class="form-control input-sm" placeholder="电话"/>
   				</div>
			<button class="btn btn-success btn-sm" type="submit">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				查询
			</button>
		</div>
	<form>
	<c:if test="${msg!=null}">
	<div class="alert alert-info alert-dismissible" role="alert">
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	  <strong>提示!</strong> ${msg}.
	</div>
	</c:if>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th>用户名</th>
				<th>电话</th>
				<th>类型</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${pageInfo.list}" var="user"  varStatus="index_no">
			<tr>
				<td>${index_no.index+1+(pageInfo.pageNum-1)*pageInfo.pageSize }</td>
				<td><a href="${adminPath}/form?id=${user.id}">
					${user.username}
				</a></td>
				<td>
					${user.phone}
				</td>
				<td>
					<c:if test="${user.type=='1'}">管理员</c:if>
					<c:if test="${user.type!='1'}">普通用户</c:if>
				</td>
				<td>
					${user.createTime}
					<%--<fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>--%>
				</td>
				<td>
    				<a href="${adminPath}/form?id=${user.id}">
    					<%--<button class="btn btn-primary btn-xs" ><span class="glyphicon glyphicon-pencil" ></span>--%>
							编辑
						<%--</button>--%>
    				</a>
					<a href="${adminPath}/user/delete?id=${user.id}" onclick="return confirm('确认要删除吗？', this.href)">
						<%--<button class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span>--%>
							删除
						<%--</button>--%>
					</a>
				</td>
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
					<li><a href="javascript:void(0);" onclick="page('1');">首页</a></li>
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