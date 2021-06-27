<%--
    author: 悟空非空也（B站/知乎/公众号） 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="header">
    <div class="main-top">
        <div class="logo"><a href=""><span>新闻后台界面</span></a></div>


    </div>

    <!--管理工具栏-->
    <div class="admin-bar">
        <span class="fr"><a href="<%=request.getContextPath() %>/LogoutAdminServlet">退出账户</a></span>
        <%
            User adminUser = (User) session.getAttribute(Constant.ADMIN_USER_SESSION);
            if (adminUser != null) {
        %>
        管理员：<%=adminUser.getUsername()%>
        <%
            } else {
                out.print("请管理员登录！");
            }
        %>
    </div>
</div>