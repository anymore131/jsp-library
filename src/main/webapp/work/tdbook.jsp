<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/1
  Time: 23:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.book.BookData" %>
<%@ page import="java.util.Vector" %>
<%@ page language="java" import="com.book.*" pageEncoding="UTF-8" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    request.setCharacterEncoding("UTF-8");//确保获取的中文不会乱码
    Object user = session.getAttribute("user");
    Object email = session.getAttribute("email");
    String book = request.getParameter("book");
    String bookout = "";
    String[] bookouts = null;
    String bookin = "";
    String[] bookins = new String[999];
    BookData newbook = new BookData();
    int j = 0;
    int key = 0;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
        stmt = conn.createStatement();
        String sql = "select * from users where email = '" + email + "' and user = '" + user + "'  ";
        rs = stmt.executeQuery(sql);
        while (rs.next()) {
            bookout = rs.getString(6);
            bookouts = bookout.split(",");
        }
        j = 0;
        for (int i = 0; i < bookouts.length; i++) {
            if (!bookouts[i].equals(book) && !bookouts[i].equals("")) {
                String temp = bookouts[i];
                bookins[j] = temp;
                j++;
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
        int q = newbook.getRealQuantity() + 1;
        sql = "update books set realQuantity = '" + q + "'where ID = '" + newbook.getID() + "'";
        stmt.executeUpdate(sql);


        for (int i = 0; i < j; i++) {
            bookin = bookin + ',' + bookins[i];
        }
        sql = "update users set bookout = '" + bookin + "' " +
                "where user = '" + user + "' and email = '" + email + "'";
        stmt.executeUpdate(sql);

        response.sendRedirect("../main.jsp");
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