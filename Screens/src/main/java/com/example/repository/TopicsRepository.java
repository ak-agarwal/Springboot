package com.example.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.Topics;

@Repository
public interface TopicsRepository extends JpaRepository<Topics, Integer>{
	
	public List<Topics> findByCourseId(Integer courseId);
}