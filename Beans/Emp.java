package EmpManagement.beans;

public class Emp {

	private int id;  
	private String nom;  
	private String prenom;  
	private String gender ;  
	private String statut ;  
	private int matricule ;
	private String email ;  
	private String  dateN ;  
	private String service ;  
	private String ville ;  
	
	//getters 
	
    public int getId()
    {
    	return this.id;
    }
    
    public String getNom()
    {
    	return this.nom;
    }
    public String getPrenom()
    {
    	return this.prenom;
    }
    public String getGender()
    {
    	return this.gender;
    }
    public String getStatut()
    {
    	return this.statut;
    }
    public int  getMatricule()
    {
    	return this.matricule;
    }
    public String getEmail()
    {
    	return this.email;
    }
    public String getDateN()
    {
    	return this.dateN;
    }
    public String getService()
    {
    	return this.service;
    }
    public String getVille()
    {
    	return this.ville;
    }
    
	//setters 
	
    public void setId(int id)
    {
    	this.id=id;
    }
    public void setNom(String nom)
    {
    	this.nom=nom;
    }
    
    public void setPrenom(String prenom)
    {
    	this.prenom=prenom;
    }
    
    public void setGender(String gender)
    {
    	this.gender=gender;
    }
    
    public void setStatut(String statut)
    {
    	this.statut=statut;
    }
    
    public void setMatricule(int matricule)
    {
    	this.matricule=matricule;
    }
    
    public void setEmail(String email)
    {
    	this.email=email;
    }
    
    public void setDateN(String dateN)
    {
    	this.dateN=dateN;
    }
    
    public void setService(String service)
    {
    	this.service=service;
    }
    
    public void setVille(String ville)
    {
    	this.ville=ville;
    }
    
 

}
