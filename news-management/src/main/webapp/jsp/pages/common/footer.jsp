<%@ page contentType="text/html; charset=UTF-8" %>
<!--页面底部-->
<%
    // 统计网页被点击量是多少 application
    // out  request response session application page pageContext config  exception 成为jsp的内置对象
    // request session application page  当做存储空间： setAttribute()/ getAttribute() ； 生命周期和作用域
    Integer count = (Integer) application.getAttribute("countKey");

    if (count == null) {
        // 当首次访问该页面
        count = 1;
    } else {
        count += 1;

    }
    application.setAttribute("countKey", count);

%>
<div id="footer" class="main-footer-box">
    24小时客户服务热线：010-12345678 常见问题解答 新闻热线：010-12345678<br/>
    文明办网文明上网举报电话：010-010-12345678 举报邮箱：1390128154@qq.com<br/>
    CopyRight&copy;2021-2099 News China gov,All Right Reserved.<br/>
    新闻中心版权所有
    网站首页访问量：<span><%= (Integer) application.getAttribute("countKey") %></span>
</div>
