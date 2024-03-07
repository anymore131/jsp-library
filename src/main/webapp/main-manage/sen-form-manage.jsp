<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/5
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.sen.SenData" %>
<%@ page import="com.book.BookData" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.sql.*" %>
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

        main.sen-table {
            width: 75vw;
            height: 85vh;
            background-color: #fff5;
            box-shadow: 0 8px 16px #0005;
            border-radius: 16px;
            overflow: hidden;
        }

        .sen-search-header {
            width: 95%;
            height: 10%;
            background-color: #fff4;
            padding: 0 2.5%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .sen-search-header .input-group img {
            width: 20px;
            height: 20px;
        }

        .sen-search-header .input-group input {
            width: 100%;
            background-color: transparent;
            border: none;
            outline: none;
        }

        .sen-shell {
            width: 95%;
            max-height: calc(90% - 25px);
            background-color: #fffb;
            margin: 8px auto;
            border-radius: 10px;
            overflow: auto;
            overflow: overlay;
        }

        .sen-shell::-webkit-scrollbar {
            width: 10px;
            height: 10px;
        }

        .sen-search-table {
            width: 100%;
        }

        .sen-search-table, .sen-search-table th, .sen-search-table td {
            border-collapse: collapse;
            padding: 20px;
            text-align: left;
        }

        .sen-search-thead th {
            position: sticky;
            top: 0;
            left: 0;
            background-color: #d5d1defe;
            cursor: pointer;
        }

        .sen-search-tbody tr:nth-child(ecen) {
            background-color: #0000000b;
        }

        .sen-search-tbody tr:hover {
            background-color: #fff6 !important;
        }

        .sen-search-tbody tr td button {
            width: 80px;
            padding: 5px 0;
            border-radius: 40px;
            text-align: center;
            background-color: #6fcaca;
            color: #111;
        }
    </style>
</head>
<body>
<main class="sen-table">
    <section class="sen-search-header">
        <h2>每日一句</h2>
    </section>
    <section class="sen-shell">
        <table class="sen-search-table">
            <thead class="sen-search-thead">
            <tr>
                <th class="c1">每日一句</th>
                <th class="c2">启用</th>
            </tr>
            </thead>
            <tbody class="sen-search-tbody">
            <%
                Vector<SenData> sens = new Vector<>();
                conn = null;
                stmt = null;
                rs = null;
                int sennum = 0;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
                    stmt = conn.createStatement();
                    sql = "select * from mrsentence";
                    rs = stmt.executeQuery(sql);
                    while (rs.next()){
                        SenData sen = new SenData();
                        sen.setSen_right(rs.getInt(1));
                        sen.setSen(rs.getString(2));
                        sen.setSen_num(rs.getInt(3));
                        sens.add(sen);
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
                for (SenData sen : sens) {
                    sennum++;
                    String senright = "";
                    String senright2 = "";
                    if (sen.getSen_right() == 1){
                        senright = "style=\"background: rgba(255, 46, 46, 0.6); color: rgb(255, 255, 255);\"";
                        senright2 = "已";
                    }
            %>
            <tr>
                <td><%=sen.getSen()%>
                </td>
                <td>
                    <form action="work-manage/upsen.jsp">
                        <input type="hidden" value="<%=sennum%>" name="sen-num">
                        <input type="hidden" value="<%=sen.getSen_right()%>>" name="sen-right">
                        <input type="hidden" value="<%=sen.getSen()%>" name="sen">
                        <button type="submit"  value="sen" class="sen" <%=senright%>><%=senright2%>启用</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </section>
</main>
</body>
</html>
