package com.entities;



import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;
@Entity	
@Table(name="user")
public class User implements Serializable{

/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
public User() {
		super();
		// TODO Auto-generated constructor stub
	}
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
private int id;
public User(String name, String email ,String phone,String password,byte[] image) {
	super();
	this.name = name;
	this.email = email;
	this.phone=phone;
	this.password=password;
	this.image=image;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public byte[] getImage() {
	return image;
}
public void setImage(byte[] image) {
	this.image = image;
}
 
private String name;
private String email;
private String phone;
private String password;

@Lob
@Column(columnDefinition="BLOB")
private byte[] image;


	
}
