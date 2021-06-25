$(document).ready(function () {
    var basePath="http://localhost:8080/sina";
    $("#addCommentBtn").click(function () {
        var commentContent = $("#contentTextarea").val();
        var newsId = $("#newsId").val();
        var currentUser = $("#currentUser").val();
        var currentUserId = $("#currentUserId").val();
        console.log("评论内容为--->"+commentContent);
        console.log("新闻id为--->"+newsId);
        console.log("当前用户id为--->"+currentUserId);


       if(typeof currentUserId === 'undefined' || $.trim(currentUserId) === 'null' || currentUserId === ""){
            console.log("进入空部分的代码块");
            window.alert("请先登录，后评论！");

        }else {

            var comment = {
                "newsId": newsId,
                "content": commentContent,
                "createBy": currentUserId
            };
            console.log(comment);
            // 将评论内容发送到服务器
            $.ajax({
                url: "http://localhost:8080/sina/AddCommentServlet",
                data: {"commentKey": JSON.stringify(comment)},
                type: "POST",
                dataType: "text",
                success: function (result) {
                    if ($.trim(result) === "true") {
                        console.log("评论添加成功");
                        window.location.href=basePath+"/jsp/pages/newsDetail.jsp?newsId="+newsId;
                    } else {
                        console.log("评论添加失败");
                    }
                },
                error: function () {
                    window.alert("ajax响应失败，请检查");
                }
            });
        }
    });
});