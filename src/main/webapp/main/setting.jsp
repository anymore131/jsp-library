<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/1
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="">
    <div class="">
        <form id="" action="Servlet" class="" method="post" enctype="multipart/form-data">
                <label class="" for="imgs">头像</label>
                <input type="hidden" name="email" value="<%=email%>">
                <input type="file" class="" id="imgs" name="imgs">
                <input type="submit" value="上传图片" />
        </form>
    </div>
</div>
<script>
    function isPicFile() {
        var filename = document.getElementById("imgs").value;
        var index = filename.lastIndexOf(".");
        if (index != -1) {
            var ext = (filename.substring(index + 1, filename.length)).toLowerCase();
            var array = ["jpg", "png", "gif"];
            for (var i = 0; i < array.length; i++) {
                if (array[i] == ext) {
                    return true;
                }
            }
        }
        alert("上传文件格式必须是jpg,png,gif!");
        return false;
    }
</script>
</body>
</html>
