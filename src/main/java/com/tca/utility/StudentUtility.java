package com.tca.utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tca.database.MySQLConnectivity;
import com.tca.entities.Student;

public class StudentUtility {
    
	public static boolean addStudent(Student student)
	{
		
          Connection con= MySQLConnectivity.getConnection();
          int flag=0;
          
          try {
            con.setAutoCommit(false);

			PreparedStatement preparedStatement =con.prepareStatement("insert into student value(?,?,?)");
			preparedStatement.setInt(1, student.getRno());
			preparedStatement.setString(2, student.getName());
			preparedStatement.setDouble(3, student.getPer());
			
			 flag=preparedStatement.executeUpdate();
			 con.commit(); 
			 
		} catch (SQLException e) {
			
			try {
				con.rollback();
			} catch (SQLException e1) {
				
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			MySQLConnectivity.closeConnection(con);
		}
          
		  return flag>0;
		
	}
	
	public static List<Student> getAllStudents()
	{
		
		Connection connection=MySQLConnectivity.getConnection();
		PreparedStatement preparedStatement=null;
		List<Student> students= new ArrayList<>();
		ResultSet resultSet=null;
		try {
			preparedStatement=connection.prepareStatement("select * from student");
		    resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next())
			{

				students.add(new Student(resultSet.getInt("rno"),resultSet.getString("name"),resultSet.getDouble("per")));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				resultSet.close();
				preparedStatement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			MySQLConnectivity.closeConnection(connection);
			 
		}
		return students;
	}
	
	public static List<Student> getStudent(int rno)
	{
		
		
		
		Connection connection=MySQLConnectivity.getConnection();
		PreparedStatement preparedStatement=null;
		List<Student> students= new ArrayList<>();
		ResultSet resultSet=null;
		try {
			 preparedStatement=connection.prepareStatement("select * from student where rno=?");
			preparedStatement.setInt(1, rno);
		    resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next())
			{
				students.add(new Student(resultSet.getInt("rno"),resultSet.getString("name"),resultSet.getDouble("per")));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				resultSet.close();
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			MySQLConnectivity.closeConnection(connection);			 
		}
		return students;
	}
	
	public static String deleteStudent(int rno)
	{
		Connection connection=MySQLConnectivity.getConnection();
		PreparedStatement preparedStatement=null;
		try {
			preparedStatement=connection.prepareStatement("delete from student where rno=?");
			preparedStatement.setInt(1, rno);
			preparedStatement.executeUpdate();
			
			return "success";
			
		} catch (SQLException e) {
			e.printStackTrace();
			return "failed";
		}finally {
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			MySQLConnectivity.closeConnection(connection);
			
		}
	}
	
	public static String updateStudent(int rno,String name,double per)
	{
		Connection connection=MySQLConnectivity.getConnection();
		PreparedStatement preparedStatement=null;
		try {
			preparedStatement=connection.prepareStatement("update student set name=?,per=? where rno=?");
			preparedStatement.setString(1, name);
			preparedStatement.setDouble(2, per);
			preparedStatement.setInt(3, rno);
			preparedStatement.executeUpdate();
			
			System.out.println("update student utility");
			return "success";
		} catch (SQLException e) {
			e.printStackTrace();
			return "failed";
		}finally {
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			MySQLConnectivity.closeConnection(connection);	
		}
	}

}
