<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/2/29
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    request.setCharacterEncoding("UTF-8");//确保获取的中文不会乱码
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String user = request.getParameter("user");
    String errorEvent = "邮箱或用户名错误！！";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
        stmt = conn.createStatement();
        String sql = "select * from users where email = '" + email + "' and user = '" + user + "'  ";
        rs = stmt.executeQuery(sql);
        while (rs.next()) {
            errorEvent = null;
        }
        if (errorEvent == null) {
            sql = "update users set password = '" + password +"' " +
                    "where user = '" + user + "' and email = '" + email +"'";
            stmt.executeUpdate(sql);
            session.setAttribute("errMsg", "修改成功");
            response.sendRedirect("../index.jsp");
        } else {
            session.setAttribute("errMsg", errorEvent);
            response.sendRedirect("../index.jsp");
        }
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
</body>
</html>
