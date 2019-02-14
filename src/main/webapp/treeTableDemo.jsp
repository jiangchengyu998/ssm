<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>系统用户管理</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			var option = {
			        theme:'default',
			        expandLevel : 2,
			        beforeExpand : function($treeTable, id) {
			            //判断id是否已经有了孩子节点，如果有了就不再加载，这样就可以起到缓存的作用
			            if ($('.' + id, $treeTable).length) { return; }
			           /*  //这里的html可以是ajax请求
			            var html = '<tr id="8" pId="6"><td>5.1</td><td>可以是ajax请求来的内容</td></tr>'
			                     + '<tr id="9" pId="6"><td>5.2</td><td>动态的内容</td></tr>';

			            $treeTable.addChilds(html); */
			        },
			        onSelect : function($treeTable, id) {
			            window.console && console.log('onSelect:' + id);
			        }

			    };
			    $('#treeTable1').treeTable(option);
		});
	</script>
</head>
<body>
	<table id="treeTable1" class="table" style="width:100%">
    <tr>
        <td style="width:200px;">标题</td>
        <td>内容</td>
    </tr>
    <tr id="1">
        <td><span controller="true">1</span></td>
        <td>内容</td></tr>
    <tr id="2" pId="1">
        <td><span controller="true">2</span></td>
        <td>内容</td></tr>
    <tr id="3" pId="2">
        <td>3</td>
        <td>内容</td>
    </tr>
    <tr id="4" pId="2">
        <td>4</td>
        <td>内容</td>
    </tr>
    <tr id="5" pId="4">
        <td>4.1</td>
        <td>内容</td>
    </tr>
    <tr id="6" pId="1" hasChild="true">
        <td>5</td>
        <td>注意这个节点是动态加载的</td>
    </tr>
    <tr id="7" pId="0">
        <td>8</td>
        <td>内容</td>
    </tr>
</table>
</body>
</html>