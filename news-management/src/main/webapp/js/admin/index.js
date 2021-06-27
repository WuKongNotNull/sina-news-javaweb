$(function () {
    var contextPath = "http://localhost:8080/sina";

    // 点击下拉框，使用Ajax技术动态获得下拉菜单
    $("#categoryId ").click(function () {

        // 从服务器响应数据
        $.ajax({
            url: contextPath+"/GetCategoryListServlet",
            type: "GET",
            dataType: "json",
            success: function (result) {
                var content = "<option value='0'>请选择</option>";
                $.each(result,function (index,item) {
                    content+="<option value="+item.id+">"+item.name+"</option>";
                });
                console.log("content->"+content);
                $("#categoryId").html(content);
            },
            error: function (){
                console.log("Ajax获得新闻列表失败，请检查网络！");
            }
        });

    });

    // 点击下拉框中的某选项，获得对应的分类下的新闻
    $("#categoryId").change(function () {
        var selectedVal = $("#categoryId option:selected").val();
        console.log("selectedVal--->" + selectedVal);
        $.ajax({
            url:contextPath+"/GetNewsListPagesByCategoryIdServlet",
            data:{
                categoryId: selectedVal,
                pageSize: 1
            },
            type:"GET",
            dataType:"json",
            success: function (result) {
                var overrideContent;
                //返回的result，此时是json对象(新闻列表)
                $.each(result,function (index,item) {
                    overrideContent+="<tr>";
                    overrideContent+="<td><a href=''>"+item.title+"</a></td>";
                    overrideContent+= "</tr>";
                });

                $("tbody").html(overrideContent);
            },
            error: function (){
                console.log("点击下拉菜单选项时，ajax异常");
            }
        });
    });


});