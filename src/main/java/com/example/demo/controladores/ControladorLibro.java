package com.example.demo.controladores;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.modelos.Libro;
import com.example.demo.modelos.Usuario;
import com.example.demo.servicios.AppService;

@Controller
@RequestMapping("/books")
public class ControladorLibro 
{
	@Autowired
	private AppService servicio;

	@GetMapping("")
	public String dashboard(HttpSession session,Model model)
	{
		
		Usuario currentUser = (Usuario) session.getAttribute("user_session");
		
		if(currentUser==null)
		{
			return "redirect:/";
		}
		
		List<Libro> lista_libros = servicio.allLibros();
		
		model.addAttribute("libros", lista_libros);
		
		return "dashboard.jsp";
	}
	
	@GetMapping("/new")
	public String new_book(@ModelAttribute("libro") Libro libro,HttpSession session,Model model)
	{
		Usuario currentUser = (Usuario) session.getAttribute("user_session");
		
		if(currentUser==null)
		{
			return "redirect:/";
		}
		else
		{
			model.addAttribute("idusuario",currentUser.getId());
		}
		
		return "book.jsp";
	}
	
	@PostMapping("/create")
	public String create(@Valid @ModelAttribute("libro") Libro libro,@RequestParam(value="idusuario") Long idusuario,
						 BindingResult result)
	{
		
		if(result.hasErrors())
		{
			return "book.jsp";
		}
		else
		{
			servicio.save_libro(libro,idusuario);
			return "redirect:/books";
		}
	
	}
	
	@GetMapping("{id}")
	public String show_book(@PathVariable("id") Long id, Model model,HttpSession session)
	{
		
		Libro libro = servicio.find_libro(id);
		
		model.addAttribute("libro", libro);
		
		Usuario currentUser = (Usuario) session.getAttribute("user_session");
		
		if(currentUser==null)
		{
			return "redirect:/";
		}
		else
		{
			model.addAttribute("idusuario",currentUser.getId());
		}
		
		return "show.jsp";
	}
	
	@GetMapping("{id}/edit")
	public String editar_book(@PathVariable("id") Long id, Model model, @ModelAttribute("libro") Libro libro)
	{
		
		Libro libro_edit = servicio.find_libro(id);
		
		model.addAttribute("libro", libro_edit);
		
		return "editar.jsp";
	}
	
	@PutMapping("/edit")
	public String update(@Valid @ModelAttribute("libro") Libro libro, BindingResult result) 
	{
		if(result.hasErrors()) 
		{
			return "editar.jsp";
		} 
		else 
		{
			servicio.updated_libro(libro);
			return "redirect:/books";
		}
	}
	
}
