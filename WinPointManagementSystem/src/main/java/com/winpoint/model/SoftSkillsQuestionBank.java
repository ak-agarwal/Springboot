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

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class SoftSkillsQuestionBank {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "questionId", updatable = false)
	private Integer questionId;
	private String question;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	private Character correctOption;
	private Integer marks;
	private String explanation;
	private String inCrt;
	private String createdBy;
	private Date createdDate;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "courseId", nullable = false)
	private Course mappingCourse;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "difficultyLevelId", nullable = false)
	private DifficultyLevel mappingDifficultyLevel;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "topicId", nullable = false)
	private Topics mappingTopics;

}
