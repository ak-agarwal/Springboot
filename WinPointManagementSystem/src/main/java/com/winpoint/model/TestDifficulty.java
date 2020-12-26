package com.winpoint.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class TestDifficulty {
//	checked
//	fk

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "testDifficultyLevelId", updatable = false)
	private Integer testDetailId;
	private Integer numberOfQuestions;
	private Integer createdBy;
	private Date createdDate;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "mappingTestDetails")
	@JsonBackReference
	private Set<TestDifficulty> mappingTestDifficulty;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "mappingTestDifficulty")
	@JsonBackReference
	private Set<TestDetails> mappingTestDetails;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "topicId", nullable = false)
	@JsonManagedReference
	private Topics mappingTopics;

}
