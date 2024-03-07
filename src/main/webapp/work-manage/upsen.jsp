<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/5
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    request.setCharacterEncoding("UTF-8");//确保获取的中文不会乱码
    String sen = request.getParameter("sen");
    String sen_right = request.getParameter("sen-right");
    String sen_num = request.getParameter("sen-num");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
        stmt = conn.createStatement();
        String sql;
        if (sen_right.equals("1")) {
            sql = "update mrsentence set right = 2 where row ( " + sen_num + " );";
            stmt.executeUpdate(sql);
            out.println("<script>");
            out.println("alert(\"取消启用成功\")");
            out.println("location.href='../main-manage.jsp'");
            out.println("</script>");
        } else {
            sql = "update mrsentence set right = 1 where row ( " + sen_num + " );";
            stmt.executeUpdate(sql);
            out.println("<script>");
            out.println("alert(\"启用成功\")");
            out.println("location.href='../main-manage.jsp'");
            out.println("</script>");
        }
    } catch (SQLException e) {
        out.println(e);
        out.println("数据库连接异常！");
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
