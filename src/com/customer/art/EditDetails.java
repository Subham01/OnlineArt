package com.customer.art;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EditDetails")
public class EditDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=null;
		Statement st=null;
		Statement st1=null;
		Statement st2=null;
		Statement st3=null;
		Statement st4=null;
		Statement st5=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
				
		//STEP 2   CREATE THE CONNECTION
		try {
			String url=getServletConfig().getServletContext().getInitParameter("DB_URL");
			String user=getServletConfig().getServletContext().getInitParameter("DB_USER");
			String pass=getServletConfig().getServletContext().getInitParameter("DB_PASS");
			con=DriverManager.getConnection(url,user,pass);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		// STEP 3- CREATE THE STATEMENT
		try
		{
			st=con.createStatement();
			st1=con.createStatement();
			st2=con.createStatement();
			st3=con.createStatement();
			st4=con.createStatement();
			st5=con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}             
		try
		{
			HttpSession session=request.getSession();
			String mail=session.getAttribute("mailid").toString();
			String firstname=request.getParameter("first-name");
			String lastname=request.getParameter("last-name");
	        String email=request.getParameter("email");
			String contact=request.getParameter("number");
			String address=request.getParameter("address");
	        String password=request.getParameter("password");
			String sql="update customer set FIRSTNAME='"+firstname+"' where EMAILID='"+mail+"'";
			String sql1="update customer set LASTNAME='"+lastname+"' where EMAILID='"+mail+"'";
			String sql2="update customer set EMAILID='"+email+"' where EMAILID='"+mail+"'";
			String sql3="update customer set CONTACT='"+contact+"' where EMAILID='"+mail+"'";
			String sql4="update customer set ADDRESS='"+address+"' where EMAILID='"+mail+"'";
			String sql5="update customer set PASSWORD='"+password+"' where EMAILID='"+mail+"'";
			st.executeUpdate(sql);
			st1.executeUpdate(sql1);
			st2.executeUpdate(sql2);
			st3.executeUpdate(sql3);
			st4.executeUpdate(sql4);
			st5.executeUpdate(sql5);
			session.setAttribute("uname", firstname);
            session.setAttribute("lastname",lastname);
            session.setAttribute("mailid",email);
            session.setAttribute("address",address);
            session.setAttribute("contact",contact);
            session.setAttribute("id",password);
			RequestDispatcher rd=request.getRequestDispatcher("/user.jsp");
	          rd.forward(request,response);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		//STEP 5-  RELEASE THE QUERY 

		try
		{
			con.close();
			st.close();
			st1.close();
			st2.close();
			st3.close();
			st4.close();
			st5.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

}
