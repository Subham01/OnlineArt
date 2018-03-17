package com.globsyn.art;
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
@WebServlet("/ValidLogin")
public class ValidLogin extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        ResultSet rs=null;
		Connection con=null;
		Statement st=null;
        int flag=0;
        String message=null;
        RequestDispatcher rd=request.getRequestDispatcher("/login.jsp"); 
        try
		{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		try {
			String url=getServletConfig().getServletContext().getInitParameter("DB_URL");
			String user=getServletConfig().getServletContext().getInitParameter("DB_USER");
			String pass=getServletConfig().getServletContext().getInitParameter("DB_PASS");
			con=DriverManager.getConnection(url,user,pass);
			st=con.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		// STEP 3- CREATE THE STATEMENT
		try
		{
			st=con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}		
		String SQL = "select * from customer";             
		try
		{
			st.executeQuery(SQL);
			if("".equals(password)&&"".equals(email))
				message="Empty Password and Email";
             else if("".equals(password))
                message="Empty password";
             else if("".equals(email))
                 message="Empty Email";
                        else
                        {
                            rs=st.executeQuery(SQL);
                            while(rs.next())
                            {
                                String mail=rs.getString("EMAILID");
                                String pwd=rs.getString("PASSWORD");
                                if(mail.equalsIgnoreCase(email) && pwd.equals(password))
                                {
                                    
                                    String lname=rs.getString("LASTNAME");
                                    String address=rs.getString("ADDRESS");
                                    String name=rs.getString("FIRSTNAME");
                                    String phone=rs.getString("CONTACT");
                                    HttpSession session=request.getSession();
                                    session.setAttribute("uname", name);
                                    session.setAttribute("lastname",lname);
                                    session.setAttribute("mailid", mail);
                                    session.setAttribute("address",address);
                                    session.setAttribute("contact",phone);
                                    session.setAttribute("id",pwd);
                                    flag=1;
                                    rd=request.getRequestDispatcher("/index.jsp");
                                    break;
                                }
                            }
                            if(flag==0)
                                message="Invalid Details";
                        }
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
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
        request.setAttribute("key", message);
	rd.forward(request, response);
    }
}
