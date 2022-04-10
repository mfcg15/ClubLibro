package com.example.demo.controladores;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.example.demo.modelos.LoginUsuario;
import com.example.demo.modelos.Usuario;
import com.example.demo.servicios.AppService;

@Controller
public class ControladorUsuario 
{
	@Autowired
	private AppService servicio;
	
	@GetMapping("/")
	public String index(Model model)
	{
		model.addAttribute("nuevoUsuario", new Usuario());
		model.addAttribute("nuevoLogin", new LoginUsuario());
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("nuevoUsuario") Usuario nuevoUsuario,
			 				BindingResult result,Model model, HttpSession session) 
	{
		
		servicio.register(nuevoUsuario, result);
		if(result.hasErrors())
		{
			model.addAttribute("nuevoLogin",new LoginUsuario());
			return "index.jsp";
		}
		
		session.setAttribute("user_session", nuevoUsuario);
		return "redirect:/books";
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("nuevoLogin") LoginUsuario nuevoLogin,
			 				BindingResult result,Model model, HttpSession session) 
	{
		
		Usuario user = servicio.login(nuevoLogin, result);
		if(result.hasErrors())
		{
			model.addAttribute("nuevoUsuario",new Usuario());
			return "index.jsp";
		}
		
		session.setAttribute("user_session", user);
		return "redirect:/books";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session)
	{
		session.removeAttribute("user_session");
		return "redirect:/";
	}
}
