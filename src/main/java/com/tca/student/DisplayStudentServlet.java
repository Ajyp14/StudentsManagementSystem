package com.tca.student;

import java.io.IOException;
import java.util.List;

import com.tca.entities.Student;
import com.tca.utility.StudentUtility;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/DisplayStudent")
public class DisplayStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           
           List<Student> students=StudentUtility.getAllStudents();
        
        	   request.setAttribute("listOfStduents", students);
        	   RequestDispatcher rd = request.getRequestDispatcher("DisplayStudent.jsp");
        	   rd.forward(request, response);
        	   
           
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String sbtn = request.getParameter("sbtn");
		
		
		if(sbtn.equals("Refresh") )
		{
			doGet(request, response);
		}
		else if(sbtn.equals("Search"))
		{	
			String rno=request.getParameter("rno");
			
			if(rno.isEmpty())
			{
				doGet(request, response);
			}
			else {
			try {	
			List<Student> students=StudentUtility.getStudent(Integer.parseInt(rno));
			
			request.setAttribute("listOfStduents", students);
	     	   RequestDispatcher rd = request.getRequestDispatcher("DisplayStudent.jsp");
	     	   rd.forward(request, response);
			}catch (Exception e) {
				request.setAttribute("excMsg", "Wrong Data");
		     	   RequestDispatcher rd = request.getRequestDispatcher("DisplayStudent.jsp");
		     	   rd.forward(request, response);
			}
			
			}
			
     	   
		}
	}

}
