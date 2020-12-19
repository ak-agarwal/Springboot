package com.winpoint.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity
@Data
public class StudentTestResultJava_CRT {
//	checked
//	fk
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="StudentTestResultJava_CRT_Id", updatable=false)	
	private Integer StudentTestResultJava_CRT_Id;
	private Integer qNumber;
	private Character studentResponse;
	private String isCorrect;
	private Integer createdBy;
	private Date createdDate;
	
	
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userTestId", nullable = false)
	private UserTestDetails mappingUserTestDetails;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "questionId", nullable = false)
	private TechnicalQuestionBank mappingTechnicalQuestionBank;

}
