<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>衣物管理</title>
    <%@include file="/WEB-INF/views/include/head.jsp" %>
    <script type="text/javascript">
        $(document).ready(function () {

        });

        function page(n) {
            $("#pageNum").val(n);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${adminPath}/clothes">衣物管理列表</a></li>
    <li><a href="${adminPath}/clothes/form">衣物添加</a></li>
</ul>
<br>
<form id="searchForm" modelAttribute="cloth" action="${adminPath}/clothes" method="post" class="form-horizontal">
    <input id="pageNum" name="pageNum" type="hidden" value="${pageInfo.pageNum}"/>
    <div class="form-group">
        <label class="col-sm-1 control-label">颜色：</label>
        <div class="col-sm-2">
            <input name="salaryYear" id="salaryYear" readonly="readonly"
                   onclick="WdatePicker({dateFmt:'yyyy',isShowClear:false});" value="${checkingIn.year }">
        </div>
        <label class="col-sm-1 control-label">用户名称：</label>
        <div class="col-sm-2">
            <input path="userName" htmlEscape="false" class="form-control input-sm" placeholder="用户名或者真实姓名"/>
        </div>
        <button class="btn btn-success" type="submit">
            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
            查询
        </button>
    </div>
</form>
<c:if test="${msg!=null}">
    <div class="alert alert-info alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <strong>提示!</strong>${msg}
    </div>
</c:if>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>衣服类型</th>
        <th>描述</th>
        <th>所属用户</th>
        <%--<th>申请id</th>--%>
        <th>备注</th>
        <th>大小</th>
        <th>颜色</th>
        <%--<c:if test="${login.role!='3'}">--%>
        <th>操作</th>
        <%--</c:if>--%>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageInfo.list}" var="cloth" varStatus="index_no">
        <tr>
            <td>${index_no.index+1+(pageInfo.pageNum-1)*pageInfo.pageSize }</td>
            <td><a href="${adminPath}/clothes/form?id=${cloth.id}">
                    ${cloth.typeId}
            </a></td>
            <td>
                    ${cloth.clothesDescribe}
            </td>
            <td>
                    ${cloth.userId}
            </td>
            <%--<td>--%>
                    <%--${cloth.applyId}--%>
            <%--</td>--%>
            <td>
                    ${cloth.remark}
            </td>
            <td>
                    ${cloth.size}
            </td>
            <td>
                    ${cloth.color}
            </td>
                <%--<c:if test="${login.role!='3'}">--%>
            <td>
                <a href="${adminPath}/clothes/form?id=${cloth.id}">
                    编辑
                </a>
                <a href="${adminPath}/clothes/delete?id=${cloth.id}" onclick="return confirm('确认要删除吗？', this.href)">
                    删除
                </a>
            </td>
                <%--</c:if>--%>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- 分页条 -->
<!-- 显示分页信息 -->
<div class="row">
    <!--分页文字信息  -->
    <div class="col-md-6">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
        页,总 ${pageInfo.total } 条记录
    </div>
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