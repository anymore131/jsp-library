<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/5
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .input-book {
        width: 75vw;
        height: 85vh;
        background-color: #fff5;
        box-shadow: 0 8px 16px #0005;
        border-radius: 16px;
        overflow: hidden;
    }
    .input-book-form{
        margin-top: 10vh;
        padding: 0 25%;
        width: 50%;
    }
    .input-book-item{
        width: 100%;
        margin-bottom: 2vh;
        position: relative;
    }
    .input-book-item p{
        font-size: 16px;
        font-weight: 900;
        margin-bottom: 5px;
    }
    .input-book-item .ipt{
        width: 100%;
        height: 45px;
        border-radius: 10px;
        border: 1px solid rgb(194, 205, 216);
        padding: 15px 100px 15px 50px;
        box-sizing: border-box;
        margin-bottom: 5px;
        outline: none;
        font-size: 20px;
        transition: 0.3s;
    }
    .input-book-item .ipt:hover{
        border: 1px solid rgb(87, 59, 255);
    }
    .input-book-item .ipt:focus{
        border: 1px solid rgb(87, 59, 255);
    }
    .input-book-form .btn{
        width: 50%;
        height: 50px;
        background-color: rgb(87, 59, 255);
        color: #fff;
        border-radius: 10px;
        border: 0;
        margin: 10px 25%;
        font-size: 20px;
        cursor: pointer;
        font-family: 微软雅黑, serif;
    }
</style>
<div class="input-book">
    <div class="input-book-form">
        <form action="work-manage/changebooks.jsp" class="form" method="post">
            <div class="input-book-item">
                <p>编号</p>
                <input type="text" id="ID" class="ipt" name="ID" placeholder="请输入书编号" value="">
            </div>
            <div class="input-book-item">
                <p>书名</p>
                <input type="text" id="name" class="ipt" name="name" placeholder="请输入书名" value="">
            </div>
            <div class="input-book-item">
                <p>作者</p>
                <input type="text" id="author" class="ipt" name="author" placeholder="请输入作者" value="">
            </div>
            <div class="input-book-item">
                <p>出版社</p>
                <input type="text" id="press" class="ipt" name="press" placeholder="请输入出版社" value="">
            </div>
            <div class="input-book-item">
                <p>实际数量</p>
                <input type="text" id="realQuantity" class="ipt" name="realQuantity" placeholder="请输入实际数量" value="">
            </div>
            <div class="input-book-item">
                <p>总数量</p>
                <input type="text" id="totalQuantity" class="ipt" name="totalQuantity" placeholder="请输入总数量" value="">
            </div>
            <input type="submit" value="提交" class="btn">
        </form>
    </div>
</div>
