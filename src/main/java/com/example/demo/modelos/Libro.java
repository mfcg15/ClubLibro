package com.example.demo.modelos;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name="libros")
public class Libro 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message = "Title must not be blank")
	@Size(min=2,max=255)
	private String title;
	
	@NotEmpty(message = "Author must not be blank")
	@Size(min=2,max=255)
	private String author;
	
	@NotEmpty(message = "The thoughts must not be blank")
	@Size(min=2,max=500)
	private String thoughts;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date created_at;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updated_at;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="usuario_id")
    private Usuario usuario;
	
	public Libro() 
	{
		
	}
	
	public Long getId() 
	{
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() 
	{
		return title;
	}

	public void setTitle(String title) 
	{
		this.title = title;
	}

	public String getAuthor() 
	{
		return author;
	}

	public void setAuthor(String author) 
	{
		this.author = author;
	}

	public String getThoughts() 
	{
		return thoughts;
	}

	public void setThoughts(String thoughts) 
	{
		this.thoughts = thoughts;
	}

	public Usuario getUsuario() 
	{
		return usuario;
	}

	public void setUsuario(Usuario usuario) 
	{
		this.usuario = usuario;
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
