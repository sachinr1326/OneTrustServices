  <%@page import="com.entities.NotificationMessage"%>
<%@page import="com.model.NotificationMessageModel"%>
<%@page import="java.util.List"%>
<%  List<NotificationMessage> notify= new NotificationMessageModel().findAll();
		for(NotificationMessage ntfy:notify){
	      	   ntfy.setStatus("read");
	      	   new NotificationMessageModel().update(ntfy);
	      	   }
	      	   
	      	   %>