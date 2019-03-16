<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <c:choose>
        <c:when test="${login.type == '1'}">
            <title>捐赠申请管理</title>
        </c:when>
        <c:otherwise>
            <title>我的捐赠申请</title>
        </c:otherwise>
    </c:choose>
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
    <c:choose>
        <c:when test="${login.type == '1'}">
            <li class="active"><a href="${adminPath}/apply">捐赠申请管理</a></li>
        </c:when>
        <c:otherwise>
            <li class="active"><a href="${adminPath}/apply">我的捐赠申请</a></li>
            <li><a href="${adminPath}/apply/form">爱心申请</a></li>
        </c:otherwise>
    </c:choose>

</ul>
<br>
<form id="searchForm" modelAttribute="apply" action="${adminPath}/apply" method="post" class="form-horizontal">
    <%--<input id="pageNum" name="pageNum" type="hidden" value="${pageInfo.pageNum}"/>--%>
    <%--<div class="form-group">--%>
        <%--<label class="col-sm-1 control-label">颜色：</label>--%>
        <%--<div class="col-sm-2">--%>
            <%--<input name="salaryYear" id="salaryYear" readonly="readonly"--%>
                   <%--onclick="WdatePicker({dateFmt:'yyyy',isShowClear:false});" value="${checkingIn.year }">--%>
        <%--</div>--%>
        <%--<label class="col-sm-1 control-label">用户名称：</label>--%>
        <%--<div class="col-sm-2">--%>
            <%--<input path="userName" htmlEscape="false" class="form-control input-sm" placeholder="用户名或者真实姓名"/>--%>
        <%--</div>--%>
        <%--<button class="btn btn-success" type="submit">--%>
            <%--<span class="glyphicon glyphicon-search" aria-hidden="true"></span>--%>
            <%--查询--%>
        <%--</button>--%>
    <%--</div>--%>
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
        <th>裤子数量</th>
        <th>衣服数量</th>
        <th>用户</th>
        <th>状态</th>
        <th>物流单号</th>
        <th>物流公司</th>
        <th>备注</th>
        <th>申请时间</th>
        <th>更新时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageInfo.list}" var="apply" varStatus="index_no">
        <tr>
            <td>${index_no.index+1+(pageInfo.pageNum-1)*pageInfo.pageSize }</td>
            <td>  <!--<a href="${adminPath}/apply/form?id=${apply.id}"></a> -->
                    ${apply.pantsNum}
            </td>
            <td>
                    ${apply.clothesNum}
            </td>
            <td>
                    ${apply.username}
            </td>
            <td>
                <%--（0-用户申请，1-管理员同意（等待用户寄送衣服），2-用户已经寄出衣服，3-管理员收到衣服并且回执。）--%>
                <c:choose>
                    <c:when test="${apply.status == '0'}">用户申请</c:when>
                    <c:when test="${apply.status == '1'}">管理员同意申请</c:when>
                    <c:when test="${apply.status == '2'}">已经寄出衣服</c:when>
                    <c:when test="${apply.status == '3'}">管理员收到衣服并且回执</c:when>
                </c:choose>
            </td>
            <td>
                    ${apply.logisticsNumber}
            </td>
            <td>
                    ${apply.logisticsCompany}
            </td>
            <td>
                    ${apply.remark}
            </td>
            <td>
                    ${apply.applyTime}
            </td>
            <td>
                    ${apply.updateTime}
            </td>
            <td>
                <c:if test="${apply.status != '3'}">
                    <a href="${adminPath}/apply/form?id=${apply.id}">
                        编辑
                    </a>
                </c:if>
                <%--状态（0-用户申请，1-管理员同意（等待用户寄送衣服），2-用户已经寄出衣服，3-管理员收到衣服并且回执。4-不同意）--%>
                <c:if test="${apply.status == '1'}">
                    <c:if test="${login.type == '0'}">
                        <a href="${adminPath}/apply/applyLogistics?id=${apply.id}">
                            填写物流信息
                        </a>
                    </c:if>
                </c:if>
                <c:if test="${apply.status == '2'}">
                    <c:if test="${login.type == '1'}">
                        <a href="${adminPath}/apply/agree?id=${apply.id}&receive=1" onclick="return confirm('确认收到收到衣服了吗？', this.href)">
                            收到衣服并回执
                        </a>
                    </c:if>
                </c:if>
                <c:if test="${apply.status == '0'}">
                    <c:if test="${login.type == '1'}">
                        <a href="${adminPath}/apply/agree?id=${apply.id}" onclick="return confirm('确认同意申请吗？', this.href)">
                            同意申请
                        </a>
                    </c:if>
                </c:if>
                <a href="${adminPath}/apply/delete?id=${apply.id}" onclick="return confirm('确认要删除吗？', this.href)">
                    删除
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