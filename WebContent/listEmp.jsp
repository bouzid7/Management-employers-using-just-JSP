<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- recuperation des donnees de BD  --%>

 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="EmpManagement.beans.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database ="empmanagement";
String userid = "root";
String password = "!@#$ZT277359ab";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%-- --%>


<!DOCTYPE html>
<html>
<head>
<%@include file="header.html" %>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
<div class="container" style="margin-top:10%;overflow:hidden" >
<button type="button" class="btn btn-primary">Listes des employes</button>
 <br>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">#id</th>
      <th scope="col">Nom</th>
      <th scope="col">Prenom</th>
      <th scope="col">Gender</th>
      <th scope="col">Statut</th>
      <th scope="col">Matricule</th>
      <th scope="col">Email</th>
      <th scope="col">Date de naissance</th>
      <th scope="col">Service</th>
      <th scope="col">Ville</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
 <%
 
List<Emp> list=new ArrayList<Emp>();  
 
String spageid=request.getParameter("page");  
int pageid=Integer.parseInt(spageid);  
int total=5;  
if(pageid==1){}  
else{  
    pageid=pageid-1;  
    pageid=pageid*total+1;  
}  

try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();

String sql ="select * from emp limit"+(pageid-1)+","+total;

resultSet = statement.executeQuery("select * from emp limit 5");

while(resultSet.next()){
    Emp e=new Emp();  
    e.setId(resultSet.getInt(1));  
    e.setNom(resultSet.getString(2));  
    e.setPrenom(resultSet.getString(3)); 
    e.setGender(resultSet.getString(4)); 
    e.setStatut(resultSet.getString(5)); 
    e.setMatricule(resultSet.getInt(6));
    e.setEmail(resultSet.getString(7));
    e.setDateN(resultSet.getString(8));
    e.setService(resultSet.getString(9));
    e.setVille(resultSet.getString(10));
    list.add(e);  
}

for(Emp e:list){
%>

<tr>
  
      <th scope="row"><%=e.getId()%></th>
      <td><%=e.getNom() %></td>
      <td><%=e.getPrenom() %></td>
      <td><%=e.getGender() %></td>
      <td><%=e.getStatut() %></td>
      <td><%=e.getMatricule() %></td>
      <td><%=e.getEmail() %></td>
      <td><%=e.getDateN() %></td>
      <td><%=e.getService() %></td>
      <td><%=e.getVille() %></td>
      <td>
<a href="updateEmp.jsp?id=<%=e.getId()%>" style="background-color:greenyellow;" class="btn btn-default border">update <i class="fa fa-edit"></i></a>
<a href="deleteEmp.jsp?id=<%=e.getId()%>" class="btn btn-default border rem_form" ><span class="fa fa-trash text-danger"></span></a>
      </td>
      
</tr>

<%
}

connection.close();
} catch (Exception e) {
e.printStackTrace();
}    %>

  </tbody>
</table>
<a href="listEmp.jsp?page=1">1</a>  
<a href="listEmp.jsp?page=2">2</a>  
<a href="listEmp.jsp?page=3">3</a>  
</div>
</body>
</html>