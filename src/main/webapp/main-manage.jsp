<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/5
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Title</title>
    <style>
        .main-body-manage{
            background: url("") no-repeat;
            background-size: 100% 100%;
        }

        #right-manage {
            background-color: rgba(255, 255, 255, 0.2);
            margin: 2%;
            width: 75vw;
            height: 85vh;
            float: right;
            display: flex;
        }
    </style>
</head>
<body οnbefοreunlοad="window.location='work/logout.jsp'" class="main-body-manage">
<%
    Object uemail = null;
    Object user = session.getAttribute("user");
    Object email = session.getAttribute("email");
    Object errMsy = session.getAttribute("errMsy");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    String sql;
    String base64Image = null;
    request.setCharacterEncoding("UTF-8");//确保获取的中文不会乱码
    String errorEvent = "邮箱或用户名错误！！";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
        stmt = conn.createStatement();
        sql = "select * from users where email = '" + email + "' and user = '" + user + "'  ";
        rs = stmt.executeQuery(sql);
        if (rs.next()) {
            byte[] imageData = rs.getBytes(7);
            base64Image = Base64.getEncoder().encodeToString(imageData);
        }
    } catch (SQLException e) {
        out.print(e);
        out.print("数据库连接异常！");
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
%>
<%@ include file="base/top-manage.jsp" %>
<div class="content-manage">
    <%@ include file="base/side-manage.jsp" %>
    <div id="right-manage">
        <div class="users-form-manage">
            <%@ include file="main-manage/users-form-manage.jsp" %>
        </div>
        <div class="books-form-manage">
            <%@ include file="main-manage/books-form-manage.jsp" %>
        </div>
        <div class="yybooks-form-manage">
            <%@ include file="main-manage/yybooks-form-manage.jsp" %>
        </div>
        <div class="tjbook-form-manage">
            <%@ include file="main-manage/tjbook-form-manage.jsp" %>
        </div>
        <div class="sen-form-manage">
            <%@ include file="main-manage/sen-form-manage.jsp" %>
        </div>
        <div class="input-book-manage">
            <%@ include file="main-manage/input-book-manage.jsp" %>
        </div>
        <div class="users-jybooks-form-manage">
            <%@ include file="main-manage/users-jybooks-form-manage.jsp" %>
        </div>
        <div class="users-yybooks-form-manage">
            <%@ include file="main-manage/users-yybooks-form-manage.jsp" %>
        </div>
    </div>
</div>
<script>
    const sidemanage = document.querySelectorAll(".menu-item-manage")
    const sideusersmanage = document.querySelector('.side-users-manage')
    const sidebooksmanage = document.querySelector('.side-books-manage')
    const sideyybooksmanage = document.querySelector('.side-yybooks-manage')
    const sidetjbookmanage = document.querySelector('.side-tjbook-manage')
    const sidesenmanage = document.querySelector('.side-sen-manage')

    const usersformmanage = document.querySelector('.users-form-manage')
    const booksformmanage = document.querySelector('.books-form-manage')
    const yybooksformmanage = document.querySelector('.yybooks-form-manage')
    const tjbookformmanage = document.querySelector('.tjbook-form-manage')
    const senformmanage = document.querySelector('.sen-form-manage')
    const inputbookmanage = document.querySelector('.input-book-manage')
    const usersjybooksmanage = document.querySelector('.users-jybooks-form-manage')
    const usersyybooksmanage = document.querySelector(".users-yybooks-form-manage")

    window.onload = function () {
        // document.getElementById("right").style.height = "810px";
        // document.getElementById("left").style.height = "810px";
        let b = 0;
        b = sessionStorage.getItem("ym");
        if (b == null){
            b = '0'
        }
        for (let i = 0; i < sidemanage.length; i++) {
            sidemanage[i].style.background = "rgba(255,255,255,0)";
            sidemanage[i].style.color = "#000"
        }
        usersformmanage.style.display = 'none'
        booksformmanage.style.display = 'none'
        yybooksformmanage.style.display = 'none'
        inputbookmanage.style.display = 'none'
        tjbookformmanage.style.display = 'none'
        senformmanage.style.display = 'none'
        usersjybooksmanage.style.display = 'none'
        usersyybooksmanage.style.display = 'none'
        if (b === '1') {
            sidebooksmanage.style.background = "rgba(236, 236, 236, 0.8)"
            sidebooksmanage.style.color = "#1890FFFF"
            booksformmanage.style.display = 'block'
        }else if (b === '2'){
            sideyybooksmanage.style.background = "rgba(236, 236, 236, 0.8)"
            sideyybooksmanage.style.color = "#1890FFFF"
            yybooksformmanage.style.display = 'block'
        } else if (b === '3') {
            sidetjbookmanage.style.background = "rgba(236, 236, 236, 0.8)"
            sidetjbookmanage.style.color = "#1890FFFF"
            tjbookformmanage.style.display = 'block'
        } else if (b === '4') {
            sidesenmanage.style.background = "rgba(236, 236, 236, 0.8)"
            sidesenmanage.style.color = "#1890FFFF"
            senformmanage.style.display = 'block'
        } else if (b === '0') {
            sideusersmanage.style.background = "rgba(236, 236, 236, 0.8)"
            sideusersmanage.style.color = "#1890FFFF"
            usersformmanage.style.display = 'block'
        }else if(b === '5'){
            inputbookmanage.style.display = 'block'
        }else if (b === '6'){
            usersjybooksmanage.style.display = 'block'
        }else if (b === '7'){
            usersyybooksmanage.style.display = 'block'
        }
    }


    sideusersmanage.addEventListener('click', function () {
        sessionStorage.setItem('ym', '0');
        for (let i = 0; i < sidemanage.length; i++) {
            sidemanage[i].style.background = "rgba(255,255,255,0)";
            sidemanage[i].style.color = "#000"
        }
        sideusersmanage.style.background = "rgba(236, 236, 236, 0.8)"
        sideusersmanage.style.color = "#1890FFFF"
        usersformmanage.style.display = 'block'
        booksformmanage.style.display = 'none'
        yybooksformmanage.style.display = 'none'
        tjbookformmanage.style.display = 'none'
        senformmanage.style.display = 'none'
        inputbookmanage.style.display = 'none'
        usersjybooksmanage.style.display = 'none'
        usersyybooksmanage.style.display = 'none'
    })
    sidebooksmanage.addEventListener('click', function () {
        sessionStorage.setItem('ym', '1');
        for (let i = 0; i < sidemanage.length; i++) {
            sidemanage[i].style.background = "rgba(255,255,255,0)";
            sidemanage[i].style.color = "#000"
        }
        sidebooksmanage.style.background = "rgba(236, 236, 236, 0.8)"
        sidebooksmanage.style.color = "#1890FFFF"
        usersformmanage.style.display = 'none'
        booksformmanage.style.display = 'block'
        yybooksformmanage.style.display = 'none'
        tjbookformmanage.style.display = 'none'
        senformmanage.style.display = 'none'
        inputbookmanage.style.display = 'none'
        usersjybooksmanage.style.display = 'none'
        usersyybooksmanage.style.display = 'none'
    })
    sideyybooksmanage.addEventListener('click', function () {
        sessionStorage.setItem('ym', '2');
        for (let i = 0; i < sidemanage.length; i++) {
            sidemanage[i].style.background = "rgba(255,255,255,0)";
            sidemanage[i].style.color = "#000"
        }
        sideyybooksmanage.style.background = "rgba(236, 236, 236, 0.8)"
        sideyybooksmanage.style.color = "#1890FFFF"
        usersformmanage.style.display = 'none'
        booksformmanage.style.display = 'none'
        yybooksformmanage.style.display = 'block'
        tjbookformmanage.style.display = 'none'
        senformmanage.style.display = 'none'
        inputbookmanage.style.display = 'none'
        usersjybooksmanage.style.display = 'none'
        usersyybooksmanage.style.display = 'none'
    })
    sidetjbookmanage.addEventListener('click', function () {
        sessionStorage.setItem('ym', '3');
        for (let i = 0; i < sidemanage.length; i++) {
            sidemanage[i].style.background = "rgba(255,255,255,0)";
            sidemanage[i].style.color = "#000"
        }
        sidetjbookmanage.style.background = "rgba(236, 236, 236, 0.8)"
        sidetjbookmanage.style.color = "#1890FFFF"
        usersformmanage.style.display = 'none'
        booksformmanage.style.display = 'none'
        yybooksformmanage.style.display = 'none'
        tjbookformmanage.style.display = 'block'
        senformmanage.style.display = 'none'
        inputbookmanage.style.display = 'none'
        usersjybooksmanage.style.display = 'none'
        usersyybooksmanage.style.display = 'none'
    })
    sidesenmanage.addEventListener('click', function () {
        sessionStorage.setItem('ym', '4');
        for (let i = 0; i < sidemanage.length; i++) {
            sidemanage[i].style.background = "rgba(255,255,255,0)";
            sidemanage[i].style.color = "#000"
        }
        sidesenmanage.style.background = "rgba(236, 236, 236, 0.8)"
        sidesenmanage.style.color = "#1890FFFF"
        usersformmanage.style.display = 'none'
        booksformmanage.style.display = 'none'
        yybooksformmanage.style.display = 'none'
        tjbookformmanage.style.display = 'none'
        senformmanage.style.display = 'block'
        inputbookmanage.style.display = 'none'
        usersjybooksmanage.style.display = 'none'
        usersyybooksmanage.style.display = 'none'
    })
</script>
</body>
</html>
