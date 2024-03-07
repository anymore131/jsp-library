<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/5
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String uemail = request.getParameter("uemail");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    String sql;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
        stmt = conn.createStatement();
        sql = "update users set grade = '1' where email = '" + uemail + "'";
        stmt.executeUpdate(sql);
        out.println("<script>");
        out.println("alert('降低成功');");
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