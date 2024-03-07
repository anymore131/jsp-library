<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/1/19
  Time: 23:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .sen-up {
        width: 75vw;
        height: 85vh;
        background-color: #fff5;
        box-shadow: 0 8px 16px #0005;
        border-radius: 16px;
        overflow: hidden;
    }

    .sen-up-form {
        margin-top: 20vh;
        padding: 0 25%;
        width: 50%;
    }

    .sen-up-form p{
        font-size: 16px;
        font-weight: 900;
        margin-bottom: 5px;
    }

    textarea {
        border: none;
        outline: none;
        padding: 0;
        resize: none;
        margin: 0;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        background-image: none;
        background-color: transparent;
        font-size: inherit;
        width: 100%;
    }

    textarea:focus {
        outline: none;
    }

    .sen-up-textarea {
        display: inline-block;
        padding: 5px 15px;
        line-height: 1.5;
        box-sizing: border-box;
        color: #606266;
        background-color: #fff;
        border: 1px solid #dcdfe6;
        border-radius: 1vw;
        font-size: 18px;
        transition: border-color 0.2s cubic-bezier(0.645, 0.045, 0.355, 1);
    }

    .sen-up-textarea::placeholder {
        color: #c0c4cc;
    }

    .sen-up-textarea:hover {
        border-color: #c0c4cc;
    }

    .sen-up-textarea:focus {
        border-color: #3677f0;
    }

    .sen-up-btn{
        width: 12vw;
        height: 5vh;
        background-color: #3677f0;
        color: #fff;
        border-radius: 10px;
        border: 0;
        text-align: center;
        margin: 10px auto;
        font-size: 20px;
        cursor: pointer;
        font-family: 微软雅黑, serif;
    }
</style>
<div class="sen-up">
    <div class="sen-up-form">
        <form action="work/sen-up.jsp" class="form" method="post">
            <div>
                <p>每日一句分享:</p>
                <textarea rows="12" cols="140" maxlength="254" class="sen-up-textarea" name="sen"></textarea>
            </div>
            <div style="text-align: center">
                <input type="submit" class="sen-up-btn" value="发送">
            </div>
        </form>
    </div>
</div>

