<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/1
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.book.BookData" %>
<%
    String s = request.getParameter("searchbook");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    request.setCharacterEncoding("UTF-8");//确保获取的中文不会乱码
    Object user = session.getAttribute("user");
    Object email = session.getAttribute("email");
    String book = request.getParameter("book");
    String bookout = null;
    String[] bookouts = null;
    BookData newbook = new BookData();
    int  key = 0;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
        stmt = conn.createStatement();
        String sql = "select * from users where email = '" + email + "' and user = '" + user + "'  ";
        rs = stmt.executeQuery(sql);
        while (rs.next()) {
            bookout = rs.getString(6);
            if (!bookout.equals("null") && !bookout.equals("")){
                bookouts = bookout.split(",");
            }
        }
        if (bookouts != null){
            for (int i = 0; i < bookouts.length; i++) {
                if (bookouts[i].equals(book)){
                    key = 1;
                }
            }
        }

        sql = "select * from books where ID = '" + book + "'";
        rs = stmt.executeQuery(sql);
        while (rs.next()) {
            newbook.setID(rs.getString(1));
            newbook.setName(rs.getString(2));
            newbook.setAuthor(rs.getString(3));
            newbook.setPress(rs.getString(4));
            newbook.setRealQuantity(rs.getInt(5));
            newbook.setTotalQuantity(rs.getInt(6));
        }
        int q = newbook.getRealQuantity() - 1;
        sql = "update books set realQuantity = '" + q + "'where ID = '" + newbook.getID() + "'";
        stmt.executeUpdate(sql);

        if (key == 0){
            bookout = bookout + ',' + book;
            sql = "update users set bookout = '" + bookout +"' " +
                    "where user = '" + user + "' and email = '" + email +"'";
            stmt.executeUpdate(sql);
        }
//        out.print("../main.jsp?searchbook=" + s);
        request.setCharacterEncoding("utf-8");
        response.sendRedirect("../main.jsp?searchbook=" + URLEncoder.encode(s, "utf-8"));
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