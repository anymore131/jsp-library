<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/5
  Time: 0:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.book.BookData" %>
<%
    int sen_num = 0;
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    request.setCharacterEncoding("UTF-8");//确保获取的中文不会乱码
    String sen = request.getParameter("sen");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
        stmt = conn.createStatement();
        String sql = "select * from mrsentence where sen = '" + sen + "'";
        rs = stmt.executeQuery(sql);
        if (rs.next()) {
            out.println("<script>");
            out.println("alert(\"已有这句话\")");
            out.println("location.href='../main.jsp'");
            out.println("</script>");
        }else{
            sen_num++;
            sql = "insert into mrsentence values('2','" + sen + "','" + sen_num + "');";
            stmt.executeUpdate(sql);
            out.println("<script>");
            out.println("alert(\"添加成功\");");
            out.println("location.href='../main.jsp'");
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
