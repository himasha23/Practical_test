package com.bin.projec.client;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Patientmokup {

	
List<Patient> patients = new ArrayList<Patient>();
	
	//for checking
		public Patientmokup(){
			
			Patient patient1 = new Patient("1","jack","colombo","13244","12","see");
			Patient patient2 = new Patient("2","john","galle","132234","22","redo");
			Patient patient3 = new Patient("3","su","mana","112244","32","nowa");
			
			patients = Arrays.asList(patient1,patient2,patient3);
			
			}
		
		
	public String getPatients() throws SQLException{
			
		String output = ""; 
		
			List<Patient> patients = new ArrayList<Patient>();
			
			output = "<table border=\"1\"><tr><th>id</th><th>name</th><th>address</th><th>mobile</th><th>age</th><th>pwd</th><th>Update</th><th>Remove</th></tr>"; 
			
			ResultSet result = getConnection().createStatement().executeQuery("select * from patient");
			while(result.next()) {
				
				/*Patient pat = new Patient(); */
				
			

				
				String pid = result.getString(1);
				String pname = result.getString(2);
				String paddress = result.getString(3);
				String pmobile = result.getString(4);
				String page = result.getString(5);
				String pwd = result.getString(6);
				
				
				output += "<tr><td><input id=\"hidItemIDUpdate\" name=\"hidItemIDUpdate\"type=\"hidden\" value=\"" + pid + "\">"+ pid + "</td>";
				
				// Add into the html table
				 output += "<tr><td>" + pid + "</td>";
				 output += "<td>" + pname + "</td>";
				 output += "<td>" + paddress + "</td>";
				 output += "<td>" + pmobile + "</td>";
				 output += "<td>" + page + "</td>";
				 output += "<td>" + pwd + "</td>";
				 // buttons
				 output += "<td>"
				 		+ "<input name=\"btnUpdate\" type=\"button\"value=\"Update\" class=\"btnUpdate btn btn-secondary\">"
				 		+ "</td>"+ "<td>"
				 				+ "<form method=\"post\" action=\"index.jsp\">"
				 				+ ""+ "<input name=\"btnRemove\" type=\"submit\" value=\"Remove\"class=\"btn btn-danger\">"
                           + ""+"<input name=\"hidItemIDDelete\" type=\"hidden\" value=\"" + pid+ "\">" + "</form></td></tr>"; 
			
				
				/*patients.add(pat); */
			}
			output += "</table>"; 
			return output; 
		
		
		}
		
		
		
	
		
		public String createpatient(Patient patient) throws Exception{
			
			String output = "";
			
			try {
			
			 PreparedStatement ps = getConnection().prepareStatement("insert into patient (pid,pname,paddress,pmobile,page,pwd) values (?,?,?,?,?,?)");
			ps.setString(1, patient.getPid());
			ps.setString(2, patient.getPname());
			ps.setString(3, patient.getPaddress());
			ps.setString(4, patient.getPmobile());
			ps.setString(5, patient.getPage());
			ps.setString(6, patient.getPwd());
			
			ps.executeUpdate();
			
			
			
			output = "inserted successfully";
			
			}
			
			catch(Exception e)
			{
				output = "error while inserting";
				System.err.println(e.getMessage());
			}
			return output;
			
		}
		
		
		
		
		
		public String updatepatient(Patient patient)
		 {
			String output = "";
		try
		 {
			Connection con = getConnection();
		 if (con == null)
		 {
			 return "Error while connecting to the database for updating."; }
		 
		 String query = "UPDATE patient SET pname=?,pmobile=?,paddress=?,page=?,pwd=? WHERE pid=?";
		 PreparedStatement preparedStmt = con.prepareStatement(query);
		 
		 // binding values
		 preparedStmt.setString(1, patient.getPid());
		 preparedStmt.setString(2, patient.getPname());
		 preparedStmt.setString(3, patient.getPaddress());
		 preparedStmt.setString(4, patient.getPmobile());
		 preparedStmt.setString(5, patient.getPage());
		 preparedStmt.setString(6, patient.getPwd());
		 
		 // execute the statement
		 preparedStmt.execute();
		 
		 
		 output = "Updated successfully";
		 }
		 
		 catch (Exception e)
		 {
		 
			 output = "Error while updating the item.";
		     System.err.println(e.getMessage());
		 
		 }
		 
		 return output;
		 }
		
		
		//delete patient from database
		
		public String droppatient(String pid) throws Exception{
			
			String output = "";
			 try
			 { 
				 
			 
			 PreparedStatement ps = getConnection().prepareStatement("delete from patient where pid=?");
			ps.setString(1, pid);
			
			int count = ps.executeUpdate();
			
			
			
			output = "Deleted successfully"; 
			 }catch (Exception e)
			 {
				 output = "Error while deleting the item.";
				 System.err.println(e.getMessage());
				 } 
			 
			 return output;
	}
		
		
		//databse connection
		
	public Connection getConnection() throws SQLException{
			
			Connection con = null;
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/paf_db","root","");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return con;

	}

}
