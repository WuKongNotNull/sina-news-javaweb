<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户注册</title>
</head>
<body>
<form name="registerFrm" id="registerFrm" action="<%= request.getContextPath() %>/doRegisterServlet" method="post">
	<table  border="1"  align="center">
		<tr><td align="center" colspan="2" style="text-align:center;">用户注册</td></tr>
		<tr>
			<td>用户名</td>
			<td><input type="text" name="username" value=""/></td>
		</tr>
		<tr>
			<td>密码</td>
			<td><input type="password" name="password" value=""/></td>
		</tr>
		<tr>
			<td class="">确认密码</td>
			<td><input type="password" name="con_password" value=""/></td>
		</tr>
		<tr>
			<td class="">email</td>
			<td><input type="text" name="email" value=""/></td>
		</tr>
		<tr>
			<td style="text-align:center;" colspan="2">				
				<button type="submit" class="page-btn" name="save">注册</button>
				<button type="button" class="page-btn" name="return" onclick="javascript:location.href='<%=request.getContextPath() %>/index.jsp'">返回</button>
			</td>
		</tr>
	</table>
	<%
	Object oMess=request.getAttribute("mess");
	if(oMess!=null)
		out.print(oMess.toString());
	%>
	<%out.println(session.getId()); %>
</form>
</body>
</html>
