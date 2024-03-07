<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/3
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.book.BookData" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<body>
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
                user = session.getAttribute("user");
                email = session.getAttribute("email");
                conn = null;
                stmt = null;
                rs = null;
                String bookwant = null;
                String[] bookwants = null;
                try {
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
                    stmt = conn.createStatement();
                    sql = "select * from users where email = '" + email + "' and user = '" + user + "'  ";
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
</body>
</html>
</body>
</html>
