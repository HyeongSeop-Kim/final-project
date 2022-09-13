package com.myweb.somoim.moim.controller;


import java.io.File;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.myweb.somoim.common.model.PagingDTO;
import com.myweb.somoim.model.SomoimDTO;
import com.myweb.somoim.moim.model.MeetingsDTO;
import com.myweb.somoim.moim.service.BoardsService;
import com.myweb.somoim.moim.service.MeetingsService;
import com.myweb.somoim.participants.model.MeetingParticipantsDTO;
import com.myweb.somoim.participants.model.MoimParticipantsDTO;
import com.myweb.somoim.participants.service.MeetingParticipantsService;
import com.myweb.somoim.participants.service.MoimParticipantsService;
import com.myweb.somoim.service.SomoimService;
import com.myweb.somoim.categorys.model.CategorysDTO;
import com.myweb.somoim.categorys.service.CategorysService;
import com.myweb.somoim.common.model.LocationsDTO;
import com.myweb.somoim.common.service.FileUploadService;
import com.myweb.somoim.common.service.LocationsService;
import com.myweb.somoim.members.model.MembersDTO;
import com.myweb.somoim.members.service.MembersService;


@Controller
public class MoimController {
	
	@Autowired
	private SomoimService SomoimService;

	@Autowired
	private BoardsService boardsService;

	@Autowired
	private MeetingsService meetingsService;

	@Autowired
	private MoimParticipantsService moimParticipantsService;

	@Autowired
	private MeetingParticipantsService meetingParticipantsService;

	@Autowired
	private LocationsService locService;

	@Autowired
	private CategorysService categoryService;

	@Autowired
	private FileUploadService fileUploadService;
	
	@Autowired
	private MembersService memberService;

	@RequestMapping(value = "/moim/add", method = RequestMethod.GET)
	public String add(Model model) {
		List<LocationsDTO> locDatas = locService.getAll();
		List<CategorysDTO> cateDatas = categoryService.getAll();
		model.addAttribute("locDatas", locDatas);
		model.addAttribute("cateDatas", cateDatas);
		return "moim/add";
	}
	
	@RequestMapping(value = "/moim/add", method = RequestMethod.POST)
	@ResponseBody
	public String addBoard(Model model,HttpSession session
		   ,@RequestParam("locationId") int locationId
		   ,@RequestParam() String moimTitle
		   ,@RequestParam(required= false) String moimInfo
		   ,@RequestParam(required= false, defaultValue="5")int moimLimit
		   ,@RequestParam() int categoryId) {
		JSONObject json = new JSONObject();
		
		SomoimDTO data = new SomoimDTO();
		
		data.setLocationId(locationId);
		data.setMoimTitle(moimTitle);
		data.setMoimLimit(moimLimit);
		data.setMoimInfo(moimInfo);
		data.setMoimImagePath(null);
		data.setCategoryId(categoryId);
		boolean result = SomoimService.addData(data);
		MoimParticipantsDTO partData = new MoimParticipantsDTO();
		MembersDTO memData = (MembersDTO) session.getAttribute("loginData");
		partData.setMemberId(memData.getMemberId());
		partData.setMoimId(data.getMoimId());
		
		boolean res = SomoimService.addDataSub(partData);
		json.put("data", result);
		if(result == false) {
			json.put("message", "필수입력항목 누락");
		}
		return json.toJSONString();
	}


	@RequestMapping(value = "/moim/meeting", method = RequestMethod.GET)
	public String board(Model model
			        ,@RequestParam(defaultValue="1", required=false) int id) {

		SomoimDTO moimData = SomoimService.getData(id); //모임정보
		List<MoimParticipantsDTO> moimParticipants = moimParticipantsService.getDatas(id); //참가자정보

		List<MeetingsDTO> meetingsData = meetingsService.getDatas(id);//정모정보

		List<MeetingParticipantsDTO> meetingParticipants = meetingParticipantsService.getDatas(id);

		model.addAttribute("moimData" , moimData);
		model.addAttribute("meetingsData",meetingsData);
		model.addAttribute("moimParticipants",moimParticipants);
		model.addAttribute("meetingParticipants", meetingParticipants);
		
		
		return "moim/meeting";
	}
	
	@RequestMapping(value = "/moim/board", method = RequestMethod.GET)
	public String detail(Model model
			            ,@RequestParam int id
			            ,@RequestParam(defaultValue="1", required=false) int page
			            ) {

		SomoimDTO moimData = SomoimService.getData(id);//모임정보
		List<MoimParticipantsDTO> moimParticipants = moimParticipantsService.getDatas(id); //참가자정보


		List datas = boardsService.getDatas(id); //게시글 전부 가져오기
		System.out.println(datas);

		   int pageCount = 5;

		   PagingDTO paging = new PagingDTO (datas,page,pageCount);
		   System.out.println("컨트롤러 출력: " + paging.getPageData());


		   model.addAttribute("paging",paging); //PagingDTO 객체 통째로 넘겨주기
		   model.addAttribute("moimData" , moimData); //모임정보
		   model.addAttribute("moimParticipants",moimParticipants); //모임참가자 정보
		
		
		return "moim/board";
	}
	
	@PostMapping(value = "/moim/imageUpload", produces="application/json; charset=utf-8")
	@ResponseBody
	public String addBoard(Model model
			,@RequestParam("moimimage") MultipartFile file
			,HttpServletRequest request) throws Exception {
		//데이터에 넣어놓기

		//모임 id 로 select로 data 가져와서
		//data에 값 넣어주기
		int id = 1;
		System.out.println("ajax모임아이디" + id);
		SomoimDTO data = SomoimService.getData(id);

	 data.setMoimImagePath(request.getServletContext().getRealPath("/resources/img")+file.getOriginalFilename());


	fileUploadService.modifyMoimImage(data); //업로드한이미지path를  DB에 저장

	String realPath= request.getServletContext().getRealPath("/resources"); //실제로 파일업로드 할 곳 지정
	file.transferTo(new File(realPath + "/img/" + file.getOriginalFilename()));	//실제로 업로드해주기

	JSONObject json = new JSONObject();
	//json.put("uploaded", 1); //하나의 파일업로드 되었다. //무조건1
	//json.put("fileName", file.getOriginalFilename());//업로드한 파일이름
	json.put("url", request.getContextPath() + "/resources/img/" + file.getOriginalFilename());



		return json.toJSONString();
	}


}