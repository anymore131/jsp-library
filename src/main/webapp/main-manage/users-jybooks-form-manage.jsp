<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/5
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <h2>借书记录</h2>
    </section>
    <section class="shell">
        <table class="search-table">
            <thead class="search-thead">
            <tr>
                <th class="c1">编号</th>
                <th class="c2">书名</th>
                <th class="c3">作者</th>
                <th class="c4">出版社</th>
            </tr>
            </thead>
            <tbody class="search-tbody">
            <%
                uemail = request.getParameter("uemail");
                Vector<BookData> books2 = new Vector<>();
                conn = null;
                stmt = null;
                rs = null;
                String bookout = null;
                String[] bookouts = null;
                try {
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
                    stmt = conn.createStatement();
                    sql = "select * from users where email = '" + uemail + "'";
                    rs = stmt.executeQuery(sql);
                    while (rs.next()) {
                        bookout = rs.getString(6);
                        if (!bookout.equals("null") && !bookout.equals("")) {
                            bookouts = bookout.split(",");
                        }
                    }
                    if (bookouts != null) {
                        for (int i = 0; i < bookouts.length; i++) {
                            sql = "select * from books where ID = '" + bookouts[i] + "'";
                            rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                BookData book2 = new BookData();
                                book2.setID(rs.getString(1));
                                book2.setName(rs.getString(2));
                                book2.setAuthor(rs.getString(3));
                                book2.setPress(rs.getString(4));
                                book2.setRealQuantity(rs.getInt(5));
                                book2.setTotalQuantity(rs.getInt(6));
                                books2.add(book2);
                            }
                        }
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
                for (int i = 0; i < books2.size(); i++) {
                    BookData book = books2.get(i);
            %>
            <tr>
                <td class="c1"><%=book.getID()%>
                </td>
                <td class="c2"><%=book.getName()%>
                </td>
                <td class="c3"><%=book.getAuthor()%>
                </td>
                <td class="c4"><%=book.getPress()%>
                </td>
            </tr>
            <%
                }
                if (books2.size() == 0) {
            %>
            <tr>
                <td class="c1" colspan="5" style="text-align: center">没有借书记录</td>
            </tr>
            <%
                }
                request.setAttribute("searchbook", null);
            %>
            </tbody>
        </table>
    </section>
</main>