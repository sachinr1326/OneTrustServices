package com.servlet;

import java.io.IOException;
import java.io.InputStream;

import com.entities.User;
import com.helper.AlertManager;
import com.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;



/**
 * Servlet implementation class UpdateProfileServlet
 */
@MultipartConfig
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public UpdateProfileServlet() {
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

     try {
			
			Part part = request.getPart("image1");
			InputStream is=null;
			if(part != null)
			 is= part.getInputStream();
			byte[] image =new byte[is.available()];
			is.read(image);
			String userid=request.getParameter("userid");
			User user = new UserModel().find(userid);
			user.setImage(image);
			new UserModel().update(user);
			 new AlertManager().addAlert(response, "Profile", "profile Updated Successfully", "success");
				
			 response.sendRedirect("myprofile.jsp");
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
