package com.myweb.home.meeting.board;


import java.util.Locale;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MeetingBoardController {
	
	
	
	
	@RequestMapping(value = "/meeting/info", method = RequestMethod.GET)
	public String board(Locale locale, Model model) {
		
		
		return "meeting/info";
	}
	
	@RequestMapping(value = "/meeting/board", method = RequestMethod.GET)
	public String detail(Locale locale, Model model) {
		
		
		return "meeting/board";
	}
	
}