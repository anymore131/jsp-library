<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/5
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

</style>
<div class="change-book">
    <div class="change-book-form">
        <form action="work-manage/changebooks.jsp" class="form" method="post">
            <div class="want-input-item">
                <p>name</p>
                <input type="text" class="ipt" name="name" placeholder="" >
            </div>
            <div class="want-input-item">
                <p>name</p>
                <input type="text" class="ipt" name="author" placeholder="请输入你想借阅的书的作者" >
            </div>
            <div class="want-input-item">
                <p>name</p>
                <input type="text" class="ipt" name="press" placeholder="请输入你想借阅的书的出版社">
            </div>
            <input type="submit" value="提交" class="btn">
        </form>
    </div>
</div>
