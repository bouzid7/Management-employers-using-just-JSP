
<%-- recuperation des donnees de BD  --%>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
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
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
} catch (Exception e) {
e.printStackTrace();
}
statement=connection.createStatement();
String sql ="select * from emp where id="+id;
resultSet = statement.executeQuery(sql);
resultSet.next();
%>
<%-- --%>
<%@include file="header.html" %>
<div class="container" style="margin-top:5%">

<%

 String se=request.getParameter("session");
 if(se!=null)
 {
   out.print("<div class='alert alert-success' role='alert'> data enregistred with sucess </div> ");
 }

%>
<form class="row g-3" action="" method="post">
  <div class="col-md-4">
    <label for="validationDefault01" class="form-label">Nom</label>
    <input type="text" name="nom" class="form-control" id="validationDefault01" value="<%=resultSet.getString("nom") %>" required>
  </div>
  
  <div class="col-md-4">
    <label for="validationDefault02" class="form-label">Prenom</label>
    <input type="text" name="prenom" class="form-control" id="validationDefault02" value="<%=resultSet.getString("prenom") %>" required>
  </div>
  
  
   <div class="col-md-3">
    <label for="validationDefault05" class="form-label">Date de naissance</label>
    <input type="date" name="dateN" class="form-control" id="validationDefault05" value="<%=resultSet.getString("dateN") %>" required>
  </div>  
  
  
   <div class="form-check form-switch">
  <input class="form-check-input" name="gender" value="F" type="radio" <%-- String g=resultSet.getString("gender");
    		char ch=g.charAt(0);
    		if(ch=='F')
    		{
    			out.print("checked");
    		}
    		 
    		--%>>
  <label class="form-check-label" for="flexSwitchCheckDefault">Female</label>
</div>
  <div class="form-check form-switch">
  <input class="form-check-input" name="gender" value="M" type="radio" 
       <%-- String g1=resultSet.getString("gender");
    		char ch1=g1.charAt(0);
    		if(ch1=='M')
    		{
    			out.print("checked");
    		}
    		 
    		--%>>
  <label class="form-check-label" for="flexSwitchCheckDefault">male</label>
</div>
  
  
   <div class="col-md-3">
    <label for="validationDefault05" class="form-label">Service</label>
    <input type="text" name="service" class="form-control" value="<%=resultSet.getString("service") %>" id="validationDefault05" required>
  </div>
  
 
  <div class="col-md-4">
    <label for="validationDefaultUsername" class="form-label">Email</label>
    <div class="input-group">
      <span class="input-group-text" id="inputGroupPrepend2">@</span>
      <input type="text"  name="email"  class="form-control" id="validationDefaultUsername" value="<%=resultSet.getString("email") %>"  aria-describedby="inputGroupPrepend2" required>
    </div>
  </div>
  
  
  <div class="col-md-3">
    <label for="validationDefault05" class="form-label">Matricule</label>
    <input type="number"  name="matricule" class="form-control" value="<%=resultSet.getString("matricule") %>" id="validationDefault05" required>
  </div>
  
  <div class="col-md-6">
    <label for="validationDefault03" class="form-label">ville</label>
    <input type="text"  name="ville" class="form-control" value="<%=resultSet.getString("ville") %>" id="validationDefault03" required>
  </div>
  <div class="col-md-3">
    <label for="validationDefault04" class="form-label">Statut</label>
    <select class="form-select"  name="statut" id="validationDefault04" required>
     <option value="<%=resultSet.getString("statut") %>" > 
     <%--
     String s=resultSet.getString("statut");
      char h=s.charAt(0);
      if(h=='C')
      {
    	 out.print("célibataire") ;
      }
      else if(h=='M')
      {
    	  out.print("marié") ;
      }
     
     --%>
     </option>
      <option value="M">marié</option>
      <option  value="C">célibataire</option>
    </select>
  </div>
 
<input type="hidden" name="session"  value="data enregistred with sucess" >

  <div class="col-12">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
      <label class="form-check-label" for="invalidCheck2">
        Agree to terms and conditions
      </label>
    </div>
  </div>
  <div class="col-12">
    <button class="btn btn-primary" type="submit">Submit form</button>
  </div>
</form>
<%
String idU = request.getParameter("id");
String nom=request.getParameter("nom");
String prenom=request.getParameter("prenom");
String gender=request.getParameter("gender");
String statut=request.getParameter("statut");
String matricule=request.getParameter("matricule");
String email=request.getParameter("email");
String dateN=request.getParameter("dateN");
String service=request.getParameter("service");
String ville=request.getParameter("ville");

try
{

PreparedStatement ps = null;

ps = connection.prepareStatement("update emp set nom=?,prenom=?,gender=?,statut=?,matricule=?,email=?,dateN=?,service=?,ville=? where id=?");

ps.setString(1,nom);
ps.setString(2,prenom);
ps.setString(3,gender);
ps.setString(4,statut);
ps.setString(5,matricule);
ps.setString(6,email);
ps.setString(7,dateN);
ps.setString(8,service);
ps.setString(9,ville);
ps.setString(10,idU);
ps.executeUpdate();

}

catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

connection.close();

%>
</div>
