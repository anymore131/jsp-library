<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/2/29
  Time: 16:14
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
    int error = 1;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
        stmt = conn.createStatement();
        String sql = "select * from users where email = '" + email + "' and password = '" + password + "'  ";
        rs = stmt.executeQuery(sql);
        while (rs.next()) {
            error = 0;
            String user = rs.getString(1);
            int grade = rs.getInt(3);
            session.setAttribute("grade",grade);
            session.setAttribute("user",user);
            session.setAttribute("email", email);
            session.setAttribute("password", password);
        }
        if (error == 1) {
            session.setAttribute("errMsg", "邮箱或密码错误！！");
            response.sendRedirect("../index.jsp");
        } else {
            response.sendRedirect("../main.jsp");
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
