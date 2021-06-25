<%@ page pageEncoding="UTF-8" %>
<%@ page import="com.wukong.service.news.NewsServiceImpl" %>
<%@ page import="com.wukong.service.news.NewsService" %>
<%@ page import="com.wukong.pojo.News" %>
<%@ page import="com.wukong.service.user.UserServiceImpl" %>
<%@ page import="com.wukong.pojo.User" %>
<%@ page import="com.wukong.service.comment.CommentServiceImpl" %>
<%@ page import="com.wukong.pojo.Comment" %>
<%@ page import="java.util.List" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>新浪新闻详情页</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
</head>
<body>
<!--页面的头部-->
<%@ include file="common/header.jsp" %>

<!--页面的主体-->
<div id="content" class="main-content clearfix">
    <!--主体的的左边部分-->
    <%@ include file="common/leftSidebar.jsp" %>

    <!--页面主体的右部，包括新闻的列表和评论内容 -->
    <div class="main-content-right">
        <!--各专题的新闻列表-->
        <div class="main-text-box">
            <div class="article-place"><a href="#">新闻中心</a> > <a href="#">国内</a></div>
            <div class="main-text-box-tbg">
                <%--根据新闻id获得新闻详情--%>
                <%
                    String newsId = request.getParameter("newsId");
                    NewsService newsService = new NewsServiceImpl();
                    News news = newsService.getNewsById(Integer.parseInt(newsId));
                %>
                <%--根据 创建人id 获得创建人姓名 --%>
                <%
                    UserServiceImpl userService = new UserServiceImpl();
                    User userById = userService.getUserById(news.getCreateBy());

                %>
                <div class="main-text-box-bbg">
                    <div class="article-box">
                        <!--新闻的标题-->
                        <h1><%= news.getTitle() %>
                        </h1>
                        <div class="source-bar">
                            发布者：<%= userById.getUsername() %> 分类：新闻信息 发布时间：
                            <%=news.getCreateDate() %>

                        </div>
                        <div class="article-content">
                            <span class="article-summary"><b>摘要：</b><%=news.getSummary() %></span>
                            <p><%=news.getContent() %>
                            </p>
                        </div>
                        <div class="comment">
                            <%
                                // 根据新闻id 查询关联的评论列表
                                CommentServiceImpl commentService = new CommentServiceImpl();

                                List<Comment> commentList = commentService.getCommentListByNewsId(news.getId());


                            %>

                            <%--显示评论列表--%>
                            <dl>
                                <% for (int i = commentList.size()-1 ;i>=0;i--) { %>
                                <dt class="comment-top">
                                    <span class="fr"><%= commentList.get(i).getCreateDate() %></span>
                                    <b><%= (i+1) %>楼</b> <b><%= userService.getUserById(commentList.get(i).getCreateBy()).getUsername() %> </b>
                                </dt>
                                <dd class="comment-body">
                                    <%=commentList.get(i).getContent()%>
                                </dd>
                              <%  } %>
                            </dl>

                        </div>
                        <%-- 评论框--%>
                        <div class="comment-form">
                            <div class="comment-form-header">
                                <span>用户：<%
                                    if(user !=null){
                                        out.print(user.getUsername());
                                    }else {
                                        out.print("<a href='#top'>请登录</a>");
                                    }
                                 %></span>
                                <h3>发表评论：</h3>
                            </div>
                            <div class="comment-form-content">
                                <label>
                                    <textarea class="comment-textarea" id="contentTextarea" ></textarea>
                                </label>
                                <input type="hidden" id="newsId" value="<%=news.getId() %>">
                                <%
                                    Integer currentUserId = null;
                                    if(user !=null) {
                                        currentUserId = user.getId();
                                    }
                                %>
                                <input type="hidden" id="currentUserId" value="<%=currentUserId %>"/>

                                <button type="button" id="addCommentBtn">评论</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!--页面底部-->
<%@ include file="common/footer.jsp" %>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script src="<%=request.getContextPath() %>/js/addComment.js"></script>
</body>
</html>