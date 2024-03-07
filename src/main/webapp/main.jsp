<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Title</title>
    <style>
        .main-body{
            /*background: url("img/1.png") no-repeat;*/
            background-size: 100% 100%;
        }

        #right {
            background-color: rgba(255, 255, 255, 0.2);
            margin: 2%;
            width: 75vw;
            height: 85vh;
            float: right;
            display: flex;
        }

        .main-form {
            display: block;
        }

        .searchbook-form {
            display: none;
        }

        .bookget-form {
            display: none;
        }

        .bookwantover-form {
            display: none;
        }

        .bookwant-form {
            display: none;
        }

        .back-form {
            display: none;
        }

        .setting-form {
            display: none;
        }
    </style>
</head>
<body οnbefοreunlοad="window.location='work/logout.jsp'" class="main-body">
<%
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
<%@ include file="base/top.jsp" %>
<div class="content">
    <%@ include file="base/side.jsp" %>

    <div id="right">
        <div class="main-form">
            <%@ include file="main/first-form.jsp" %>
        </div>
        <div class="searchbook-form">
            <%@ include file="main/searchbook.jsp" %>
        </div>
        <div class="bookget-form">
            <%@ include file="main/bookget.jsp" %>
        </div>
        <div class="bookwant-form">
            <%@ include file="main/bookwant.jsp" %>
        </div>
        <div class="bookwantover-form">
            <%@ include file="main/bookwantover.jsp"%>
        </div>
        <div class="back-form">
            <%@ include file="main/senup.jsp" %>
        </div>
        <div class="setting-form">
            <%@ include file="main/setting.jsp" %>
        </div>
    </div>
