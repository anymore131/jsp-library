<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/5
  Time: 21:02
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
<main class="table">
    <section class="search-header">
        <h2>预约记录</h2>
    </section>
    <section class="shell">
        <table class="search-table">
            <thead class="search-thead">
            <tr>
                <th class="c2">书名</th>
                <th class="c3">作者</th>
                <th class="c4">出版社</th>
                <th class="c7">时间</th>
                <th class="c1">编号</th>
            </tr>
            </thead>
            <tbody class="search-tbody">
            <%
                uemail = request.getParameter("uemail");
                conn = null;
                stmt = null;
                rs = null;
                String bookwant = null;
                String[] bookwants = null;
                try {
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
                    stmt = conn.createStatement();
                    sql = "select * from users where email = '" + uemail + "'";
                    rs = stmt.executeQuery(sql);
                    if (rs.next()) {
                        bookwant = rs.getString(8);
                        if (bookwant != null) {
                            if (!bookwant.equals("null") && !bookwant.equals("")) {
                                bookwants = bookwant.split("#");
                            }
                        }
                    }
                    if (bookwants != null) {
                        for (int i = 0; i < bookwants.length; i++) {
                            if (bookwants[i] != null || !bookwants[i].equals("")) {
                                String[] wants = null;
                                wants = bookwants[i].split("\\|");
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
</main>