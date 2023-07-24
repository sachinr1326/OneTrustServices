package com.servlet;

import java.io.IOException;
import java.io.InputStream;

import com.entities.ImageMessage;
import com.model.ImageMessageModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


/**
 * Servlet implementation class MessageIconUpload
 */
@MultipartConfig
public class MessageIconUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public MessageIconUpload() {
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		
		try {
			Part part = request.getPart("image");
			InputStream is=null;
			if(part != null)
			 is= part.getInputStream();
			byte[] image =new byte[is.available()];
			is.read(image);
			String tab=request.getParameter("tab");
			String name=request.getParameter("name");
			new ImageMessageModel().create(new ImageMessage(image, name));
			
			 response.sendRedirect("masterpage.jsp?tab="+tab);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
