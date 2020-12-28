package com.winpoint.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.winpoint.model.EnquiryDetails;
import com.winpoint.model.UserProfile;

@Controller
public class AddNewUserController {
	
	@RequestMapping(value = "/AddNewUser", method = RequestMethod.GET)
	public ModelAndView showAddNewUserPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("AddNewUser");
		return mv;
	}
	
//	@Autowired
//	UserProfi
//	
//	@PostMapping("/saveNewUser")
//	public String saveForm(UserProfile userProfile,RedirectAttributes redirectAttributes) throws ParseException {
//		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
//		System.out.println("USER:  " + userProfile.getFirstName());
//		System.out.println("USER:  " + userProfile.getGender());
//		System.out.println("USER:  " + userProfile.getDegree());
//		System.out.println("USER:  " + userProfile.getBirthDate());
//		System.out.println("USER:  " + userProfile.getMappingTimeSlots());
//		System.out.println("USER:  " + userProfile.getMappingSegmentType());		
//		
//		DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
//		String t = userProfile.getBirthDate().toString();
//		Date d = df.parse(t);
//		userProfile.setBirthDate(d);
//
////		String t1 = userProfile.getDateOfEnquiryString().toString();
////		Date d1 = df.parse(t1);
////		userProfile.setDateOfEnquiry(d1);
////
////		String t2 = userProfile.getStartDateString().toString();
////		Date d2 = df.parse(t2);
////		userProfile.setStartDate(d2);
//	
//		
////		enquiryDetailsRepository.save(enquiryDetails);
////		finalUser=enquiryDetails;
////		System.out.println("USER final:  " + finalUser.getBirthDateString());
////		if(Location.equals("LoginForm"))
////			return "LoginForm";
////		else
////			return "redirect:/EnquiryDetails";
////		//return Location;
//
//	}


}
