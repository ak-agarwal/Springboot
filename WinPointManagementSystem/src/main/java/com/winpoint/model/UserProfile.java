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

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class UserProfile {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "userId", updatable = false)
	private Integer userId;
	private String firstName;
	private String lastName;
	private String emailId;
	private String mobileNumber;
	private String address;
	private Date birthDate;
	private String college;
	private String degree;
	private String branch;
	private Integer yearOfGraduation;
	private String photoLocation;
	private String password;
	private String gender;
	private String securityQuestion;
	private String securityAnswer;
	private String occupation;
	private String organization;
	private String designation;
	private String domain;
	private String role;
	private Integer experience;
	private Integer createdBy;
	private Date createDate;
	private String courseAlreadyDone;
	private Boolean activeStatus;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "mappingUserProfile")
	private Set<FacultySkills> mappingFacultySkills;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "mappingUserProfile")
	private Set<StudentCourseDetails> mappingStudentCourseDetails;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "mappingUserProfile")
	private Set<EmployeeDetails> mappingEmployeeDetails;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "mappingUserProfile")
	private Set<RevenueDetail> mappingRevenueDetail;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "mappingUserProfile")
	private Set<UserTestDetails> mappingUserTestDetails;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "mappingUserProfile")
	private Set<UserStudent> mappingUserStudent;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "mappingUserProfile")
	private Set<CourseFeedback> mappingCourseFeedback;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userCategoryId", nullable = false)
	private UserCategory mappingUserCategory;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "securityQuestionId", nullable = false)
	private SecurityQuestions mappingSecurityQuestions;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "timeSlotsId", nullable = false)
	private TimeSlots mappingTimeSlots;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "segmentTypeId", nullable = false)
	private SegmentType mappingSegmentType;

}
