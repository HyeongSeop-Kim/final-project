package com.myweb.somoim.moim.controller;


import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import com.myweb.somoim.participants.model.MeetingParticipantsDTO;
import com.myweb.somoim.participants.model.MoimParticipantsDTO;
import com.myweb.somoim.participants.service.MeetingParticipantsService;
import com.myweb.somoim.participants.service.MoimParticipantsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myweb.somoim.model.SomoimDTO;
import com.myweb.somoim.moim.model.MeetingsDTO;
import com.myweb.somoim.moim.service.MeetingsService;
import com.myweb.somoim.service.SomoimService;



@Controller
public class MoimController {

	@Autowired
	private SomoimService somoimService;
	@Autowired
	private MeetingsService meetingsService;
	@Autowired
	private MoimParticipantsService moimParticipantsService;
	@Autowired
	private MeetingParticipantsService meetingParticipantsService;

	@RequestMapping(value = "/moim/add", method = RequestMethod.GET)
	public String add(Locale locale, Model model) {

		return "moim/add";
	}

	@RequestMapping(value = "/moim/meeting", method = RequestMethod.GET)
	public String board(Model model
			, @RequestParam int moimId) {
		
		SomoimDTO somoimDatas = somoimService.getData(moimId);
	
		model.addAttribute("somoimDatas", somoimDatas);
		
		List<MeetingsDTO> meetingsList = meetingsService.getDatas(moimId);
		
		model.addAttribute("meetingsList", meetingsList);

		List<MoimParticipantsDTO> moimParticipantsList = moimParticipantsService.getDatas(moimId);

		model.addAttribute("moimParticipantsList", moimParticipantsList);

		List<MeetingParticipantsDTO> meetingParticipantsList = meetingParticipantsService.getDatas(moimId);

		model.addAttribute("meetingParticipantsList", meetingParticipantsList);

		return "moim/meeting";
	}
	
	@RequestMapping(value = "/moim/board", method = RequestMethod.GET)
	public String detail(Locale locale, Model model) {
		
		
		return "moim/board";
	}
	
}