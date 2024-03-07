<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/5
  Time: 15:27
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

    .input-book-form {
        margin-top: 10vh;
        padding: 0 25%;
        width: 50%;
    }

    .input-book-item {
        width: 100%;
        margin-bottom: 2vh;
        position: relative;
    }

    .input-book-item p {
        font-size: 16px;
        font-weight: 900;
        margin-bottom: 5px;
    }

    .input-book-item .ipt {
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

    .input-book-item .ipt:hover {
        border: 1px solid rgb(87, 59, 255);
    }

    .input-book-item .ipt:focus {
        border: 1px solid rgb(87, 59, 255);
    }

    .input-book-form .btn {
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
        <form action="work-manage/upbooks.jsp" class="form" method="post">
            <div class="input-book-item">
                <p>书1</p>
                <input type="text" id="book1" class="ipt" name="book1" placeholder="" value="">
            </div>
            <div class="input-book-item">
                <p>书2</p>
                <input type="text" id="book2" class="ipt" name="book2" placeholder="" value="">
            </div>
            <div class="input-book-item">
                <p>书3</p>
                <input type="text" id="book3" class="ipt" name="book3" placeholder="" value="">
            </div>
            <div class="input-book-item">
                <p>书4</p>
                <input type="text" id="book4" class="ipt" name="book4" placeholder="" value="">
            </div>
            <div class="input-book-item">
                <p>书5</p>
                <input type="text" id="book5" class="ipt" name="book5" placeholder="" value="">
            </div>
            <div class="input-book-item">
                <p>书6</p>
                <input type="text" id="book6" class="ipt" name="book6" placeholder="" value="">
            </div>
            <input type="submit" value="提交" class="btn">
        </form>
    </div>
</div>