</div>
<script>
    const side = document.querySelectorAll(".menu-item")
    const sidestart = document.querySelector('.side-start')
    const sidefind = document.querySelector('.side-find')
    const sideget = document.querySelector('.side-get')
    const sidewant = document.querySelector('.side-want')
    const sidewantover = document.querySelector('.side-want-over')
    const sideback = document.querySelector('.side-back')
    const sidesetting = document.querySelector('.side-setting')

    const startform = document.querySelector('.main-form')
    const findform = document.querySelector('.searchbook-form')
    const getform = document.querySelector('.bookget-form')
    const wantform = document.querySelector('.bookwant-form')
    const wantoverform = document.querySelector('.bookwantover-form')
    const backform = document.querySelector('.back-form')
    const settingform = document.querySelector('.setting-form')

    window.onload = function () {
        // document.getElementById("right").style.height = "810px";
        // document.getElementById("left").style.height = "810px";
        let a = 0;
        a = sessionStorage.getItem("ym");
        if (a == null){
            a = '0'
        }
        for (let i = 0; i < side.length; i++) {
            side[i].style.background = "rgba(255,255,255,0)";
            side[i].style.color = "#000"
        }
        startform.style.display = 'none'
        findform.style.display = 'none'
        getform.style.display = 'none'
        wantform.style.display = 'none'
        wantoverform.style.display = 'none'
        backform.style.display = 'none'
        settingform.style.display = 'none'
        if (a === '1') {
            sidefind.style.background = "rgba(236, 236, 236, 0.8)"
            sidefind.style.color = "#1890FFFF"
            findform.style.display = 'block'
        } else if (a === '2') {
            sideget.style.background = "rgba(236, 236, 236, 0.8)"
            sideget.style.color = "#1890FFFF"
            getform.style.display = 'block'
        } else if (a === '3') {
            sidewant.style.background = "rgba(236, 236, 236, 0.8)"
            sidewant.style.color = "#1890FFFF"
            wantform.style.display = 'block'
        } else if (a === '4') {
            sidewantover.style.background = "rgba(236, 236, 236, 0.8)"
            sidewantover.style.color = "#1890FFFF"
            wantoverform.style.display = 'block'
        } else if (a === '5') {
            sideback.style.background = "rgba(236, 236, 236, 0.8)"
            sideback.style.color = "#1890FFFF"
            backform.style.display = 'block'
        } else if (a === '6') {
            sidesetting.style.background = "rgba(236, 236, 236, 0.8)"
            sidesetting.style.color = "#1890FFFF"
            settingform.style.display = 'block'
        } else if (a === '0') {
            sidestart.style.background = "rgba(236, 236, 236, 0.8)"
            sidestart.style.color = "#1890FFFF"
            startform.style.display = 'block'
        }
    }


    sidestart.addEventListener('click', function () {
        sessionStorage.setItem('ym', '0');
        for (let i = 0; i < side.length; i++) {
            side[i].style.background = "rgba(255,255,255,0)";
            side[i].style.color = "#000"
        }
        sidestart.style.background = "rgba(236, 236, 236, 0.8)"
        sidestart.style.color = "#1890FFFF"
        startform.style.display = 'block'
        findform.style.display = 'none'
        getform.style.display = 'none'
        wantform.style.display = 'none'
        wantoverform.style.display = 'none'
        backform.style.display = 'none'
        settingform.style.display = 'none'
    })
    sidefind.addEventListener('click', function () {
        sessionStorage.setItem('ym', '1');
        for (let i = 0; i < side.length; i++) {
            side[i].style.background = "rgba(255,255,255,0)";
            side[i].style.color = "#000"
        }
        sidefind.style.background = "rgba(236, 236, 236, 0.8)"
        sidefind.style.color = "#1890FFFF"
        startform.style.display = 'none'
        findform.style.display = 'block'
        getform.style.display = 'none'
        wantform.style.display = 'none'
        wantoverform.style.display = 'none'
        backform.style.display = 'none'
        settingform.style.display = 'none'
    })
    sideget.addEventListener('click', function () {
        sessionStorage.setItem('ym', '2');
        for (let i = 0; i < side.length; i++) {
            side[i].style.background = "rgba(255,255,255,0)";
            side[i].style.color = "#000"
        }
        sideget.style.background = "rgba(236, 236, 236, 0.8)"
        sideget.style.color = "#1890FFFF"
        startform.style.display = 'none'
        findform.style.display = 'none'
        getform.style.display = 'block'
        wantform.style.display = 'none'
        wantoverform.style.display = 'none'
        backform.style.display = 'none'
        settingform.style.display = 'none'
    })
    sidewant.addEventListener('click', function () {
        sessionStorage.setItem('ym', '3');
        for (let i = 0; i < side.length; i++) {
            side[i].style.background = "rgba(255,255,255,0)";
            side[i].style.color = "#000"
        }
        sidewant.style.background = "rgba(236, 236, 236, 0.8)"
        sidewant.style.color = "#1890FFFF"
        startform.style.display = 'none'
        findform.style.display = 'none'
        getform.style.display = 'none'
        wantform.style.display = 'block'
        wantoverform.style.display = 'none'
        backform.style.display = 'none'
        settingform.style.display = 'none'
    })
    sidewantover.addEventListener('click', function () {
        sessionStorage.setItem('ym', '4');
        for (let i = 0; i < side.length; i++) {
            side[i].style.background = "rgba(255,255,255,0)";
            side[i].style.color = "#000"
        }
        sidewantover.style.background = "rgba(236, 236, 236, 0.8)"
        sidewantover.style.color = "#1890FFFF"
        startform.style.display = 'none'
        findform.style.display = 'none'
        getform.style.display = 'none'
        wantform.style.display = 'none'
        wantoverform.style.display = 'block'
        backform.style.display = 'none'
        settingform.style.display = 'none'
    })
    sideback.addEventListener('click', function () {
        sessionStorage.setItem('ym', '5');
        for (let i = 0; i < side.length; i++) {
            side[i].style.background = "rgba(255,255,255,0)";
            side[i].style.color = "#000"
        }
        sideback.style.background = "rgba(236, 236, 236, 0.8)"
        sideback.style.color = "#1890FFFF"
        startform.style.display = 'none'
        findform.style.display = 'none'
        getform.style.display = 'none'
        wantform.style.display = 'none'
        wantoverform.style.display = 'none'
        backform.style.display = 'block'
        settingform.style.display = 'none'
    })
    sidesetting.addEventListener('click', function () {
        sessionStorage.setItem('ym', '6');
        for (let i = 0; i < side.length; i++) {
            side[i].style.background = "rgba(255,255,255,0)";
            side[i].style.color = "#000"
        }
        sidesetting.style.background = "rgba(236, 236, 236, 0.8)"
        sidesetting.style.color = "#1890FFFF"
        startform.style.display = 'none'
        findform.style.display = 'none'
        getform.style.display = 'none'
        wantform.style.display = 'none'
        wantoverform.style.display = 'none'
        backform.style.display = 'none'
        settingform.style.display = 'block'
    })

</script>
</body>
</html>
