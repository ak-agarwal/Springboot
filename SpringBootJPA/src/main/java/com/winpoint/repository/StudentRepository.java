package com.winpoint.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.winpoint.model.Student;

//@Repository
public interface StudentRepository extends CrudRepository<Student, String>{

}
