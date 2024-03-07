<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/1/20
  Time: 1:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .want-form {
            width: 75vw;
            height: 85vh;
            background-color: #fff5;
            box-shadow: 0 8px 16px #0005;
            border-radius: 16px;
            overflow: hidden;
        }
        .want-input-form{
            margin-top: 20vh;
            padding: 0 25%;
            width: 50%;
        }
        .want-input-item{
            width: 100%;
            margin-bottom: 2vh;
            position: relative;
        }
        .want-input-item p{
            font-size: 16px;
            font-weight: 900;
            margin-bottom: 5px;
        }
        .want-input-item .ipt{
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
        .want-input-item .ipt:hover{
            border: 1px solid rgb(87, 59, 255);
        }
        .want-input-item .ipt:focus{
            border: 1px solid rgb(87, 59, 255);
        }
        .want-input-form .btn{
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
</head>
<body>
<div class="want-form">
    <div class="want-input-form">
        <form action="work/want-book.jsp" method="post">
            <div class="want-input-item">
                <p>name</p>
                <input type="text" class="ipt" name="name" placeholder="请输入你想借阅的书名">
            </div>
            <div class="want-input-item">
                <p>name</p>
                <input type="text" class="ipt" name="author" placeholder="请输入你想借阅的书的作者">
            </div>
            <div class="want-input-item">
                <p>name</p>
                <input type="text" class="ipt" name="press" placeholder="请输入你想借阅的书的出版社">
            </div>
            <input type="submit" value="提交" class="btn">
        </form>
    </div>
</div>
</body>
</html>
