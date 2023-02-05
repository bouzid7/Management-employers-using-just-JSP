
<%@include file="header.html" %>

<div class="container" style="margin-top:5%">
 <% 
 String s=request.getParameter("session");
 if(s!=null)
 {
   out.print("<div class='alert alert-success' role='alert'> data suceffuly inserted </div> ");
 }

%>
<form class="row g-3"  action="" method="post">
  <div class="col-md-4">
    <label for="validationDefault01" class="form-label">Nom</label>
    <input type="text" name="nom" class="form-control" id="validationDefault01"  required>
  </div>
  
  <div class="col-md-4">
    <label for="validationDefault02" class="form-label">Prenom</label>
    <input type="text" name="prenom" class="form-control" id="validationDefault02" required>
  </div>
  
   <div class="form-check form-switch">
  <input class="form-check-input" name="gender" value="F" type="radio">
  <label class="form-check-label" for="flexSwitchCheckDefault">Female</label>
</div>
  <div class="form-check form-switch">
  <input class="form-check-input" name="gender" value="M" type="radio">
  <label class="form-check-label" for="flexSwitchCheckDefault">male</label>
</div> 
  
   <div class="col-md-3">
    <label for="validationDefault05" class="form-label">Date de naissance</label>
    <input type="date" name="dateN" class="form-control" id="validationDefault05" required>
  </div>  
  
   <div class="col-md-3">
    <label for="validationDefault05" class="form-label">Service</label>
    <input type="text" name="service" class="form-control" id="validationDefault05" required>
  </div>
  
 
  <div class="col-md-4">
    <label for="validationDefaultUsername" class="form-label">Email</label>
    <div class="input-group">
      <span class="input-group-text" id="inputGroupPrepend2">@</span>
      <input type="text"  name="email"  class="form-control" id="validationDefaultUsername"  aria-describedby="inputGroupPrepend2" required>
    </div>
  </div>
  
  
  <div class="col-md-3">
    <label for="validationDefault05" class="form-label">Matricule</label>
    <input type="number"  name="matricule" class="form-control" id="validationDefault05" required>
  </div>
  
  <div class="col-md-3">
    <label for="validationDefault03" class="form-label">ville</label>
    <input type="text"  name="ville" class="form-control" id="validationDefault03" required>
  </div>
  <div class="col-md-4">
    <label for="validationDefault04" class="form-label">Statut</label>
    <select class="form-select"  name="statut" id="validationDefault04" required>
      <option value="M">marié</option>
      <option  value="C">célibataire</option>
    </select>
  </div>
  
  <input type="hidden" name="session"  value="data suceffuly inserted" >
 
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
</div>


<%-- l'insertion des donnees dans la base de donnees  --%>

<%@page import="java.sql.*,java.util.*"%>

<%
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
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empmanagement", "root", "!@#$ZT277359ab");
           Statement st=conn.createStatement();
            int i=st.executeUpdate("insert into emp(nom,prenom,gender,statut,matricule,email,dateN,service,ville)values('"+nom+"','"+prenom+"','"+gender+"','"+statut+"','"+matricule+"','"+email+"','"+dateN+"','"+service+"','"+ville+"')");

}

        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }

 %>
