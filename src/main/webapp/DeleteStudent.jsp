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
    <script>
   			function modify(srno)
   			{
					console.log("In js modify");
			//fetc(URL,{method,body})
				fetch("http://localhost:8080/00-jsp-servlet-App/DeleteStudent",
						{	
							method: "POST",
							body:new URLSearchParams({'srno':srno,'sbtn':"delete"})
						}
				      )
				.then(resp=>resp.text())
				.then(data=>
							{
								if(data.trim()=="success")
								{
  									alert("record is Deleted for Roll Number"+srno);
  									
  									//delete <tr>
  									var tr=document.getElementById(srno);
  									tr.remove();
								}
								else if(data.trim()=="failed")
								{
									alert("Unable to deleted record");								
								}
							}
				       )
				       .catch(error => console.error("MY Error while Deleting",error))
   			}
    
    </script>
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
	
    <form class="d-flex" role="search" method="post" action="./DeleteStudent">
     
      <input class="form-control me-2" type="search" name="rno" value="<%= trno %>" placeholder="Enter Roll Number" aria-label="Search"/>
      <button class="btn btn-outline-success" type="submit" name="sbtn" value="Search">Search</button>
      <button class="btn btn-outline-success ms-2" type="submit" name="sbtn" value="Refresh">Refresh</button>
      
    </form>
  </div>
	
<%-- Table Logic --%>	
	<table class="table table-hover table-bordered text-center">
	  <thead>
    <tr class="table-dark">
      <th scope="col">RollNo</th>
      <th scope="col">Name</th>
      <th scope="col">Percentage</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  
  <tbody>
    <%
      List<Student> list=(List<Student>)request.getAttribute("listOfStduents");
    
    	if(list==null || list.isEmpty())
    	{
  %>
  			<tr>
  				<td colspan="4" >No data Found</td>
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
 		<tr id="<%= rno %>" class="<%= cls %>" >
 				<td><%= rno %></td>
 				<td><%= name %></td>
 				<td><%= per %></td>
 				<td><input type="button" value="delete" class="btn btn-outline-danger" name="sbtn" onclick="modify(<%= rno %>)"></td>
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