package com.example.demo.servicios;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.example.demo.modelos.Libro;
import com.example.demo.modelos.LoginUsuario;
import com.example.demo.modelos.Usuario;
import com.example.demo.repositorios.RepositorioLibro;
import com.example.demo.repositorios.RepositorioUsuario;

@Service
public class AppService 
{
	@Autowired
	private RepositorioUsuario repositorio_usuario;
	@Autowired
	private RepositorioLibro repositorio_libro;
	
	public Usuario register(Usuario nuevoUsuario,BindingResult result)
	{
		String nuevoEmail = nuevoUsuario.getEmail();
		
		if(repositorio_usuario.findByEmail(nuevoEmail).isPresent())
		{
			result.rejectValue("email", "Unique", "The email already exists");
		}
		
		if(!nuevoUsuario.getPassword().equals(nuevoUsuario.getConfirmacion()))
		{
			result.rejectValue("confirmacion", "Matches", "Passwords do not match");
		}
		
		if(result.hasErrors())
		{
			return null;
		}
		else
		{
			String contra_encr = BCrypt.hashpw(nuevoUsuario.getPassword(), BCrypt.gensalt());
			nuevoUsuario.setPassword(contra_encr);
			return repositorio_usuario.save(nuevoUsuario);
		}
	}
	
	public Usuario login(LoginUsuario nuevoLogin,BindingResult result)
	{
		if(result.hasErrors())
		{
			return null;
		}
		
		Optional<Usuario> posibleUsuario = repositorio_usuario.findByEmail(nuevoLogin.getEmail());
		
		if(!posibleUsuario.isPresent())
		{
			result.rejectValue("email", "Unique","Email does not exist.");
			return null;
		}
		
		Usuario user_login = posibleUsuario.get();
		
		if(!BCrypt.checkpw(nuevoLogin.getPassword(),user_login.getPassword()))
		{
			result.rejectValue("password", "Matches", "Password worng");
		}
		
		if(result.hasErrors())
		{
			return null;
		}
		else
		{
			return user_login;
		}
	}
	
	public Libro save_libro(Libro libro,Long idusuario) 
	{
		Usuario user = find_user(idusuario);
		libro.setUsuario(user);
		return repositorio_libro.save(libro);
	}
	
	public Libro guardar_libro(Libro libro) 
	{
		return repositorio_libro.save(libro);
	}
	
	public Usuario find_user(Long id) 
	{
		Optional<Usuario> optionalUser = repositorio_usuario.findById(id);
		 
		 if(optionalUser.isPresent())
		 {
			 return optionalUser.get();
		 }
		 else
		 {
			 return null;
		 }
	}
	
	public List<Libro> allLibros() 
	{
		return repositorio_libro.findAll();
	}
	
	public Libro find_libro(Long id)
	{
		 Optional<Libro> optionalLibro = repositorio_libro.findById(id);
		 
		 if(optionalLibro.isPresent())
		 {
			 return optionalLibro.get();
		 }
		 else
		 {
			 return null;
		 }
	}
	
	public Libro updated_libro (Libro libro) 
	{
		return repositorio_libro.save(libro);
	}
}
