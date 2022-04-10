package com.example.demo.modelos;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="usuarios")
public class Usuario 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message = "The name field is required.")
	@Size(min=2,max=30,message = "Name must be between 2 and 30 characters.")
	private String name;
	
	@NotEmpty(message = "The email field is required.")
	@Email(message = "Enter a valid email address.")
	private String email;
	
	@NotEmpty(message = "The password field is required.")
	@Size(min=6,max=128,message = "Password must be between 6 and 128 characters.")
	private String password;
	
	@Transient
	@NotEmpty(message = "The Confirm PW field is required.")
	@Size(min=6,max=128,message = "Confirm Password must be between 6 and 128 characters.")
	private String confirmacion;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date created_at;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updated_at;
	
	@OneToMany(mappedBy="usuario", fetch = FetchType.LAZY)
    private List<Libro> libros;

	public Usuario() 
	{
		
	}

	public Long getId() 
	{
		return id;
	}

	public void setId(Long id) 
	{
		this.id = id;
	}

	public String getName() 
	{
		return name;
	}

	public void setName(String name) 
	{
		this.name = name;
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

	public String getConfirmacion() 
	{
		return confirmacion;
	}

	public void setConfirmacion(String confirmacion) 
	{
		this.confirmacion = confirmacion;
	}
	
	@PrePersist
	protected void onCreate() 
	{
		this.created_at = new Date();
	}
	
	@PreUpdate
	protected void onUpdate() 
	{
		this.created_at = new Date();
	}

}
