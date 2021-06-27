<%--
    author: 悟空非空也（B站/知乎/公众号） 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-content-left">

  <!--新闻管理-->
  <div class="class-box">
    <div class="class-box-header">
      <h3>新闻管理</h3>
    </div>
    <div class="class-box-content">
      <ul>
        <li><a href="<%=request.getContextPath()%>/jsp/admin/index.jsp">新闻管理</a>
        </li>
        <li class="clear-bottom-line"><a href="<%=request.getContextPath()%>/jsp/admin/comment.jsp">评论管理</a></li>
      </ul>
    </div>
  </div>

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
