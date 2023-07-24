package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.entities.User;

public class Userdao {
 private  SessionFactory factory;

   public Userdao(SessionFactory factory) {
	super();
	this.factory = factory;
}
 public User getUserbyEmailandPassword(String email, String password) {
	 User user=null;
	 
	 try {
		 String query ="from user where email="+email+" and password="+password;
		Session session= this.factory .openSession();
		 Query q=session.createQuery(query);
//		 q.setParameter("e",email );
//		 q.setParameter("p",password );
		 user=(User) q.uniqueResult();
		session.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	 
	 
	 return user;
	 
 }
	
	
}
