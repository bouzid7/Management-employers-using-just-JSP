<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%-- l'insertion des donnees dans la base de donnees  --%>

<%@page import="java.sql.*,java.util.*"%>

<%
String id=request.getParameter("id");

try
{
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empmanagement", "root", "!@#$ZT277359ab");
         Statement st=conn.createStatement();
         st.executeUpdate("delete from emp where id="+id);
         conn.close();
}

        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }

       out.print("<h3> emp successfully  deleted </h3><a href='listEmp.jsp' >list of employees</a>");
 %>