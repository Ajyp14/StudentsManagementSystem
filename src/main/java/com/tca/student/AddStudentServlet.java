package com.tca.student;

import java.io.IOException;

import java.io.PrintWriter;

import com.tca.entities.Student;
import com.tca.utility.StudentUtility;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/AddStudents")
public class AddStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
		
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		String name = request.getParameter("name");
		double per = Double.parseDouble(request.getParameter("per"));
		String msg;
		
	
		
		boolean flag=StudentUtility.addStudent(new Student(rno, name, per));
		
		
		if(flag)
		{
			msg="<div class=\"alert alert-success mt-3 text-center\" role=\"alert\"> Record saved successfully for roll number : "+rno+"</div>";
		}else {
			msg="<div class=\"alert alert-danger mt-3 text-center\" role=\"alert\"> Unable to save record "+rno+"</div>" ;
		}
		request.setAttribute("msg", msg);
		RequestDispatcher rd = request.getRequestDispatcher("AddStudent.jsp");
		rd.forward(request, response);
		
		out.println(msg);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("AddStudent.jsp");
		rd.forward(request, response);
		
//		response.sendRedirect("Add.jsp");
	}
}
