package com.tca.student;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.tca.entities.Student;
import com.tca.utility.StudentUtility;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/UpdateStudent")
public class UpdateStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           
           List<Student> students=StudentUtility.getAllStudents();
        
           System.out.println("I am in  UpdateStudent get methd");
           
        	   request.setAttribute("listOfStduents", students);
        	   RequestDispatcher rd = request.getRequestDispatcher("UpdateStudent.jsp");
        	   rd.forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Update logic	
		
		String sbtn = request.getParameter("sbtn");
		
		System.out.println("Hey ajju : "+sbtn);
		
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
	     	   RequestDispatcher rd = request.getRequestDispatcher("UpdateStudent.jsp");
	     	   rd.forward(request, response);
			}catch (Exception e) {
				request.setAttribute("excMsg", "Wrong Data");
		     	   RequestDispatcher rd = request.getRequestDispatcher("UpdateStudent.jsp");
		     	   rd.forward(request, response);
			}
			
			}   
		}else if(sbtn.equals("update"))
		{
			response.setContentType("text/html");
			PrintWriter outn=response.getWriter();
			
			int rno = Integer.parseInt(request.getParameter("srno"));
			String name = request.getParameter("sname");
			double per = Double.parseDouble(request.getParameter("sper")); 
			
			System.out.println("uss : "+rno+"---"+name+"----"+per+"----");
			String msg=StudentUtility.updateStudent(rno, name, per);
			
			outn.println(msg);
			
		}
	}

}
