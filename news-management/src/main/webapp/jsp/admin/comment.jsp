<%@ page import="com.wukong.tool.Constant" %>
<%@ page import="com.wukong.pojo.User" %>
<%@ page import="com.wukong.service.news.NewsService" %>
<%@ page import="com.wukong.service.news.NewsServiceImpl" %>
<%@ page import="com.wukong.pojo.News" %>
<%@ page import="java.util.List" %>
<%@ page import="com.wukong.service.user.UserService" %>
<%@ page import="com.wukong.service.user.UserServiceImpl" %>
<%@ page import="com.wukong.pojo.Category" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台首页</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css"/>
</head>

<body>
<!--页面顶部-->
<%@include file="common/header.jsp"%>

<!--主体-->
<div id="content" class="main-content clearfix">
    <%--左侧边栏内容--%>
    <%@include file="common/left.jsp"%>

    <div class="main-content-right">
        <!--分类栏目-->
        <div class="main-text-box">
            <div class="main-text-box-tbg">
                <div class="main-text-box-bbg">
                    <form name="searchForm" id="searchForm" action="<%=request.getContextPath() %>/jsp/admin/index.jsp"
                          method="post">
                        <div>
                            <%--评论分类：--%>
                            <%--<label>
                                <select name="categoryId">
                                    <option value="0">全部</option>

                                    <option value='1'>国内</option>

                                    <option value='2'>国际</option>

                                    <option value='3'>娱乐</option>

                                    <option value='4'>军事</option>

                                    <option value='5'>财经</option>

                                    <option value='6'>天气</option>

                                </select>
                            </label>--%>
                            评论内容<label for="title"><input type="text" name="title" id="title" value=''/></label>
                            <button type="submit" class="page-btn">GO</button>
                            <button type="button" onclick="addComment();" class="page-btn">增加</button>
                            <input type="hidden" name="currentPageNo" value="1"/>
                            <input type="hidden" name="pageSize" value="10"/>
                            <input type="hidden" name="totalPageCount" value="2"/>
                        </div>
                    </form>
                    <table cellpadding="1" cellspacing="1" class="admin-list">
                        <thead>
                        <tr class="admin-list-head">
                            <th>评论标题</th>
                            <th>作者</th>
                            <th>时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <tr>
                            <td><a href='<%=request.getContextPath() %>/jsp/admin/index.jsp?id=2'>评论标题
                            </a></td>
                            <td>评论作者
                            </td>
                            <td>发布日期
                            </td>
                            <td><a href='<%=request.getContextPath() %>/jsp/admin/index.jsp?id=2'>修改</a>
                                <a href="javascript:if(confirm('确认是否删除此评论？')) location='adminNewsDel.jsp?id=2'">删除</a>
                            </td>
                        </tr>


                        </tbody>
                    </table>
                    <div class="page-bar">
                        <ul class="page-num-ul clearfix">
                            <li>共7条记录&nbsp;&nbsp; 1/2页</li>
                            <a href="javascript:page_nav(document.forms[0],2);">下一页</a>
                            <a href="javascript:page_nav(document.forms[0],2);">最后一页</a>&nbsp;&nbsp;
                        </ul>
                        <span class="page-go-form"><label>跳转至</label>
	     <label for="inputPage"><input type="text" name="inputPage" id="inputPage" class="page-key"/>页</label>
	     <button type="button" class="page-btn"
                 onClick='jump_to(document.forms[0],document.getElementById("inputPage").value)'>GO</button>
		</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>