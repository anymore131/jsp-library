<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/3
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    request.setCharacterEncoding("UTF-8");//确保获取的中文不会乱码
    Object email = session.getAttribute("email");
    Object user = session.getAttribute("user");
    String name = request.getParameter("name");
    String author = request.getParameter("author");
    String press = request.getParameter("press");
    String time = "";
    String all = "";
    String a = "";
    String errorEvent = "已有此书";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
        stmt = conn.createStatement();

        LocalDate ld = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        time = ld.format(formatter).toString();
        all = name + "|" + author + "|" + press + "|" + time + "#";

        String sql = "select * from users where email = '" + email + "' and user = '" + user + "'  ";
        rs = stmt.executeQuery(sql);
        if (rs.next()) {
            a = rs.getString(8);
            if (a != null) {
                a = a + all;
            } else {
                a = all;
            }
        }
        sql = "select * from books where name = '" + name
                + "' and author = '" + author
                + "' and press = '" + press + "'";
        rs = stmt.executeQuery(sql);
        if (!rs.next()) {
            sql = "update users set bookwant = '" + a + "' " +
                    "where user = '" + user + "' and email = '" + email + "'";
            stmt.executeUpdate(sql);
            errorEvent = "预约成功";
        }
        out.println("<script>");
        out.println("alert('" + errorEvent + "');");
        out.println("location.href='../main.jsp'");//跳转到用户列表页面
        out.println("</script>");
//        response.sendRedirect("../main.jsp");
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
