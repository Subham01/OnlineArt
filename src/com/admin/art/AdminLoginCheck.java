package com.admin.art;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/AdminLoginCheck")
public class AdminLoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ID=request.getParameter("admin_id");
        String password=request.getParameter("admin_password");
        RequestDispatcher rd=request.getRequestDispatcher("/admin.jsp");
        String message="";
        if("".equals(ID)&&"".equals(password))
            message="Empty password and ID";
        else if("".equals(ID))
            message="Empty ID";
        else if("".equals(password))
            message="Empty Password";
        else
        {
            if("admin".equals(ID)&&"admin".equals(password))
                rd=request.getRequestDispatcher("/AdminControl.jsp");
            else
                message="Invalid";
        }
        request.setAttribute("key", message);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
