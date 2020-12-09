package com.winpoint.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.winpoint.model.FeedbackCategory;

@Repository
public interface FeebackCategoryRepository extends JpaRepository<FeedbackCategory, Integer>{

}
