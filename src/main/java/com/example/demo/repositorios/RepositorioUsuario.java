package com.example.demo.repositorios;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.modelos.Usuario;

@Repository
public interface RepositorioUsuario extends CrudRepository<Usuario,Long>
{
	Optional <Usuario> findByEmail(String email);
	List<Usuario> findById(long id);
}
