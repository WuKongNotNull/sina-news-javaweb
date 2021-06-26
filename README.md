# sina-news-javaweb

基于servlet+jsp+mysql一个仿新浪新闻门户网站


# 环境
* jdk 1.8
* tomcat 9.0.48
* maven 3.6.3
* mySql 8.0.25  username: root  password:rootroot

# 图片尺寸
* logo  240 * 50
* banner 764 * 199
* 侧边图  150 * 93

# git 版本管理

## 创建main
* GitHub 上创建远程仓库 ç
* git clone  https://github.com/WuKongNotNull/sina-news-javaweb.git
* cd sina-news-javaweb
* git remote -v
* git remote add origin https://github.com/WuKongNotNull/sina-news-javaweb.git
* git status
* git add .
* git commit -m ""
* git push -u origin main
## 创建分支
* git branch
* git checkout -b test
* git push -u origin test

# 计划

## v1.0 分支
### 需求
* 搭建动态 java web项目
* 设计前台的基本界面


## v1.1 分支
### 需求 
* 配置ignore文件，不要上传编译后的文件
* session实现用户登录功能
* 登录后，登录状态在多页面显示
* 退出功能的实现


## v1.2 分支
### 需求
* 实现用户注册功能
* cookie实现记住我功能
* application实现网站访问量统计功能

## v1.3 分支
### 需求
* 实现首页左侧边栏的最新新闻列表展示
* 设计新闻详情页UI界面
* 实现新闻详情页信息展示
* 实现新闻详情页的评论栏信息展示
* 设计前台公共页面，使用@include减少前端代码冗余
* ajax实现评论留言的添加
* 关于分类
  * 实现左侧边栏的分类列表展示
  * 首页主体部分显示左侧边栏第1分类下的新闻列表
  * 点击各分类目录，展示分类下的新闻列表
  * 分页导航对新闻列表的操作
* 设计后台登录界面和后台首页界面

## v1.4 分支
### 需求
* 实现后台登录功能
* 实现v





















