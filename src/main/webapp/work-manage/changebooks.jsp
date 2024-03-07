<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/5
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.book.BookData" %>
<%
    Object s = session.getAttribute("searchbook");
    String ID = request.getParameter("ID");
    String name = request.getParameter("name");
    String author = request.getParameter("author");
    String press = request.getParameter("press");
    String totalQuantity = request.getParameter("totalQuantity");
    String realQuantity = request.getParameter("realQuantity");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    request.setCharacterEncoding("UTF-8");//确保获取的中文不会乱码
    String err = "添加成功";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
        stmt = conn.createStatement();
        String sql = "select * from books where ID = '" + ID + "'";
        rs = stmt.executeQuery(sql);
        if (!rs.next()) {
            sql = "insert into books values('" + ID + "','" + name + "','" +
                    author + "','" + press + "','" + realQuantity + "','" + totalQuantity + "');";
            stmt.executeUpdate(sql);
        } else {
            err = "修改成功";
            sql = "update books set name = '" + name + "',author = '" +
                    author + "',press = '" + press + "',realQuantity = '" +
                    realQuantity + "',totalQuantity = '" + totalQuantity + "'where ID = '" + ID + "'";
            stmt.executeUpdate(sql);
        }
        out.println("<script>");
        out.println("alert('" + err + "');");
        out.println("location.href='../main-manage.jsp'");
        out.println("</script>");

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