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
				var tr= document.getElementById(srno);     //tr is hook on <tr> tag
				var td=tr.getElementsByTagName("td");       //<tr> <td-0> <td-1> <td-2> <td-3> <tr>
			//srno=td.textContent();
				var sname = td[1].querySelector("input").value;
				var sper = td[2].querySelector("input").value;
				
			//fetc(URL,{method,body})
				fetch("http://localhost:8080/00-jsp-servlet-App/UpdateStudent",
						{	
							method: "POST",
							body:new URLSearchParams({'srno':srno,'sname':sname,'sper':sper,'sbtn':"update"})
						}
				      )
				.then(resp=>resp.text())
				.then(data =>
							{
								if(data.trim()=="success")
								{
  									alert("record is Updated for Roll Number"+srno);
  									
  								}
								else if(data.trim()=="failed")
								{
									alert("FAiled to Update Record for Roll Number :"+srno);								
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
	
    <form class="d-flex" role="search" method="post" action="./UpdateStudent">
     
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
 				<td><input class="form-control me-2 border-danger" type="text" value="<%= name %>" required > </td>
 				<td><input class="form-control me-2 border-danger" type="text" value="<%= per %>" required></td>
 				<td><input type="button" value="update" class="btn btn-primary" name="sbtn" onclick="modify(<%= rno %>)"></td>
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