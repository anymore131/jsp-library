<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/5
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .header-manage {
        width: 100%;
        height: 65px;
        background: #d3d3d3;
    }

    #title-manage {
        padding-top: 15px;
        display: inline-block;
        justify-content: center;
        align-items: center;
        width: auto;
        color: #000;
        font-family: 微软雅黑, serif;
        margin: 0 auto 0 3vw;
    }

    #titlename-manage {
        text-align: center;
    }

    .user-name-manage {
        margin-top: 21px;
        margin-right: 40px;
        display: inline-block;
        float: right;
    }

    #user-manage {
        border: #000 1px solid;
        margin-top: 11px;
        margin-right: 40px;
        display: inline-block;
        float: right;
        height: 40px;
        width: 40px;
        border-radius: 50%;
    }

    #user-manage img {
        border-radius: 50%;
        height: 40px;
        width: 40px;
    }

    #out-manage {
        height: 30px;
        width: auto;
        padding-top: 15px;
        padding-right: 40px;
        margin: 0 auto;
        display: inline-block;
        float: right;
    }

    #out-manage a{
        text-decoration: none;
        outline: none;
        color: #000;
    }

    #out-manage button {
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

    #out-manage button:hover {
        border: 1px solid #ccc;
        box-shadow: 0 0 16px 0 rgba(224, 224, 224, 0.24),
        0 0 50px 0 rgba(224, 224, 224, 0.24);
    }

    #out-manage button a {
        color: black;
        text-decoration: none;
    }

    #out-manage button:hover a {
        color: #1890FFFF;
        text-decoration: none;
    }
</style>
<header class="header-manage">
    <div id="title-manage">
        <h2 id="titlename-manage">图书管理系统-管理端</h2>
    </div>
    <div id="out-manage">
        <a href="main.jsp">客户端</a>
        <button>
            <a href="index.jsp">登出</a>
        </button>
    </div>
    <div id="user-manage">
        <img src="data:image/jpeg;base64, <%= base64Image %>" alt="">
    </div>
    <div class="user-name-manage">
        <h4>hi，<%=user%>
        </h4>
    </div>
</header>
