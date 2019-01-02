<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%><html>
<head>
    <title>图书列表</title>
    <script type="text/javascript">
        function bookDetail(bookId) {
            window.location.href = '${pageContext.request.contextPath }/book/'+bookId+'/detail';
        }
    </script>
</head>
<body>

<table>
    <thead>
        <th>id</th>
        <th>name</th>
        <th>number</th>
        <th>查看详情</th>
    </thead>
    <c:forEach items="${list}" var="book">
        <tr>
            <td>${book.bookId}</td>
            <td>${book.name}</td>
            <td>${book.number}</td>
            <td><input type="button" onclick="bookDetail('${book.bookId}')" value="查看详情"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
