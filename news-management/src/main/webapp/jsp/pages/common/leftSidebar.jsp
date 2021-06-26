<%@ page import="com.wukong.service.category.CategoryService" %>
<%@ page import="com.wukong.service.category.CategoryServiceImpl" %>
<%@ page import="com.wukong.pojo.Category" %>
<%@ page import="com.wukong.service.news.NewsService" %>
<%@ page import="com.wukong.pojo.Comment" %>
<%@ page import="com.wukong.service.comment.CommentService" %>
<%@ page import="com.wukong.service.comment.CommentServiceImpl" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!--主体的的左边部分-->
<div class="main-content-left">
    <!--新闻专题分类-->
    <div class="class-box">
        <div class="class-box-header">
            <span class="fr"><a href="#">更多...</a></span>
            <h3>新闻专题</h3>
        </div>
        <div class="class-box-content">
            <ul>
                <%
                    CategoryService categoryService = new CategoryServiceImpl();
                    List<Category> categoryList =categoryService.getCategoryList();
                    for (Category category:categoryList ) {%>
                        <li class="clear-bottom-line">
                            <a value="<%=category.getId()%>"  href="<%=request.getContextPath()%>/ShowNewsListPagesServlet?categoryId=<%=category.getId()%>&pageNo=1"><%=category.getName()%></a>
                            <%--<a value="<%=category.getId()%>"  href="<%=request.getContextPath()%>/index.jsp?categoryId=<%=category.getId()%>&pageNo=1"><%=category.getName()%></a>--%>
                        </li>

                <%
                    }
                %>
            </ul>
            <script>

            </script>
        </div>
    </div>
    <!--最新新闻-->
    <div class="left-box">
        <div class="left-box-tbg">
            <div class="left-box-bbg">
                <div class="left-box-header"><h3><a href="#">最新新闻</a></h3></div>
                <div class="left-box-content">
                    <ul>

                        <%
                            NewsService newsServiceSideBar = new NewsServiceImpl();
                            List<News> newsListPagesSidebar  = newsServiceSideBar.getNewsListPages(1, 5);

                            for (News news : newsListPagesSidebar) { %>
                        <li>
                            <a href="<%=request.getContextPath()%>/jsp/pages/newsDetail.jsp?newsId=<%=news.getId() %>"
                               ><%=news.getTitle() %>
                            </a>
                        </li>

                        <% }

                        %>

                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--最新评论-->
    <div class="left-box">
        <div class="left-box-tbg">
            <div class="left-box-bbg">
                <div class="left-box-header"><h3>最新评论</h3></div>
                <div class="left-box-content">
                    <%
                        CommentService commentService2 = new CommentServiceImpl();
                        List<Comment> commentListPages = commentService2.getCommentListPages(1, 5);

                    %>
                    <ul>
                        <%
                            for (Comment comment: commentListPages) {

                        %>
                        <li><a href="<%=request.getContextPath()%>/jsp/pages/newsDetail.jsp?newsId=<%=comment.getNewsId() %>"><%=comment.getContent() %></a></li>
                         <%   }
                        %>

                    </ul>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery-3.6.0.js"></script>
</div>
