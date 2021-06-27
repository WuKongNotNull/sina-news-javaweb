<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>后台登录页面</title>
</head>
<body>
<div align="center">
    <h1>后台管理员登录</h1>
    <form action="<%=request.getContextPath()%>/AdminLoginServlet" method="post">
        <p><label for="usernameId">用户名<input id="usernameId" type="text" name="username" value=""
                                             placeholder="请输入用户名"/></label></p>
        <p><label for="passwordId">密码<input id="passwordId" type="password" name="password" value=""
                                            placeholder="请输入密码"/></label></p>
        <button type="submit"> 登录</button>
        <label><input type="checkbox" name="rememberMe" value="1">记住我</label>
    </form>
</div>
</body>
</html>
