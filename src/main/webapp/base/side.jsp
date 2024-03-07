<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/1/12
  Time: 23:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        #left{
            margin: 2%;
            width: 15vw;
            height: 85vh;
            background-color: rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 16px #0005;
            border-radius: 16px;
            display: inline-block;
        }
        .menu{
            letter-spacing: 0.5px;
            font-weight: 600;
            position: relative;
            padding: 6px 12px;
            box-sizing: border-box;
            background-color: rgba(255, 255, 255, 0.2);
            font-size: 18px;
            cursor: pointer;
            color: #000;
        }
        .menu-title {
            border-radius: 1vw;
            text-align: center;
            margin-bottom: 10px;
        }
        .menu-item>label{
            position: relative;
            width: 100%;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 2px;
            display: flex;
            align-items: center;
        }
        .menu-item>label:hover {
            background-color: rgba(236, 236, 236, 0.8);
            color: #1890FFFF;
        }
        .menu-item div{
            position: relative;
            width: 100%;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 2px;
            display: flex;
            align-items: center;
        }
        .menu-item div:hover {
            background-color: rgba(236, 236, 236, 0.8);
            color: #1890FFFF;
        }
        .menu-item>label>span {
            flex: 1;
        }
        .set-line {
            margin: 20px 0 10px 0;
            width: 100%;
            height: 2px;
            background-color: rgba(45, 44, 44, 0.8);
        }
    </style>
</head>
<body>
<div id="left">
    <div class="menu">
        <div class="menu-title">
            <h2>菜&nbsp;&nbsp;&nbsp;单</h2>
        </div>
        <div class="menu-item side-start">
            <div>
                <span class="side-start">首页</span>
            </div>
        </div>
        <div class="set-line"></div>
        <div class="menu-item side-find">
            <label>
                <span class="side-find">图书查询</span>
            </label>
        </div>
        <div class="menu-item side-get">
            <label>
                <span class="side-get">查询已借阅</span>
            </label>
        </div>
        <div class="menu-item side-want">
            <label>
                <span class="side-want">预约图书</span>
            </label>
        </div>
        <div class="menu-item side-want-over">
            <label>
                <span class="side-want-over">查询已预约</span>
            </label>
        </div>
        <div class="menu-item side-back">
            <label>
                <span class="side-back">分享</span>
            </label>
        </div>
        <div class="set-line"></div>
        <div class="menu-item side-setting">
            <label>
                <span class="side-setting">设置</span>
            </label>
        </div>
    </div>
</div>
</body>
</html>
