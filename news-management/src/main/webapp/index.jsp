<%@ page import="com.wukong.service.news.NewsServiceImpl" %>
<%@ page import="com.wukong.pojo.News" %>
<%@ page import="java.util.List" %>
<%@ page import="com.wukong.tool.Constant" %>
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
                        <h3>专题新闻</h3>
                    </div>
                    <div class="main-text-box-content">
                        <ul class="news-list-ul clearfix">

                           <%-- <%
                                // 方法一：直接在index.jsp文件中处理
                                // 获得请求参数，并根据请求参数，获得新闻列表
                                String categoryIdStr = request.getParameter("categoryId");
                                Integer categoryIdFromServlet = null;
                                if (categoryIdStr != null ) {
                                    categoryIdFromServlet = Integer.parseInt(request.getParameter("categoryId"));
                                }

                                String pageNoStr = request.getParameter("pageNo");
                                int pageNoFromServlet = 0;
                                if (pageNoStr != null) {
                                    pageNoFromServlet = Integer.parseInt(request.getParameter("pageNo"));
                                }

                                if (pageNoFromServlet<=0){
                                    pageNoFromServlet=1;
                                }

                                NewsService newsService = new NewsServiceImpl();

                                // 根据分类id 获得新闻列表
                                List<News> newsListPagesFromServlet  = newsService.getNewsListPagesByCategoryId(categoryIdFromServlet,pageNoFromServlet, Constant.PAGE_SIZE);
                                System.out.println("打印出来====》"+newsListPagesFromServlet);
                            %>
--%>

                            <%
                                // 方法二：通过编写Servlet类，在该类中先获得新闻列表后，将新闻列表存入request容器中，在请求转发到index.jsp
                                List<News> newsListPagesFromServlet = (List<News>) request.getAttribute("newsListPagesKey");
                                Integer pageNoFromServlet = (Integer) request.getAttribute("pageNoKey");
                               Integer categoryIdFromServlet = (Integer) request.getAttribute("categoryIdKey");

                                List<News> newsListPages ;
                                int currentNo = 1;
                                Integer categoryId;

                                NewsServiceImpl newsService = new NewsServiceImpl();

                                if (newsListPagesFromServlet == null  ) {
                                    System.out.println("首次访问 进入该 代码块");
                                    //首次访问首页时候，默认显示国内分类下的所有新闻列表
                                    categoryId = 1;
                                  //  currentNo = 1;
                                    newsListPages = newsService.getNewsListPagesByCategoryId(categoryId,currentNo, Constant.PAGE_SIZE);

                                } else{
                                    System.out.println("进入else 代码块 ");
                                        categoryId = categoryIdFromServlet;
                                        currentNo = pageNoFromServlet;
                                        newsListPages = newsListPagesFromServlet;


                                }


                                for (News news : newsListPages) { %>
                            <li>
                                <span><%=news.getCreateDate() %></span>
                                <a href="<%=request.getContextPath()%>/jsp/pages/newsDetail.jsp?newsId=<%=news.getId() %>">
                                    <%=news.getTitle() %>
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
                            <li>
                                <a href="<%=request.getContextPath()%>/ShowNewsListPagesServlet?categoryId=<%=categoryId %>&pageNo=<%=currentNo-1%>">上一页</a>
                            </li>
                            <li><a href="<%=request.getContextPath()%>/ShowNewsListPagesServlet?categoryId=1&pageNo=1">1</a>
                            </li>
                            <li><a href="<%=request.getContextPath()%>/ShowNewsListPagesServlet?categoryId=1&pageNo=2">2</a>
                            </li>
                            <li><a href="<%=request.getContextPath()%>/ShowNewsListPagesServlet?categoryId=1&pageNo=3">3</a>
                            </li>
                            <li><a href="<%=request.getContextPath()%>/ShowNewsListPagesServlet?categoryId=1&pageNo=4">4</a>
                            </li>
                            <li><a href="<%=request.getContextPath()%>/ShowNewsListPagesServlet?categoryId=1&pageNo=5">5</a>
                            </li>
                            <li>
                                <a id="test" href="<%=request.getContextPath()%>/ShowNewsListPagesServlet?categoryId=<%=categoryId %>&pageNo=<%=currentNo+1%>">下一页</a>
                            </li>
                        </ul>
                        <span class="page-go-form">
                            <form action="<%=request.getContextPath()%>/ShowNewsListPagesServlet">
                                <label for="jumpId">
                                跳转至<input id="jumpId" type="text" name="pageNo" class="page-key"/>页
                                </label>
                                <button id="go" type="submit" class="page-btn">GO</button>
                            </form>

                        </span>
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
<script src="js/jquery-3.6.0.js"></script>
</body>
</html>