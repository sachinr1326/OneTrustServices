package com.servlet;


import java.io.IOException;
import java.io.InputStream;

import com.entities.Laundryservices;
import com.helper.AlertManager;
import com.model.LaundryModel;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
public class LaundryServicesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
    public LaundryServicesServlet() {
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
		      String service=request.getParameter("service");
		     String price=request.getParameter("price");
		     String item1=request.getParameter("item1");
		     String item2=request.getParameter("item2");
		     String item3=request.getParameter("item3");
		     String categorys=request.getParameter("category");
		     String per=request.getParameter("per");
				
		
		     Laundryservices laundryservices= new Laundryservices(service, price, item1, item2, item3,image,categorys,per);
		     new LaundryModel().create(laundryservices);
	     
		     new AlertManager().addAlert(response, "Service", "Service  Add  Successfully", "success");
				
		     response.sendRedirect("Module-I/laundry.jsp?category="+categorys);
		     
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
	
	}
	

}
