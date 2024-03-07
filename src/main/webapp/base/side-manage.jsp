<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/5
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    * {
        margin: 0;
        padding: 0;
    }

    #left-manage{
        margin: 2%;
        width: 15vw;
        height: 85vh;
        background-color: rgba(255, 255, 255, 0.2);
        box-shadow: 0 8px 16px #0005;
        border-radius: 16px;
        display: inline-block;
    }
    .menu-manage{
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
    .menu-title-manage {
        border-radius: 1vw;
        text-align: center;
        margin-bottom: 10px;
    }
    .menu-item-manage>label{
        position: relative;
        width: 100%;
        height: 40px;
        background-color: rgba(255, 255, 255, 0.2);
        border-radius: 2px;
        display: flex;
        align-items: center;
    }
    .menu-item-manage>label:hover {
        background-color: rgba(236, 236, 236, 0.8);
        color: #1890FFFF;
    }
    .menu-item-manage div{
        position: relative;
        width: 100%;
        height: 40px;
        background-color: rgba(255, 255, 255, 0.2);
        border-radius: 2px;
        display: flex;
        align-items: center;
    }
    .menu-item-manage div:hover {
        background-color: rgba(236, 236, 236, 0.8);
        color: #1890FFFF;
    }
    .menu-item-manage>label>span {
        flex: 1;
    }
    .menu-item-manage>div>span {
        flex: 1;
    }
</style>
<div id="left-manage">
    <div class="menu-manage">
        <div class="menu-title-manage">
            <h2>菜&nbsp;&nbsp;&nbsp;单</h2>
        </div>
        <div class="menu-item-manage side-users-manage">
            <div>
                <span class="side-users-manage">用户管理</span>
            </div>
        </div>
        <div class="menu-item-manage side-books-manage">
            <label>
                <span class="side-books-manage">书籍管理</span>
            </label>
        </div>
        <div class="menu-item-manage side-yybooks-manage">
            <label>
                <span class="side-yybooks-manage">预约信息</span>
            </label>
        </div>
        <div class="menu-item-manage side-tjbook-manage">
            <label>
                <span class="side-tjbook-manage">推荐图书</span>
            </label>
        </div>
        <div class="menu-item-manage side-sen-manage">
            <label>
                <span class="side-sen-manage">每日一句管理</span>
            </label>
        </div>
    </div>
</div>
