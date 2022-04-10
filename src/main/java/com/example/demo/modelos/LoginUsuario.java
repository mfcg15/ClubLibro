package com.example.demo.modelos;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class LoginUsuario 
{
	@NotEmpty(message = "Please enter an email.")
	@Email(message = "Enter a valid email address.")
	private String email;
	
	
	@NotEmpty(message = "Please enter a password.")
	@Size(min=6,max=128,message = "Password must be between 6 and 128 characters.")
	private String password;


	public LoginUsuario() 
	{
		
	}

	public String getEmail() 
	{
		return email;
	}

	public void setEmail(String email) 
	{
		this.email = email;
	}

	public String getPassword() 
	{
		return password;
	}

	public void setPassword(String password) 
	{
		this.password = password;
	}
		
}
