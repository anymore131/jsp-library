<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/5
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.book.BookData" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" import="com.book.*" pageEncoding="UTF-8" %>
<%@ page import="java.util.Objects" %>
<html>
<head>
    <title>Title</title>
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        main.table-users-manage {
            width: 75vw;
            height: 85vh;
            background-color: #fff5;
            box-shadow: 0 8px 16px #0005;
            border-radius: 16px;
            overflow: hidden;
        }

        .users-search-header {
            width: 95%;
            float: left;
            height: 10%;
            background-color: #fff4;
            padding: 0 2.5%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .users-manage {
            margin-right: 2vw;
            width: 80px;
            padding: 5px 0;
            border-radius: 40px;
            text-align: center;
            background-color: rgba(0, 196, 196, 0.38);
            color: #111;
        }

        .users-manage:hover {
            background-color: rgba(238, 82, 0, 0.38);
            cursor: pointer;
        }

        .users-shell {
            width: 95%;
            max-height: calc(90% - 25px);
            background-color: #fffb;
            margin: 8px auto;
            border-radius: 10px;
            overflow: auto;
            overflow: overlay;
        }

        .users-shell::-webkit-scrollbar {
            width: 10px;
            height: 10px;
        }

        .users-search-table {
            width: 100%;
        }

        .users-search-table, .users-search-table th, .users-search-table td {
            border-collapse: collapse;
            padding: 20px;
            text-align: left;
        }

        .users-search-thead th {
            position: sticky;
            top: 0;
            left: 0;
            background-color: #d5d1defe;
            cursor: pointer;
        }

        .users-search-tbody tr:nth-child(ecen) {
            background-color: #0000000b;
        }

        .users-search-tbody tr:hover {
            background-color: #fff6 !important;
        }

        .users-search-tbody tr td form button {
            width: 80px;
            padding: 5px 0;
            border-radius: 40px;
            text-align: center;
            background-color: #6fcaca;
            color: #111;
        }

        .users-search-tbody tr td form input {
            width: 80px;
            padding: 5px 0;
            border-radius: 40px;
            text-align: center;
            background-color: #6fcaca;
            color: #111;
        }

        .users-look-manage {
            width: 80px;
            padding: 5px 0;
            border-radius: 40px;
            text-align: center;
            background-color: #6fcaca;
            color: #111;
        }


    </style>
</head>
<body class="users-search-body">
<main class="table-users-manage">
    <section class="users-search-header">
        <h2>用户管理</h2>
    </section>
    <section class="users-shell">
        <table class="users-search-table">
            <thead class="users-search-thead">
            <tr>
                <th class="c1">用户名</th>
                <th class="c2">密码</th>
                <th class="c3">权限</th>
                <th class="c4">邮箱</th>
                <th class="c5">提高权限</th>
                <th>查看借阅记录</th>
                <th>查看预约记录</th>
            </tr>
            </thead>
            <tbody class="users-search-tbody">
            <%
                String style2 = "";
                String style1 = "";
                conn = null;
                stmt = null;
                rs = null;
                try {
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
                    stmt = conn.createStatement();
                    sql = "select * from users";
                    rs = stmt.executeQuery(sql);
                    while (rs.next()) {
                        if (rs.getInt(3) == 1) {
                            style2 = "disabled style=\"background: rgba(255, 46, 46, 0.6); color: rgb(255, 255, 255);\"";
                            style1 = "";
                        } else {
                            style2 = "";
                            style1 = "disabled style=\"background: rgba(255, 46, 46, 0.6); color: rgb(255, 255, 255);\"";
                        }
            %>
            <tr>
                <td class="c1"><%=rs.getString(1)%>
                </td>
                <td class="c2"><%=rs.getString(2)%>
                </td>
                <td class="c3"><%=rs.getInt(3)%>
                </td>
                <td class="c4"><%=rs.getString(4)%>
                </td>
                <td class="c7">
                    <form action="work-manage/upgrade.jsp" method="post">
                        <input type="hidden" value="<%=rs.getString(4)%>" name="uemail">
                        <input type="submit" value="提高" <%=style1%> name="">
                    </form>
                    <form action="work-manage/downgrade.jsp" method="post">
                        <input type="hidden" value="<%=rs.getString(4)%>" name="uemail">
                        <input type="submit" value="降低" <%=style2%> name="">
                    </form>
                </td>
                <td>
                    <form action="main-manage.jsp">
                        <input type="hidden" value="<%=rs.getString(4)%>" name="uemail">
                        <input type="submit" class="users-look-manage" name="" onclick="os3(this);" value="借阅记录">
                    </form>
                </td>
                <td>
                    <form action="main-manage.jsp">
                        <input type="hidden" value="<%=rs.getString(4)%>" name="uemail">
                        <input type="submit" class="users-look-manage" name="" onclick="os4(this);" value="预约记录">
                    </form>
                </td>
            </tr>
            <%

                        rs.getString(1);
                    }
                } catch (Exception e) {
                    throw new RuntimeException(e);
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
            </tbody>
        </table>
    </section>
</main>
<script>
    window.onload = function () {
        sessionStorage.clear()
    }

    function os3(obj) {
        obj.getAttribute('name')
        sessionStorage.setItem('ym', '6');
        for (let i = 0; i < sidemanage.length; i++) {
            sidemanage[i].style.background = "rgba(255,255,255,0)";
            sidemanage[i].style.color = "#000"
        }
        usersformmanage.style.display = 'none'
        booksformmanage.style.display = 'none'
        yybooksformmanage.style.display = 'none'
        tjbookformmanage.style.display = 'none'
        senformmanage.style.display = 'none'
        inputbookmanage.style.display = 'none'
        usersjybooksmanage.style.display = 'block'
        usersyybooksmanage.style.display = 'none'

    }

    function os4(obj) {
        sessionStorage.setItem('ym', '7');
        for (let i = 0; i < sidemanage.length; i++) {
            sidemanage[i].style.background = "rgba(255,255,255,0)";
            sidemanage[i].style.color = "#000"
        }
        usersformmanage.style.display = 'none'
        booksformmanage.style.display = 'none'
        yybooksformmanage.style.display = 'none'
        tjbookformmanage.style.display = 'none'
        senformmanage.style.display = 'none'
        inputbookmanage.style.display = 'none'
        usersjybooksmanage.style.display = 'none'
        usersyybooksmanage.style.display = 'block'

    }
</script>
</body>
</html>
