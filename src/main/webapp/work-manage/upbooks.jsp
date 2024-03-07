<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/5
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String book1 = request.getParameter("book1");
    String book2 = request.getParameter("book2");
    String book3 = request.getParameter("book3");
    String book4 = request.getParameter("book4");
    String book5 = request.getParameter("book5");
    String book6 = request.getParameter("book6");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    String sql;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
        stmt = conn.createStatement();
        sql = "update tjbooks set name = '" + book1 + "' where number = '1'";
        stmt.executeUpdate(sql);
        sql = "update tjbooks set name = '" + book2 + "' where number = '2'";
        stmt.executeUpdate(sql);
        sql = "update tjbooks set name = '" + book3 + "' where number = '3'";
        stmt.executeUpdate(sql);
        sql = "update tjbooks set name = '" + book4 + "' where number = '4'";
        stmt.executeUpdate(sql);
        sql = "update tjbooks set name = '" + book5 + "' where number = '5'";
        stmt.executeUpdate(sql);
        sql = "update tjbooks set name = '" + book6 + "' where number = '6'";
        stmt.executeUpdate(sql);
        out.println("<script>");
        out.println("alert('提交成功');");
        out.println("location.href='../main-manage.jsp'");
        out.println("</script>");
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
