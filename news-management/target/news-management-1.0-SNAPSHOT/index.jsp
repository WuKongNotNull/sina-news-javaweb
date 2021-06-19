<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">

    <title>仿新浪新闻首页</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">

</head>
<body>
<!--页面顶部-->
<div id="header">
    <div class="main-top">
        <div class="logo"><a href=""><span>新浪新闻平台</span></a></div>
        <div class="login-box">
            <form action="<%=request.getContextPath()%>/LoginServlet" method="post">
                <label>用户名</label><input type="text" name="uname" value="" />
                <label>密码</label><input type="text" name="upassword" />
                <button> 登陆</button>
            </form>
            <span>
                <button> 注册</button>
                <button> <a href="<%=request.getContextPath() %>/LoginOutServlet">注销</a></button>
            </span>

            <span>
                    <% String username = (String) session.getAttribute("usernameKey");
                        if(username!=null && !username.equals("")){
                           out.println("登陆成功，用户名："+username);


                        }
                    %>
            </span>



        </div>

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
    <div class="main-banner">
        <img src="<%=request.getContextPath() %>/images/banner.png" />
    </div>
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
<!--d页面主体-->
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
                    <div class="left-box-header"><h3><a href="#">最新新闻</a></h3></div>
                    <div class="left-box-content">
                        <ul>
                            <li><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
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
                            <li><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
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
            <div class="main-text-box-tbg">
                <div class="main-text-box-bbg">

                    <div class="main-text-box-header">
                        <h3>即时新闻</h3>
                    </div>
                    <div class="main-text-box-content">
                        <ul class="news-list-ul clearfix">
                            <li><span>2016-4-28 10:33:33</span><a href="<%=request.getContextPath()%>/pages/newsDetail.jsp">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li><span>2016-4-28 10:33:33</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li><span>2016-4-28 10:33:33</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li><span>2016-4-28 10:33:33</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li class="li-line"><span>2016-4-28 10:33:33</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>

                            <li><span>2016-4-28 10:33:33</span><a href="#">J神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li><span>2016-4-28 10:33:33</span><a href="#">U神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li><span>2016-4-28 10:33:33</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li><span>2016-4-28 10:33:33</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li class="li-line"><span>2016-4-28 10:33:33</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>

                            <li><span>2016-4-28 10:33:33</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li><span>2016-4-28 10:33:33</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li><span>2016-4-28 10:33:33</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li><span>2016-4-28 10:33:33</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li class="li-line"><span>2016-4-28 10:33:33</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>

                            <li><span>2016-4-28 10:33:33</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li><span>2016-4-28 10:33:33</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li><span>2016-4-28 10:33:33</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li><span>2016-4-28 10:33:33</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                            <li class="li-line"><span>2016-4-28 10:33:33</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心举行</a></li>
                        </ul>
                    </div>
                    <!--图片新闻-->
                    <div class="news-pic">
                        <dl>
                            <dt><img src="<%=request.getContextPath() %>/images/new-1.png" /></dt>
                            <dd>爱人民篇章</dd>
                        </dl>
                        <dl>
                            <dt><img src="<%=request.getContextPath() %>/images/new-2.png" /></dt>
                            <dd>关注热点</dd>
                        </dl>
                        <dl>
                            <dt><img src="<%=request.getContextPath() %>/images/new-3.png" /></dt>
                            <dd>影像战役</dd>
                        </dl>
                        <dl>
                            <dt><img src="<%=request.getContextPath() %>/images/new-4.png" /></dt>
                            <dd>新闻新时期</dd>
                        </dl>
                    </div>
                    <div class="page-bar">
                        <ul class="page-num-ul clearfix">
                            <li><a href="#">上一页</a><li>
                            <li><a href="#" class="thisclass">1</a><li>
                            <li><a href="#">2</a><li>
                            <li><a href="#">3</a><li>
                            <li><a href="#">4</a><li>
                            <li><a href="#">5</a><li>
                            <li><a href="#">下一页</a><li>
                        </ul>
                        <span class="page-go-form"><label>跳转至</label><input type="text" name="numkey" class="page-key" />页<button type="submit" class="page-btn">GO</button></span>
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
<!--页面底部-->
<div id="footer" class="main-footer-box">
    24小时客户服务热线：010-12345678 常见问题解答 新闻热线：010-12345678<br />
    文明办网文明上网举报电话：010-010-12345678 举报邮箱：1390128154@qq.com<br />
    Coyright&copy;2021-2099 News China gov,All Right Reserved.<br />
    新闻中心版权所有
</div>
</body></html>