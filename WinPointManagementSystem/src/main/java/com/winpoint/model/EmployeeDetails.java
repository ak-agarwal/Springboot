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

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class EmployeeDetails {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "employeeDetailsId", updatable = false)
	private Integer employeeDetailsId;
	private Double employeeSalary;
	private String dateOfJoining;
	private Integer createdBy;
	private Date createdDate;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "employeeCategoryId", nullable = false)
	private EmployeeCategory mappingEmployeeCategory;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId", nullable = false)
	private UserProfile mappingUserProfile;

}
