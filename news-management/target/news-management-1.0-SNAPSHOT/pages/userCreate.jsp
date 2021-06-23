<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户注册</title>
</head>
<body>
<form name="registerFrm" id="registerFrm" action="<%=request.getContextPath()%>/DoRegisterServlet" method="post">
	<table class="tb" border="0" cellspacing="5" cellpadding="0" align="center">
		<tr><td align="center" colspan="2" style="text-align:center;" class="text_tabledetail2">用户注册</td></tr>
		<tr>
			<td class="text_tabledetail2">账号</td>
			<td><input type="text" name="username" value=""/></td>
		</tr>
		<span>
			<%
				String not_null = (String) request.getAttribute("duplicate_username");
				if (not_null != null) {
					out.print(not_null);
				}

			%>

		</span>
		<tr>
			<td class="text_tabledetail2">密码</td>
			<td><input type="password" name="password" value=""/></td>
		</tr>
		<span>
			<%
				String not_null2 = (String) request.getAttribute("username_password_not_null");
				if (not_null2 != null) {
					out.print(not_null2);
				}

			%>
		</span>
		<tr>
			<td class="text_tabledetail2">确认密码</td>
			<td><input type="password" name="con_password" value=""/></td>
		</tr>
		<tr>
			<td class="text_tabledetail2">email</td>
			<td><input type="text" name="email" value=""/></td>
		</tr>
		<tr>
			<td style="text-align:center;" colspan="2">				
				<button type="submit" class="page-btn" name="save">注册</button>
				<button type="button" class="page-btn" name="return" onclick="javascript:location.href='<%=request.getContextPath() %>/index.jsp'">返回</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
