package com.helper;



import com.entities.Alert;
import com.model.AlertModel;

import jakarta.servlet.http.Cookie;

import jakarta.servlet.http.HttpServletResponse;

public class AlertManager {

		public void addAlert(HttpServletResponse response,String title,String message,String tag) {
			Alert alert=new Alert(title, message, tag);

			new AlertModel().create(alert);
			
			Cookie cookie=new Cookie("toast", ""+alert.getId());
			cookie.setPath("/");
			response.addCookie(cookie);
			
		}
		
		public void clearAlert(HttpServletResponse response) {
			Cookie cookie=new Cookie("toast", "");
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
}
