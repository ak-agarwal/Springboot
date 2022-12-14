package com.winpoint.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.winpoint.model.Course;
import com.winpoint.model.EnquiryDetails;
import com.winpoint.model.SegmentType;
import com.winpoint.model.Streams;
import com.winpoint.model.TimeSlots;

import com.winpoint.model.UserProfile;
import com.winpoint.repository.CourseRepository;
import com.winpoint.repository.EnquiryDetailsRepository;
import com.winpoint.repository.SegmentTypeRepository;
import com.winpoint.repository.StreamsRepository;
import com.winpoint.repository.TimeSlotsRepository;


@Controller
public class RevenueTrackerController {

	@RequestMapping(value = "/RevenueTracker", method = RequestMethod.GET)
	public ModelAndView showRevenueTrackerPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("MainBatchPage");
		return mv;
	}
	
	@RequestMapping(value = "/LectureView", method = RequestMethod.GET)
	public ModelAndView showLectureViewPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("LectureView");
		return mv;
	}

	@Autowired
	StreamsRepository stream;

	@RequestMapping(value = "PriorityOfCourses", method = RequestMethod.GET)
	public ModelAndView showPriorityOfCoursesScreen() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("PriorityOfCourses");
		List<Streams> c = stream.findAll();
		mv.addObject("streamList", c);
		return mv;
	}

	
	//Integer timeSlotsId;
	//Integer segmentTypeId;
	//String password;
	String Location;
	
	
	@RequestMapping(value = "/LocationNext", method = RequestMethod.POST)
	public @ResponseBody void getTimeAndSegment(@RequestParam("location") String location) {
		/*
		 * System.out.println("timeSlotsId  " + timeSlotsid);
		 * timeSlotsId=Integer.parseInt(timeSlotsid);
		 * System.out.println("segmentTypeId  " + segmentTypeid);
		 * segmentTypeId=Integer.parseInt(segmentTypeid);
		 */
	//	System.out.println("password  " + Password);
		//password=Password;
		System.out.println("location  " + location);
		Location=location;
		
		
	}
	
	
	@Autowired
	EnquiryDetailsRepository enquiryDetailsRepository;

	EnquiryDetails finalUser;
//	@ModelAttribute("enquiryDetails")
	@PostMapping("/saveForm")
	public String saveForm(EnquiryDetails enquiryDetails,RedirectAttributes redirectAttributes) throws ParseException {
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		System.out.println("USER:  " + enquiryDetails.getFirstName());
		System.out.println("USER:  " + enquiryDetails.getMobileNo());
		System.out.println("USER:  " + enquiryDetails.getDegree());
		System.out.println("USER:  " + enquiryDetails.getBirthDateString());
		System.out.println("USER:  " + enquiryDetails.getMappingTimeSlots());
		System.out.println("USER:  " + enquiryDetails.getMappingSegmentType());
		
		//System.out.println("timeSlots:  " + timeSlots.getTimeSlotsId());
		
		
		DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
		String t = enquiryDetails.getBirthDateString().toString();
		Date d = df.parse(t);
		enquiryDetails.setBirthDate(d);

		String t1 = enquiryDetails.getDateOfEnquiryString().toString();
		Date d1 = df.parse(t1);
		enquiryDetails.setDateOfEnquiry(d1);

		String t2 = enquiryDetails.getStartDateString().toString();
		Date d2 = df.parse(t2);
		enquiryDetails.setStartDate(d2);
		//System.out.println("USER:  "+ user.getBirthDate()); 
//		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
//
		enquiryDetailsRepository.save(enquiryDetails);
		finalUser=enquiryDetails;
		System.out.println("USER final:  " + finalUser.getBirthDateString());
		if(Location.equals("LoginForm"))
			return "LoginForm";
		else
			return "redirect:/EnquiryDetails";
		//return Location;

	}
	
	

	@Autowired
	SegmentTypeRepository segmentTypeRepository;
	@Autowired
	CourseRepository courseRepository;
	@Autowired
	TimeSlotsRepository timeSlotsRepository;
	

	@RequestMapping(value = "/SignUpRevenueTracker", method = RequestMethod.GET)
	public ModelAndView showSignUpRevenueTrackerPage(@ModelAttribute EnquiryDetails enquiryDetails,@ModelAttribute TimeSlots timeSlots,@ModelAttribute SegmentType segmentType,@ModelAttribute UserProfile userProfile) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("SignUpForm");
		List<String> list = new ArrayList<String>();
		list.add("MCA");
		list.add("BCA");
		list.add("BE");

		// Segment type dd
		List<SegmentType> segmentTypeList = segmentTypeRepository.findAll();
		List<String> segmentlist = new ArrayList<String>();
		for (SegmentType s : segmentTypeList) {
			System.out.println("DATA segemnt type - " + s.getSegmentTypeName());
			segmentlist.add(s.getSegmentTypeName());

		}
		mv.addObject("segmentTypeList", segmentTypeList);

		// Course already done
		List<Course> courseAlreadyDone = courseRepository.findAll();
		List<String> courseAlreadyDonelist = new ArrayList<String>();
		for (Course s : courseAlreadyDone) {
			System.out.println("DATA segemnt type - " + s.getCourseName());
			courseAlreadyDonelist.add(s.getCourseName());
		}
		mv.addObject("courseAlreadyDone", courseAlreadyDone);
		// Course Interested in
		List<Course> courseInterestedInList = courseRepository.findAll();
		List<String> courseInterestedInlist = new ArrayList<String>();
		for (Course s : courseInterestedInList) {
			System.out.println("DATA segemnt type - " + s.getCourseName());
			courseInterestedInlist.add(s.getCourseName());
		}
		mv.addObject("courseInterestedInList", courseInterestedInList);
		// Available time
		List<TimeSlots> availableTimeList = timeSlotsRepository.findAll();
