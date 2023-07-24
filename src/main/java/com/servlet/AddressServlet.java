package com.servlet;

import java.io.IOException;



import com.entities.Address;
import com.helper.AlertManager;
import com.model.AddressModel;
import com.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AddressServlet
 */
public class AddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AddressServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 String place=request.getParameter("place");
	 String name=request.getParameter("name");
	 String phone=request.getParameter("phone");
	 String house=request.getParameter("house");
	 String street=request.getParameter("street");
	 String city=request.getParameter("city");
	 String state=request.getParameter("state");
	 String pincode=request.getParameter("pincode");
	
	 String category=request.getParameter("category");
	 Cookie[] cookies=request.getCookies();
		int userid = 0;
		if(cookies!=null){
			for(Cookie cookie:cookies){
				if(cookie.getName().equals("user")) userid = Integer.parseInt(cookie.getValue());
			}
		}
	  
	 try {
		new AddressModel().create(new Address(place,name, phone, house, street, city, state, pincode,new UserModel().find(userid)));
	
		new AlertManager().addAlert(response, "Address", "Address Add  Successfully", "success");
		 if(category!=null) {
			    response.sendRedirect("Module-I/laundry.jsp?category="+category);
			    }
			    response.sendRedirect("address.jsp");
	 } catch (Exception e) {
		// TODO: handle exception
	}
		
		
	}

}
