<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
      <title>新浪新闻详情页</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
  </head>
<body>
<!--页面的头部-->
<div id="header">
    <!--页面顶部-->
    <div class="main-top">
        <div class="logo"><a href=""><span>新浪新闻详情</span></a></div>
        <div class="login-box">
        	<%
        	 Object objUser =session.getAttribute("user");
	            if(objUser!=null){
	            	out.println("欢迎您："+objUser.toString());
	            	out.println(session.getId());
	            }else{
        	 %>
            <label>用户名</label><input type="text" name="uname" /><label>密码</label><input type="text" name="upassword" /><button>登录</button>
        	<%}%>
        </div>
         <!--导航-->
        <div class="nav">
            <ul class="clearfix">
                <li><a href="#">首页</a></li>
                <li><a href="#">国内</a></li>
                <li><a href="#">国际</a></li>
                <li><a href="#">娱乐</a></li>
                <li><a href="#">军事</a></li>
            </ul>
        </div>
    </div>
    <!--banner-->
    <div class="main-banner"><img src="<%=request.getContextPath() %>/images/banner.png" /></div>
    <!--搜索横框-->
    <div class="search-box">
        <div class="sl">
            <div class="sr clearfix">
                <span class="left-search clearfix">
                    <label>站内搜索</label><input type="text" name="keyword" value="关键词" /><button class="go-btn"></button>
                </span>
                <span class="right-link">
                    <label>快速链接</label><select><option>-----专题选择-----</option></select><button class="go-btn"></button>
                </span>
            </div>
        </div>    
    </div>
</div>
<!--页面的主体-->
<div id="content" class="main-content clearfix">
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
                    <li><a href="#">国内</a></li>
                    <li><a href="#">国际</a></li>
                    <li><a href="#">娱乐</a></li>
                    <li><a href="#">军事</a></li>
                    <li><a href="#">财经</a></li>
                    <li><a href="#">天气</a></li>
                    <li class="clear-bottom-line"><a href="#">科技</a></li>
                </ul>
            </div>
        </div>
        <!--最新新闻-->
        <div class="left-box">
            <div class="left-box-tbg">
                <div class="left-box-bbg">
                    <div class="left-box-header"><h3>最新新闻</h3></div>
                    <div class="left-box-content">
                        <ul>
                            <li><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
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
                        <ul>
                            <li><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--页面主体的右部，包括新闻的列表和评论内容 -->
    <div class="main-content-right">
        <!--各专题的新闻列表-->
        <div class="main-text-box">
            <div class="article-place"><a href="#">新闻中心</a> > <a href="#">国内</a></div>
      		<div class="main-text-box-tbg">
                <div class="main-text-box-bbg">
                    <div class="article-box">
                    	<!--新闻的标题-->
						<h1><%= "文章标题  "%></h1>
                        <div class="source-bar">
						发布者：<%= "管理员 "%> 分类：新闻信息 更新时间：
                        <%
                        	Date date = new Date();
                        	String time = new SimpleDateFormat("yyyy-MM-dd").format(date);
                         %>
                         <%=time %>
                        
                        </div>
                        <div class="article-content">
                            <span class="article-summary"><b>摘要：</b><%= " 文章摘要"%></span>
                            <p><%="文章内容文章内容"%> </P>
                        </div>
                        <div class="comment">
                            <dl>
                                <dt class="comment-top">
                                    <span class="fr">2011-09-25 13:33:55</span>
                                    <b>1楼</b> <b> 悟空</b>
                                </dt>
                                <dd class="comment-body">
                                    新浪网，棒棒哒！
                                </dd>
                            </dl>
                            <dl>
                                <dt class="comment-top">
                                    <span class="fr">2011-09-25 13:33:55</span>
                                    <b>2楼</b> <b>猪八戒</b>
                                </dt>
                               <dd class="comment-body">
                                    新浪新浪你真浪！
                                </dd>
                            </dl>
                        </div>
                        <div class="comment-form">
                            <div class="comment-form-header">
                                <span>用户：Tangseng</span>
                                <h3>发表评论：</h3>
                            </div>
                            <div class="comment-form-content">
                                <textarea class="comment-textarea"></textarea>
                                <button type="submit" class="comment-btn">评论</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--//-->
        
    </div>
</div>
<!--页面底部-->
<div class="main-footer-box">
    24小时客户服务热线：010-12345678 常见问题解答 新闻热线：010-12345678<br />
    文明办网文明上网举报电话：010-010-12345678 举报邮箱：1390128154@qq.com<br />
    CopyRight&copy;2021-2099 News China gov,All Right Reserved.<br />
    新闻中心版权所有
</div>
</body>
</html>