package com.winpoint.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.winpoint.model.BatchDetails;
import com.winpoint.model.Course;
import com.winpoint.model.Lecture;
import com.winpoint.model.Streams;
import com.winpoint.model.Topics;
import com.winpoint.repository.BatchDetailsRepository;
import com.winpoint.repository.StreamsRepository;

@Controller
public class LecutreViewController {
	@Autowired
	StreamsRepository stream;

	@Autowired
	BatchDetailsRepository batchDetailsRepository;

	@RequestMapping(value = "/LectureView", method = RequestMethod.GET)
	public ModelAndView showLectureViewPage() {
		ModelAndView mv = new ModelAndView();
		List<Streams> c = stream.findAll();
		mv.addObject("streamList", c);
		mv.setViewName("LectureView");
		return mv;
	}

	@RequestMapping(value = "/ProgressTracker", method = RequestMethod.GET)
	public ModelAndView showProgressTrackerPage(@RequestParam String batchId) {
		ModelAndView mv = new ModelAndView();
		BatchDetails batch = batchDetailsRepository.findById(Integer.parseInt(batchId)).get();		
		mv.addObject("batchObject", batch);
		mv.setViewName("ProgressTrack");
		return mv;
	}

	@RequestMapping(value = "/LectureViewDetails", method = RequestMethod.POST)
	public @ResponseBody BatchDetails getTimeAndSegment(@RequestParam String batchId) {
		BatchDetails batch = batchDetailsRepository.findById(Integer.parseInt(batchId)).get();
		int total_topics = batch.getMappingCourse().getMappingTopics().size();
		int total_duration = 0;
		int total_lectures =  batch.getMappingCourse().getMappingCoursePlans().size();
		int elapsed_duration = batch.getMappingLecture().size();
		
		Set<Topics> uniqueTopic = new HashSet<>();
		for(Lecture lecture:batch.getMappingLecture()) {
			uniqueTopic.addAll(lecture.getMappingTopicsCovered());
		}
		for(Topics topic:batch.getMappingCourse().getMappingTopics()) {
			total_duration+=topic.getTopicDuration();
			}
		int topics_covered = uniqueTopic.size();
//		batch.getMappingCourse().getMappin
		return batch;

	}
}
