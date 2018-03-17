package com.customer.art;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session=request.getSession();
            session.removeAttribute("uname");
            session.removeAttribute("item");
            session.removeAttribute("pname");
            session.removeAttribute("pprice");
            session.removeAttribute("fname");
            session.removeAttribute("lname");
            session.removeAttribute("phone");
            session.removeAttribute("emailid");
            session.removeAttribute("addr");
            session.removeAttribute("lastname");
            session.removeAttribute("emailid");
            session.removeAttribute("contact");
            session.removeAttribute("address");
            session.removeAttribute("id");
            session.removeAttribute("alternateaddress");
            session.removeAttribute("key1");
            session.invalidate();
            HttpSession session1=request.getSession();
            session1.setAttribute("call","available");
            response.sendRedirect("index.jsp");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
/*
 String msg=session.getAttribute("uname").toString();
            msg="Sign In";
            session.setAttribute("uname", msg);
            RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
*/