//		List<String> availableTimelist = new ArrayList<String>();
//		for (TimeSlots s : availableTimeList) {
//			System.out.println("DATA segement type - " + s.getTimeSlotsDescription());
//			availableTimelist.add(s.getTimeSlotsDescription());
//		}
		mv.addObject("availableTimeList", availableTimeList);
		mv.addObject("location", "EnquiryDetails");
		
		mv.addObject("degreeList", list);
		return mv;
	}

	// Update form
	/*
	 * @RequestMapping(value = "UpdateForm", method = RequestMethod.GET) public
	 * String showUpdateForm() {
	 * 
	 * return "UpdateForm"; }
	 */
	
	@RequestMapping(value = "/UpdateForm", method = RequestMethod.GET)
	public ModelAndView showUpdateForm() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("UpdateForm");
		
		List<TimeSlots> availableTimeList = timeSlotsRepository.findAll();
		List<SegmentType> segmentTypeList = segmentTypeRepository.findAll();
		mv.addObject("availableTimeList", availableTimeList);
		mv.addObject("segmentTypeList", segmentTypeList);
		return mv;
	}

	@RequestMapping(value = "/getUpdateFormList", method = RequestMethod.POST)
	public @ResponseBody EnquiryDetails showEnquiry(@RequestParam("enquiryId") String enquiryId) {
		System.out.println(enquiryId);
		
		System.out.println();
		EnquiryDetails enquiryDetails = new EnquiryDetails();
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		System.out.println(enquiryDetailsRepository.findById(Integer.parseInt(enquiryId)).get().getMobileNo());
		System.out.println(enquiryDetailsRepository.findById(Integer.parseInt(enquiryId)).get().getFirstName());

		return enquiryDetailsRepository.findById(Integer.parseInt(enquiryId)).get();

	}

//	@RequestMapping(value = "/getUpdateFormList", method = RequestMethod.POST)
//	public @ResponseBody Optional<EnquiryDetails> showEnquiry(@RequestParam("enquiryId") String enquiryId) {
//		System.out.println(enquiryId);
//		
//		System.out.println();
//		EnquiryDetails enquiryDetails = new EnquiryDetails();
//		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
//		System.out.println(enquiryDetailsRepository.findById(Integer.parseInt(enquiryId)).get().getMobileNo());
//		System.out.println(enquiryDetailsRepository.findById(Integer.parseInt(enquiryId)).get().getFirstName());
//
//		//List<EnquiryDetails> enquiryDetailsList = (List<EnquiryDetails>) (enquiryDetailsRepository.findById(Integer.parseInt(enquiryId)));
//		Optional<EnquiryDetails> enquiryDetailsList = enquiryDetailsRepository.findById(Integer.parseInt(enquiryId));	
//		
//		
//		return enquiryDetailsList;
//	}
	
	@RequestMapping(value = "/SaveUpdateData", method = RequestMethod.POST)
	public void updateEnquiry(@RequestBody EnquiryDetails enquiry) {
		System.out.println("*************");
		System.out.println(enquiry.getFirstName());
//		System.out.println(enquiry.getTimeSlotsId());
//		System.out.println(enquiry.getSegmentTypeId());
		System.out.println(enquiry.getMappingTimeSlots());
		System.out.println(enquiry.getMappingSegmentType());
		
	}

}
