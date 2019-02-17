<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册界面</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
<link href="${adminPath }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${adminPath }/static/login/iconfont/style.css" type="text/css" rel="stylesheet">
<style>
	body{color:#fff; font-family:"微软雅黑"; font-size:14px;}
	.wrap1{position:absolute; top:0; right:0; bottom:0; left:0; margin:auto }/*把整个屏幕真正撑开--而且能自己实现居中*/
	.main_content{background:url(${ctxStatic }/login/images/main_bg.png) repeat; margin-left:auto; margin-right:auto; text-align:left; float:none; border-radius:8px;}
	.form-group{position:relative;}
	.login_btn{display:block; background:#3872f6; color:#fff; font-size:15px; width:100%; line-height:50px; border-radius:3px; border:none; }
	.login_input{width:100%; border:1px solid #3872f6; border-radius:3px; line-height:40px; padding:2px 5px 2px 30px; background:none;}
	.login_input2{width:50%; border:1px solid #3872f6; border-radius:3px; line-height:40px; padding:2px 5px 2px 30px; background:none;}
	.icon_font{position:absolute; bottom:15px; left:10px; font-size:18px; color:#3872f6;}
	.font16{font-size:16px;}
	.mg-t20{margin-top:20px;}
	@media (min-width:200px){.pd-xs-20{padding:20px;}}
	@media (min-width:768px){.pd-sm-50{padding:50px;}}
	#grad {
	  background: -webkit-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Safari 5.1 - 6.0 */
	  background: -o-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Opera 11.1 - 12.0 */
	  background: -moz-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Firefox 3.6 - 15 */
	  background: linear-gradient(#4990c1, #52a3d2, #6186a3); /* 标准的语法 */
	}
</style>
    <script type="text/javascript">
        function loadimage(){
            document.getElementById("randImage").src = "${adminPath }/static/image.jsp?"+Math.random();
        }
    </script>
</head>

<body style="background:url(${ctxStatic }/login/images/bg.jpg) no-repeat;">
    
    <div class="container wrap1" style="height:650px;">
            <h2 class="mg-b20 text-center">衣物捐赠系统</h2>
            <div class="col-sm-8 col-md-5 center-auto pd-sm-50 pd-xs-20 main_content">
                <p class="text-center font16">注册</p>
                <form action="${adminPath }/sys/user/doRegister" method="post">
                    <div class="form-group mg-t20">
                        <i class="icon-data icon_font"></i>
                        <input type="text" class="login_input" id="username" name="username" value="${username }" placeholder="请输入用户名" />
                    </div>
                    <div class="form-group mg-t20">
                        <i class="icon-data icon_font"></i>
                        <input type="text" class="login_input" id="trueName" name="trueName" value="${trueName }" placeholder="请输入真实姓名" />
                    </div>
                    <div class="form-group mg-t20">
                        <i class="icon-user icon_font"></i>
                        <%--<input type="text" class="login_input" id="username" name="username" value="${username }" placeholder="请输入用户名" />--%>
                        <input type="text" class="login_input" id="phone" name="phone" value="${phone }" placeholder="请输入电话号码" />
                    </div>
                    <div class="form-group mg-t20">
                        <i class="icon-lock icon_font"></i>
                        <input type="password" class="login_input" id="password" name="password" value="${password }" placeholder="请输入密码" />
                    </div>
                    <div class="form-group mg-t20">
                        <i class="icon-lock icon_font"></i>
                        <input type="password" class="login_input" id="password1" name="password1" value="${password1 }" placeholder="请再次输入密码" />
                    </div>
                    <div class="form-group mg-t10">
                        <i class="icon-data icon_font"></i>
                        <input type="text" class="login_input2" id="yzm" name="yzm" value="${imageCode }" placeholder="请输入验证码" />
                        <%--<input  class="text" style="width: 60px;margin-right: 10px;"--%>
                                <%--type=text value="${imageCode }" name="imageCode" id="imageCode">--%>
                        <img
                                onclick="javascript:loadimage();" title="换一张试试" name="randImage"
                                id="randImage" src="${adminPath }/static/image.jsp" width="60" height="20" border="1"
                                align="absmiddle">
                        <%--<input type="text" class="login_input" id="yzm" name="" value="${password }" placeholder="请输入验证码" />--%>
                    </div>

                    <div class="form-group mg-t20">
                       <span style="color: red;">${msg }</span>
                    </div>
                    <button style="submit" class="login_btn">注 册</button>
                    <br>
                    <p>
                        <a href="${adminPath}/sys/user/login">
                            已有经理账号 登录
                        </a>
                    </p>
               </form>
        </div><!--row end-->
    </div><!--container end-->
           
</body>
</html>