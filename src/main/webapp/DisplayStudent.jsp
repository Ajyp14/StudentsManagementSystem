<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.tca.entities.Student" %>
<%@ include file="header.jsp" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
   </head>
  <body>
  
  <% 
  	//Logic for Search button keep rno and (clear when we click referesh button) 
	 String trno = request.getParameter("rno");  
	 if(trno==null)
			trno="";
  			
  	 String sbtn = request.getParameter("sbtn");
  		if(sbtn!=null && sbtn.equals("Refresh"))
  			trno="";
  
  %>
    
<div class="container " style="margin-top: 100px;" >
	<h2 class="text-center mb-4 text-primary">Student Information</h2>    

<%-- Search box logic --%>	
	<div class="container-fluid mb-3 d-flex justify-content-end">
	
    <form class="d-flex" role="search" method="post" action="./DisplayStudent">
     
      <input class="form-control me-2" type="search" name="rno" value="<%= trno %>" placeholder="Enter Roll Number" aria-label="Search"/>
      <button class="btn btn-outline-success" type="submit" name="sbtn" value="Search">Search</button>
      <button class="btn btn-outline-success ms-2" type="submit" name="sbtn" value="Refresh">Refresh</button>
      
    </form>
  </div>
	
<%-- Table Logic --%>	
	<table class="table table-hover table-bordered text-center" >
	  <thead>
    <tr class="table-dark">
      <th scope="col">RollNo</th>
      <th scope="col">Name</th>
      <th scope="col">Percentage</th>
    </tr>
  </thead>
  
  <tbody>
    <%
      List<Student> list=(List<Student>)request.getAttribute("listOfStduents");
    
    	if(list==null || list.isEmpty())
    	{
  %>
  			<tr>
  				<td colspan="3" >No data Found</td>
  			</tr>
  
  <% 		
    	}
    	else
    	{
    		for(Student student : list)
    		{
    			int rno =student.getRno();
    			String name = student.getName();
    			double per = student.getPer();
    			String cls ="";
    			
    			if(per <= 35)
    			{
    				cls="table-danger";
    			}
 		%>
 		<tr class="<%= cls %>" >
 				<td><%= rno %></td>
 				<td><%= name %></td>
 				<td><%= per %></td>
 		</tr>  	 
    
    	
    <% 			
    		}
    	}
    %>
    </tbody>
 </table>
    
  </div>  
    
   </body>
</html>