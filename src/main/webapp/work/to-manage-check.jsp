<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/5
  Time: 23:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object grade = session.getAttribute("grade");
    int gnum = Integer.parseInt(grade.toString());
    String gs = "权限不够";
    if (gnum != 2){
        out.println("<script>");
        out.println("alert('" + gs + "');");
        out.println("location.href='../main.jsp'");
        out.println("</script>");
    }else{
        out.println("<script>");
        out.println("location.href='../main-manage.jsp'");
        out.println("</script>");
    }
%>
