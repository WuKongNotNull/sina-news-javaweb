<%@ page import="com.wukong.pojo.User" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!--页面顶部-->
<div id="header">
    <div class="main-top">
        <div class="logo"><a href=""><span>新浪新闻平台</span></a></div>
        <span id="top">
            <%
                User user = (User) session.getAttribute("userKey");
                if (user != null) {
                    out.print("欢迎您，  " + user.getUsername());
                } else {
                    out.print("请登录");
                }


            %>
        </span>
        <div class="login-box">
            <%
                String username = "";
                String password = "";
                Cookie[] cookies = request.getCookies();
                if (cookies != null && cookies.length > 0) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("usernameKey")) {
                            username = cookie.getValue();
                        }
                        if (cookie.getName().equals("passwordKey")) {
                            password = cookie.getValue();
                        }
                    }
                }

            %>
            <form action="<%=request.getContextPath()%>/LoginServlet" method="post">
                <label for="usernameId">用户名<input id="usernameId" type="text" name="uname" value="<%= username %>"
                                                  placeholder="请输入用户名"/></label>
                <label for="passwordId">密码<input id="passwordId" type="password" name="upassword" value="<%=password %>"
                                                 placeholder="请输入密码"/></label>
                <button type="submit"> 登录</button>
                <label><input type="checkbox" name="rememberMe" value="1">记住我</label>
                <%--登录时候，用户名和密码不能为空--%>
                <label><%
                    String login_not_null = (String) request.getAttribute("login_username_password_not_null");
                    if (login_not_null != null) {
                        out.print(login_not_null);
                    }
                %></label>
            </form>


        </div>

        <div class="nav">
            <ul class="clearfix">
                <li><a href="#">首页</a></li>
                <li><a href="#">新浪博客</a></li>
                <li><a href="#">新浪微博</a></li>
                <li><a href="<%= request.getContextPath()  %>/jsp/pages/userCreate.jsp" target="_blank">用户注册</a></li>
                <li><a href="<%= request.getContextPath() %>/LogoutServlet">用户退出</a></li>
            </ul>
        </div>
    </div>
    <!--banner-->
    <div class="main-banner">
        <img alt="加载失败" src="<%=request.getContextPath() %>/images/banner.png"/>
    </div>
    <!--搜索横框-->
    <div class="search-box">
        <div class="sl">
            <div class="sr clearfix">

                <span class="left-search clearfix">
                    <label for="searchId">站内搜索<input id="searchId" type="text" name="keyword" value="关键词"/></label><button
                        class="go-btn"></button>
                </span>
                <span class="right-link">
                    <label for="selectId">快速链接<select id="selectId"><option>-----专题选择-----</option></select></label><button
                        class="go-btn"></button>
                </span>

            </div>
        </div>
    </div>
</div>
