<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/1/12
  Time: 23:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .header{
            width: 100%;
            height: 65px;
            background: #d3d3d3;
        }
        #title{
            padding-top: 15px;
            display: inline-block;
            justify-content: center;
            align-items: center;
            width: 200px;
            color:#000;
            font-family: 微软雅黑, serif ;
            margin: 0 auto;
        }
        #titlename{
            text-align: center;
        }
        .user-name{
            margin-top: 21px;
            margin-right: 40px;
            display: inline-block;
            float: right;
        }
        #user{
            border: #000 1px solid;
            margin-top: 11px;
            margin-right: 40px;
            display: inline-block;
            float: right;
            height: 40px;
            width: 40px;
            border-radius: 50%;
        }
        #user img{
            border-radius: 50%;
            height: 40px;
            width: 40px;
        }
        #out{
            height: 30px;
            width: auto;
            padding-top: 15px;
            padding-right: 40px;
            margin: 0 auto;
            display: inline-block;
            float: right;
        }
        #out a{
            text-decoration: none;
            outline: none;
            color: #000;
        }
        #out button{
            height: 35px;
            width: 60px;
            background-color: #ffffff;
            border: 1px solid #333333;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            -webkit-transition-duration: 0.4s;
            transition-duration: 0.4s;
            cursor: pointer;
        }
        #out button:hover {
            border: 1px solid #ccc;
            box-shadow: 0 0 16px 0 rgba(224, 224, 224, 0.24),
            0 0 50px 0 rgba(224, 224, 224, 0.24);
        }
        #out button a{
            color: black;
            text-decoration: none;
        }
        #out button:hover a{
            color: #1890FFFF;
            text-decoration: none;
        }
    </style>
</head>
<body>
<header class="header">
    <div id="title">
        <h2 id="titlename">图书管理系统</h2>
    </div>
    <div id="out">
        <a href="work/to-manage-check.jsp">管理端</a>
        <button>
            <a href="index.jsp">登出</a>
        </button>
    </div>
    <div id="user">
        <img src="data:image/jpeg;base64, <%= base64Image %>" alt="">
    </div>
    <div class="user-name">
        <h4>hi，<%=user%></h4>
    </div>
</header>
</body>
</html>