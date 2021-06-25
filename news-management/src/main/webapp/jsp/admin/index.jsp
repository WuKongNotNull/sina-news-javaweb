<%@ page  contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台首页</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css"/>
</head>

<body>
<!--页面顶部-->
<div id="header">
    <div class="main-top">
        <div class="logo"><a href=""><span>新闻大视野</span></a></div>


    </div>

    <!--管理工具栏-->
    <div class="admin-bar">
        <span class="fr">退出账户</span>
        管理员：admin 2012-06-19
    </div>
</div>
<!--主体-->
<div id="content" class="main-content clearfix">
    <div class="main-content-left">
        <!--新闻管理-->
        <div class="class-box">
            <div class="class-box-header">
                <h3>新闻管理</h3>
            </div>
            <div class="class-box-content">
                <ul>
                    <li><a href="#">新闻管理</a></li>
                    <li class="clear-bottom-line"><a href="#">最新新闻</a></li>
                </ul>
            </div>
        </div>
        <!--//-->
        <!--主题管理-->
        <div class="class-box">
            <div class="class-box-header">
                <h3>分类管理</h3>
            </div>
            <div class="class-box-content">
                <ul>
                    <li><a href="#">分类管理</a></li>
                    <li class="clear-bottom-line"><a href="#">删除主题</a></li>
                </ul>
            </div>
        </div>
        <!--//-->
        <!--账户管理-->
        <div class="class-box">
            <div class="class-box-header">
                <h3>用户管理</h3>
            </div>
            <div class="class-box-content">
                <ul>
                    <li><a href="#">用户管理</a></li>
                    <li class="clear-bottom-line"><a href="#">付费服务</a></li>
                </ul>
            </div>
        </div>
        <!--//-->
    </div>
    <div class="main-content-right">
        <!--即时新闻-->
        <div class="main-text-box">
            <div class="main-text-box-tbg">
                <div class="main-text-box-bbg">
                    <form name="searchForm" id="searchForm" action="<%=request.getContextPath() %>/jsp/admin/index.jsp" method="post">
                        <div>
                            新闻分类：
                            <label>
                                <select name="categoryId">
                                    <option value="0">全部</option>

                                    <option value='1'>国内</option>

                                    <option value='2'>国际</option>

                                    <option value='3'>娱乐</option>

                                    <option value='4'>军事</option>

                                    <option value='5'>财经</option>

                                    <option value='6'>天气</option>

                                </select>
                            </label>
                            新闻标题<label for="title"><input type="text" name="title" id="title" value=''/></label>
                            <button type="submit" class="page-btn">GO</button>
                            <button type="button" onclick="addNews();" class="page-btn">增加</button>
                            <input type="hidden" name="currentPageNo" value="1"/>
                            <input type="hidden" name="pageSize" value="10"/>
                            <input type="hidden" name="totalPageCount" value="2"/>
                        </div>
                    </form>
                    <table cellpadding="1" cellspacing="1" class="admin-list">
                        <thead>
                        <tr class="admin-list-head">
                            <th>新闻标题</th>
                            <th>作者</th>
                            <th>时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%

                        %>
                        <tr <%--<%if(i%2==0){ %>class="admin-list-td-h2"<%} %>--%> >
                            <td><a href='<%=request.getContextPath() %>/jsp/admin/index.jsp?id=2'>新闻标题1
                            </a></td>
                            <td>新闻作者1
                            </td>
                            <td>发布日期
                            </td>
                            <td><a href='<%=request.getContextPath() %>/jsp/admin/index.jsp?id=2'>修改</a>
                                <a href="javascript:if(confirm('确认是否删除此新闻？')) location='adminNewsDel.jsp?id=2'">删除</a>
                            </td>
                        </tr>
                       <%-- <%} %>--%>
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
<!--底部-->
<%--<div class="main-footer-box">
    24小时客户服务热线：010-68988888 常见问题解答 新闻热线：010-627488888<br/>
    文明办网文明上网举报电话：010-627488888 举报邮箱：jubao@bj-aptech.com.cn<br/>
    Coyright&copy;1999-2007 News China gov,All Right Reserved.<br/>
    新闻中心版权所有
</div>--%>
<%--<%@ include file="../" %>--%>
</body>
</html>