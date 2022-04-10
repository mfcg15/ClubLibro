package com.example.demo.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.modelos.Libro;

@Repository
public interface RepositorioLibro extends CrudRepository<Libro, Long>
{
	List<Libro> findAll();
	List<Libro> findById(long id);
}
