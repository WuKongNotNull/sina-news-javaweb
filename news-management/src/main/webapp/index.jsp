<%@ page import="com.wukong.service.news.NewsServiceImpl" %>
<%@ page import="com.wukong.pojo.News" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>仿新浪新闻首页</title>
    <meta name="keywords" content="新浪新闻,新浪网,新闻中心">
    <meta name="description" content="新浪新闻，人人都在用的综合资讯App，聚集时政、
    民生、财经、科技、娱乐、体育、游戏等全领域热点内容，帮助用户一榜览尽全网热点。">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
</head>
<body>
<!--页面顶部-->
<%@ include file="/jsp/pages/common/header.jsp" %>

<!--页面主体-->
<div id="content" class="main-content clearfix">
    <!--主体的的左边部分-->
    <%@ include file="/jsp/pages/common/leftSidebar.jsp" %>


    <!--页面主体的右部，包括新闻的列表和评论内容 -->
    <div class="main-content-right">
        <!--各专题的新闻列表-->
        <div class="main-text-box">
            <div class="main-text-box-tbg">
                <div class="main-text-box-bbg">

                    <div class="main-text-box-header">
                        <h3>即时新闻</h3>
                    </div>
                    <div class="main-text-box-content">
                        <ul class="news-list-ul clearfix">
                            <%
                                NewsServiceImpl newsService = new NewsServiceImpl();
                                Integer currentNo = 1;
                                Integer pageSize = 4;
                                List<News> newsListPages = newsService.getNewsListPages(currentNo, pageSize);

                                for (News news : newsListPages) { %>
                            <li>
                                <span><%=news.getCreateDate() %></span>
                                <a href="<%=request.getContextPath()%>/jsp/pages/newsDetail.jsp?newsId=<%=news.getId() %>"
                                   target="_blank"><%=news.getTitle() %>
                                </a>
                            </li>

                            <% }

                            %>
                        </ul>
                    </div>
                    <!--图片新闻-->
                    <div class="news-pic">
                        <dl>
                            <dt><img alt="" src="<%=request.getContextPath() %>/images/new-1.png"/></dt>
                            <dd>爱人民篇章</dd>
                        </dl>
                        <dl>
                            <dt><img alt="" src="<%=request.getContextPath() %>/images/new-2.png"/></dt>
                            <dd>关注热点</dd>
                        </dl>
                        <dl>
                            <dt><img alt="" src="<%=request.getContextPath() %>/images/new-3.png"/></dt>
                            <dd>影像战役</dd>
                        </dl>
                        <dl>
                            <dt><img alt="" src="<%=request.getContextPath() %>/images/new-4.png"/></dt>
                            <dd>新闻新时期</dd>
                        </dl>
                    </div>
                    <div class="page-bar">
                        <ul class="page-num-ul clearfix">
                            <li><a href="#">上一页</a>
                            <li>
                            <li><a href="#" class="thisclass">1</a>
                            <li>
                            <li><a href="#">2</a>
                            <li>
                            <li><a href="#">3</a>
                            <li>
                            <li><a href="#">4</a>
                            <li>
                            <li><a href="#">5</a>
                            <li>
                            <li><a href="#">下一页</a>
                            <li>
                        </ul>
                        <span class="page-go-form">
                            <label for="jumpId">跳转至<input id="jumpId" type="text" name="numkey"
                                                          class="page-key"/></label>页<button type="submit"
                                                                                             class="page-btn">GO</button></span>
                    </div>
                </div>
            </div>
        </div>
        <!--合作媒体-->
        <div class="main-text-box">
            <div class="main-text-box-tbg">
                <div class="main-text-box-bbg">
                    <div class="main-text-box-header">
                        <h3>合作媒体</h3>
                    </div>
                    <div class="main-text-box-content">
                        <ul class="link-text-ul clearfix">
                            <li><a href="#">中国政府网</a></li>
                            <li><a href="#">中国政府网</a></li>
                            <li><a href="#">中国政府网</a></li>
                            <li><a href="#">中国政府网</a></li>
                            <li><a href="#">中国政府网</a></li>
                            <li><a href="#">中国政府网</a></li>
                            <li><a href="#">中国政府网</a></li>
                            <li><a href="#">中国政府网</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>


<%--页面底部--%>
<%@ include file="/jsp/pages/common/footer.jsp" %>
</body>
</html>