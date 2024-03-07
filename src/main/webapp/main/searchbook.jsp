<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/1/20
  Time: 0:03
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

        main.table {
            width: 75vw;
            height: 85vh;
            background-color: #fff5;
            box-shadow: 0 8px 16px #0005;
            border-radius: 16px;
            overflow: hidden;
        }

        .search-header {
            width: 95%;
            height: 10%;
            background-color: #fff4;
            padding: 0 2.5%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .search-header .input-group {
            width: 35%;
            height: 50%;
            background-color: #fff5;
            padding: 0 20px;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: .2s;
        }

        .search-header .input-group:hover {
            width: 45%;
            background-color: #fff8;
            box-shadow: 0 5px 40px #0002;
        }

        .search-header .input-group input:focus+.search-header .input-group {
            width: 45%;
            background-color: #fff8;
            box-shadow: 0 5px 40px #0002;
        }

        .search-header .input-group:focus {
            width: 45%;
            background-color: #fff8;
            box-shadow: 0 5px 40px #0002;
        }

        .search-header .input-group img {
            width: 20px;
            height: 20px;
        }

        .search-header .input-group input {
            width: 100%;
            background-color: transparent;
            border: none;
            outline: none;
        }

        .shell {
            width: 95%;
            max-height: calc(90% - 25px);
            background-color: #fffb;
            margin: 8px auto;
            border-radius: 10px;
            overflow: auto;
            overflow: overlay;
        }

        .shell::-webkit-scrollbar {
            width: 10px;
            height: 10px;
        }

        .search-table {
            width: 100%;
        }

        .search-table,.search-table th,.search-table td {
            border-collapse: collapse;
            padding: 20px;
            text-align: left;
        }

        .search-thead th {
            position: sticky;
            top: 0;
            left: 0;
            background-color: #d5d1defe;
            cursor: pointer;
        }

        .search-tbody tr:nth-child(ecen) {
            background-color: #0000000b;
        }

        .search-tbody tr:hover {
            background-color: #fff6 !important;
        }

        .search-tbody tr td form button {
            width: 80px;
            padding: 5px 0;
            border-radius: 40px;
            text-align: center;
            background-color: #6fcaca;
            color: #111;
        }

        .search-tbody tr td form input {
            width: 80px;
            padding: 5px 0;
            border-radius: 40px;
            text-align: center;
            background-color: #6fcaca;
            color: #111;
        }

    </style>
</head>
<body class="search-body">
<main class="table">
    <form action="main.jsp">
        <section class="search-header">
            <div class="input-group">
                <input type="search" class="form-input" name="searchbook" placeholder="Search for..."
                       id="searchbook" required="required" onblur="ob();" onfocus="of();">
                <img src="" alt="">
            </div>
        </section>
    </form>
    <section class="shell">
        <table class="search-table">
            <thead class="search-thead">
            <tr>
                <th class="c1">编号</th>
                <th class="c2">书名</th>
                <th class="c3">作者</th>
                <th class="c4">出版社</th>
                <th class="c5">剩余数目</th>
                <th class="c6">总数目</th>
                <th class="c7">订阅情况</th>
            </tr>
            </thead>
            <tbody class="search-tbody">
            <%
                String s = request.getParameter("searchbook");
                session.setAttribute("searchbook",s);
                Vector<BookData> books = new Vector<>();
                String text = "";
                String ID, name, author, press;
                int realQuantity = 0, totalQuantity = 0;
                conn = null;
                stmt = null;
                rs = null;
                String bookget = null;
                String[] bookgets = null;
                if (s != null) {
                    try {
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
                        stmt = conn.createStatement();
                        sql = "select * from books";
                        rs = stmt.executeQuery(sql);
                        while (rs.next()) {
                            BookData book = new BookData();
                            book.setID(rs.getString(1));
                            book.setName(rs.getString(2));
                            book.setAuthor(rs.getString(3));
                            book.setPress(rs.getString(4));
                            book.setRealQuantity(rs.getInt(5));
                            book.setTotalQuantity(rs.getInt(6));
                            books.add(book);
                        }
                        //
                        sql = "select * from users where email = '" + email + "' and user = '" + user + "'  ";
                        rs = stmt.executeQuery(sql);
                        while (rs.next()) {
                            bookget = rs.getString(6);
                            bookgets = bookget.split(",");
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
                    for (int i = 0; i < books.size(); i++) {
                        String s1 = "";
                        BookData book = books.get(i);
                        ID = book.getID();
                        for (int j = 0; j < bookgets.length; j++) {
                            if (ID.equals(bookgets[j]) || book.getRealQuantity() == 0) {
                                s1 = "disabled style=\"background: rgba(255, 46, 46, 0.6); color: rgb(255, 255, 255);\"";
                            }
                        }
                        name = book.getName();
                        author = book.getAuthor();
                        press = book.getPress();
                        realQuantity = book.getRealQuantity();
                        totalQuantity = book.getTotalQuantity();
                        if (stringExist(name, s) || stringExist(author, s) || stringExist(press, s) || stringExist(ID, s)) {
            %>
            <tr>
                <td class="c1"><%=ID%>
                </td>
                <td class="c2"><%=name%>
                </td>
                <td class="c3"><%=author%>
                </td>
                <td class="c4"><%=press%>
                </td>
                <td class="c5"><%=realQuantity%>
                </td>
                <td class="c6"><%=totalQuantity%>
                </td>
                <td class="c7">
                    <form action="work/dybook.jsp" method="post">
                        <input type="hidden" name="searchbook" value="<%=s%>">
                        <button type="submit" value="<%=ID%>" onsubmit="dy(this);" name="book" <%=s1%> class="<%=ID%>">订阅</button>
                    </form>
                </td>
            </tr>
            <%
                        s1 = "";
                    }
                }
                if (books.size() == 0) {
            %>
            <tr>
                <td colspan="7" style="text-align:center;">未查到与该关键字有关的书集</td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="7" style="text-align:center;">请输入你想查询的书</td>
            </tr>
            <%
                }
                request.setAttribute("searchbook", null);
            %>
            </tbody>
        </table>
    </section>
</main>
<script>
    window.onload = function () {
        sessionStorage.clear()
    }

    function dy(obj) {
        const cla = obj.getAttribute('class');
        const clas = '.' + cla;
        const btn = document.querySelector(clas);
        btn.style.background = 'rgba(255,46,46,0.6)'
        btn.style.color = '#fff'
        btn.disabled = true;
    }

    function of() {
        const inp = document.querySelector(".input-group")
        inp.style.width = '45%'
        inp.style.background = '#fff8'
        inp.style.boxShadow =  '0 5px 40px #0002';
    }

    function ob(){
        const inp = document.querySelector('.input-group')
        inp.style.width = '35%'
        inp.style.boxShadow = ''
        inp.style.background = '#fff5'
    }
</script>
</body>
</html>
<%!
    public boolean stringExist(String s1, String s2) {
        int is1, is2;
        int k = 0;
        if (s2 != null) {
            is1 = s1.length();
            is2 = s2.length();
            if (is2 > is1) {
                return false;
            } else {
                int j = 0;
                for (int i = 0; i < is1; i++) {
                    char cs1 = s1.charAt(i);
                    char cs2 = s2.charAt(j);
                    if (cs1 == cs2) {
                        j++;
                    }
                    if (j >= is2) {
                        k = 1;
                        break;
                    }
                }
                if (k == 1) {
                    return true;
                } else {
                    return false;
                }
            }
        }
        return false;
    }
%>
