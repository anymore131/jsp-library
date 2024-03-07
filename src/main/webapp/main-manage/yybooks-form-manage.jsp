<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/5
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.book.BookData" %>
<style>
    * {
        padding: 0;
        margin: 0;
    }

    main.yybook-table {
        width: 75vw;
        height: 85vh;
        background-color: #fff5;
        box-shadow: 0 8px 16px #0005;
        border-radius: 16px;
        overflow: hidden;
    }

    .yybook-search-header {
        width: 95%;
        height: 10%;
        background-color: #fff4;
        padding: 0 2.5%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .yybook-search-header .input-group {
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

    .yybook-search-header .input-group:hover {
        width: 45%;
        background-color: #fff8;
        box-shadow: 0 5px 40px #0002;
    }

    .yybook-search-header .input-group input:focus+.yybook-search-header .input-group {
        width: 45%;
        background-color: #fff8;
        box-shadow: 0 5px 40px #0002;
    }

    .yybook-search-header .input-group:focus {
        width: 45%;
        background-color: #fff8;
        box-shadow: 0 5px 40px #0002;
    }

    .yybook-search-header .input-group img {
        width: 20px;
        height: 20px;
    }

    .yybook-search-header .input-group input {
        width: 100%;
        background-color: transparent;
        border: none;
        outline: none;
    }

    .yybook-shell {
        width: 95%;
        max-height: calc(90% - 25px);
        background-color: #fffb;
        margin: 8px auto;
        border-radius: 10px;
        overflow: auto;
        overflow: overlay;
    }

    .yybook-shell::-webkit-scrollbar {
        width: 10px;
        height: 10px;
    }

    .yybook-search-table {
        width: 100%;
    }

    .yybook-search-table,.yybook-search-table th,.yybook-search-table td {
        border-collapse: collapse;
        padding: 20px;
        text-align: left;
    }

    .yybook-search-thead th {
        position: sticky;
        top: 0;
        left: 0;
        background-color: #d5d1defe;
        cursor: pointer;
    }

    .yybook-search-tbody tr:nth-child(ecen) {
        background-color: #0000000b;
    }

    .yybook-search-tbody tr:hover {
        background-color: #fff6 !important;
    }

    .yybook-search-tbody tr td form button {
        width: 80px;
        padding: 5px 0;
        border-radius: 40px;
        text-align: center;
        background-color: #6fcaca;
        color: #111;
    }

    .yybook-search-tbody tr td form input {
        width: 80px;
        padding: 5px 0;
        border-radius: 40px;
        text-align: center;
        background-color: #6fcaca;
        color: #111;
    }

    .yybook--manage{
        cursor: pointer;
        width: 80px;
        padding: 5px 0;
        border-radius: 40px;
        text-align: center;
        background-color: #6fcaca;
        color: #111;
    }

</style>
<main class="yybook-table">
    <section class="yybook-search-header">
        <h2>预约页面</h2>
    </section>
    <section class="yybook-shell">
        <table class="yybook-search-table">
            <thead class="yybook-search-thead">
            <tr>
                <th class="c2">书名</th>
                <th class="c3">作者</th>
                <th class="c4">出版社</th>
                <th class="c7">时间</th>
                <th class="c1">编号</th>
                <th>添加</th>
            </tr>
            </thead>
            <tbody class="yybook-search-tbody">
            <%
                String btn = null;
                conn = null;
                stmt = null;
                rs = null;
                String newbookwant = null;
                String[] newbookwants = null;
                try {
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
                    stmt = conn.createStatement();
                    sql = "select * from users";
                    rs = stmt.executeQuery(sql);
                    while (rs.next()) {
                        newbookwant = rs.getString(8);
                        if (newbookwant != null) {
                            if (!newbookwant.equals("null") && !newbookwant.equals("")) {
                                newbookwants = newbookwant.split("#");
                            }
                        }
                    }
                    if (newbookwants != null) {
                        for (int i = 0; i < newbookwants.length; i++) {
                            if (newbookwants[i] != null || !newbookwants[i].equals("")) {
                                String[] wants = null;
                                wants = newbookwants[i].split("\\|");
                                String a, b, c, d, e;
                                a = wants[0];
                                b = wants[1];
                                c = wants[2];
                                d = wants[3];
                                sql = "select * from books where name = '" + a
                                        + "' and author = '" + b
                                        + "' and press = '" + c + "'";
                                rs = stmt.executeQuery(sql);
                                if (rs.next()) {
                                    e = rs.getString(1);
                                } else {
                                    btn = "";
                                    e = "还未有此书";
                                }
            %>
            <tr>
                <td class="c2"><%=a%>
                </td>
                <td class="c3"><%=b%>
                </td>
                <td class="c4"><%=c%>
                </td>
                <td class="c7"><%=d%>
                </td>
                <td class="c1"><%=e%>
                </td>
                <td>
                    <div class="yybook--manage" id="<%=a%>" he1="<%=b%>" he2="<%=c%>" onclick="os5(this);os()">增加</div>
                </td>
            </tr>
            <%

                    } else {
                        break;
                    }
                }
            } else {
            %>
            <tr>
                <td class="c1" colspan="5" style="text-align: center">没有记录</td>
            </tr>
            <%

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
    <script>
        function os5(obj) {
            const newname = obj.getAttribute('id');
            const newauthor = obj.getAttribute("he1")
            const newpress = obj.getAttribute("he2")

            sessionStorage.setItem('ym', '5');
            for (let i = 0; i < sidemanage.length; i++) {
                sidemanage[i].style.background = "rgba(255,255,255,0)";
                sidemanage[i].style.color = "#000"
            }
            usersformmanage.style.display = 'none'
            booksformmanage.style.display = 'none'
            yybooksformmanage.style.display = 'none'
            tjbookformmanage.style.display = 'none'
            senformmanage.style.display = 'none'
            inputbookmanage.style.display = 'block'

            const bookid = document.getElementById("ID");
            const bookname = document.getElementById("name");
            const bookauthor = document.getElementById("author");
            const bookpress = document.getElementById("press");
            const bookrealq = document.getElementById("realQuantity");
            const booktotalq = document.getElementById("totalQuantity");
            bookid.value = ""
            bookname.value = newname;
            bookauthor.value = newauthor;
            bookpress.value = newpress;
            booktotalq.value = ""
            bookrealq.value = ""
        }
    </script>
</main>
