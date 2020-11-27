package com.example.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.model.Course;

@Repository
public interface CourseRepository extends JpaRepository<Course, Integer> {
	@Query("FROM Course a WHERE courseTypeId = ?1 AND streamId = ?2")
    List<Course> findByCourseTypeIdAndName(Integer courseTypeId, Integer streamId);
}
