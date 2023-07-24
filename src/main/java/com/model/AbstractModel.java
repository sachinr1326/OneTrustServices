package com.model;

import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.Transaction;


import com.helper.FactoryProvider;



public class AbstractModel<T> {

	private Class<T> entity;

	public AbstractModel(Class<T> entity) {
		this.entity = entity;
	}
	
	public List<T> findByColumns(HashMap<String, Object> values) {
		List<T> result = null;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			String querystring = "from " + entity.getName();
			if(!values.isEmpty()) {
				querystring = querystring +" where ";
			}
			boolean flag=false;
			for(String key:values.keySet()) {
				if(flag) {
					querystring = querystring+" and ";
				}
				if(values.get(key) instanceof Integer) {
					querystring = querystring + key +"="+values.get(key)+" order by id DESC";
					
				}else {
				querystring = querystring + key +"='"+values.get(key)+"' order by id DESC";
				flag=true;
				}
			}
			result = session.createQuery(querystring).list();
			transaction.commit();
		} catch (Exception e) {
			System.err.println("------------------------"+e.getMessage());
			result = null;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return result;
		
	}
	
	public List<T> findUser(HashMap<String, Object> values) {
		List<T> result = null;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			String querystring = "from " + entity.getName();
			if(!values.isEmpty()) {
				querystring = querystring +" where ";
			}
			boolean flag=false;
			for(String key:values.keySet()) {
				if(flag) {
					querystring = querystring+" and ";
				}
				if(values.get(key) instanceof Integer) {
					querystring = querystring + key +"="+values.get(key)+"";
					
				}else {
				querystring = querystring + key +"='"+values.get(key)+"'";
				flag=true;
				}
			}
			result = session.createQuery(querystring).list();
			transaction.commit();
		} catch (Exception e) {
			System.err.println("------------------------"+e.getMessage());
			result = null;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return result;
		
	}

	public List<T> findAll() {
		List<T> result = null;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			result = session.createQuery("from " + entity.getName()+" order by id DESC").list();
			transaction.commit();
			
			
			
			System.out.println(result);
		} catch (Exception e) {
			result = null;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}
	
	
	public int findRowOrderByDate(Object want) {
		List<T> result = null;
		Session session = null;
		Transaction transaction = null;
		  DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		    Date date = new Date();
		    String currentDate = dateFormat.format(date);
		    DateFormat dateFormat1 = new SimpleDateFormat("MM/yyyy");
		    DateFormat dateFormat2 = new SimpleDateFormat("yyyy");
		    String monthyear = dateFormat1.format(date);
		    String year=dateFormat2.format(date);
		    int total=0;
		   
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			String querystring = "from " + entity.getName();
			if(want=="daily") {
				querystring = querystring +" where DATE(date)= DATE('"+currentDate+"')";
			}
			if(want=="month") {
				querystring = querystring +" where month(date)/year(date)="+monthyear +"";
			}
			if(want=="year") {
				querystring = querystring +" where year(date)="+year+"";
			}
			
			result =  session.createQuery(querystring).list();
			for(T p:result) {
				total=total+1;
			}
			
			transaction.commit();
		} catch (Exception e) {
			total = 0;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return total;
	}
	
	public List<T> TotalEarningByDate(Object want) {
		List<T> result = null;
		Session session = null;
		Transaction transaction = null;
		  DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		    Date date = new Date();
		    String currentDate = dateFormat.format(date);
		    DateFormat dateFormat1 = new SimpleDateFormat("MM/yyyy");
		    DateFormat dateFormat2 = new SimpleDateFormat("yyyy");
		    String monthyear = dateFormat1.format(date);
		    String year=dateFormat2.format(date);
		   
		   
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			String querystring = " from " + entity.getName();
			if(want=="daily") {
				querystring = querystring +" where DATE(date)= DATE('"+currentDate+"')";
			}
			if(want=="month") {
				querystring = querystring +" where month(date)/year(date)="+monthyear +"";
			}
			if(want=="year") {
				querystring = querystring +" where year(date)="+year+"";
			}
			
			result =  session.createQuery(querystring).list();
			transaction.commit();
		} catch (Exception e) {
			result = null;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}
	
	
	
	
	public int findNumberofRows() {
		List<T> result = null;
		Session session = null;
		Transaction transaction = null;
		 
		   
             int total=0;
		   
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();

			result =  session.createQuery("from " + entity.getName()+"").list();
			for(T p:result) {
				total=total+1;
			}
			
			transaction.commit();
			
		} catch (Exception e) {
			total = 0;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return total;
	}
	
	public int Notificationbadge() {
		List<T> result = null;
		Session session = null;
		Transaction transaction = null;
		
		   
             int total=0;
		   
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();

			result =  session.createQuery("from " + entity.getName()+" where status=null").list();
			for(T p:result) {
				total=total+1;
			}
			
			transaction.commit();
			
		} catch (Exception e) {
			total = 0;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return total;
	}
	
	

	public List<T> findbyUserid(Object id) {
		List<T> result = null;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
//			result = session.createQuery(" from "+ entity.getName()+"  where user_id= "+id).list();
			result = session.createQuery(" from "+ entity.getName()+"  where user= "+id+"order by id DESC").list();
			
			transaction.commit();
			
			
		
			
		} catch (Exception e) {
			result = null;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	public List<T> findImagebyName(Object name) {
		List<T> result = null;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
//			result = session.createQuery(" from "+ entity.getName()+"  where user_id= "+id).list();
			result = session.createQuery(" from "+ entity.getName()+"  where name= '"+name+"' ").list();
			
			transaction.commit();
			
			
		
			
		} catch (Exception e) {
			result = null;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	
	
	public List<T> findbyOrder(Object id) {
		List<T> result = null;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
//			result = session.createQuery(" from "+ entity.getName()+"  where user_id= "+id).list();
			result = session.createQuery(" from "+ entity.getName()+"  where orderdetail= "+id+"order by id DESC").list();
			
			transaction.commit();
			
			
		
			
		} catch (Exception e) {
			result = null;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	
	
	
	public List<T> findbyStatusNull( ) {
		List<T> result = null;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
//			result = session.createQuery(" from "+ entity.getName()+"  where user_id= "+id).list();
			result = session.createQuery(" from "+ entity.getName()+"  where status=null order by id DESC").list();
			
			transaction.commit();
			
			
		
			
		} catch (Exception e) {
			result = null;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}
	
	public long numberofcolumns(Object id) {
		List<T> result = null;
		Session session = null;
		Transaction transaction = null;
		long row=0;
		
		try {
			session =FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			result = session.createQuery(" from "+ entity.getName()+" where user= "+id+" ").list();
			 for(T message:result) {
				 row=row+1;
			 }
			transaction.commit();
		} catch (Exception e) {
			row = 0;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return row;
	}
		
	

	public T find(Object id) {
		T result = null;
		Session session = null;
		Transaction transaction = null;
		try {
			session =FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			result = (T) session.get(entity, (Serializable) id);
			transaction.commit();
		} catch (Exception e) {
			result = null;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}
	
	
	
	public boolean create(T entity) {
		boolean result = true;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			session.save(entity);
			transaction.commit();
		} catch (Exception e) {
			result = false;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	
	public boolean update(T entity) {
		boolean result = true;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			session.update(entity);
			transaction.commit();
		} catch (Exception e) {
			result = false;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	public boolean delete(T entity) {
		boolean result = true;
		Session session = null;
		Transaction transaction = null;
		try {
			session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			session.delete(entity);
			transaction.commit();
		} catch (Exception e) {
			result = false;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

}