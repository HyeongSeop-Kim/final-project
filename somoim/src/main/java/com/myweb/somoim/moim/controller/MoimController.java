package com.myweb.somoim.moim.controller;


import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.simple.JSONArray;
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
import com.myweb.somoim.moim.model.BoardsDTO;
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

	@Autowired
	private LocationsService locationService;


	@RequestMapping(value = "/moim/add", method = RequestMethod.GET)
	public String add(Model model) {
		List<LocationsDTO> locDatas = locService.getAll();
		List<CategorysDTO> cateDatas = categoryService.getAll();
		model.addAttribute("locDatas", locDatas);
		model.addAttribute("cateDatas", cateDatas);
		return "moim/add";
	}
	

	@RequestMapping(value = "/moim/join", method = RequestMethod.GET)
		public String moimJoin(Model model,
				@RequestParam int id
				,@RequestParam String test //보드 미팅 리다이렉트시 구분하기위해 넣은 값
				,@SessionAttribute("loginData") MembersDTO membersDto ) {
		MoimParticipantsDTO dto = new MoimParticipantsDTO();
		dto.setMoimId(id);
		dto.setMemberId(membersDto.getMemberId());
	
		boolean result = moimParticipantsService.addData(dto);
	
			if(test.equals("2")) {
				if(result) {
					return "redirect:/moim/board?id="+id;
				}
			}       
			return "redirect:/moim/meeting?id="+id;
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
		MembersDTO memData = (MembersDTO) session.getAttribute("loginData");
		
		int memberCnt = SomoimService.getDataCnt(memData.getMemberId());
		boolean chk = false;
		if(memberCnt <= 5) {
			SomoimDTO data = new SomoimDTO();
			data.setLocationId(locationId);
			data.setMoimTitle(moimTitle);
			data.setMoimLimit(moimLimit);
			data.setMoimInfo(moimInfo);
			data.setMoimImagePath("/somoim/resources/img/moim/profile.png");
			data.setCategoryId(categoryId);
	
			boolean result = SomoimService.addData(data);
			
			MoimParticipantsDTO partData = new MoimParticipantsDTO();
			partData.setMemberId(memData.getMemberId());
			partData.setMoimId(data.getMoimId());
			
			boolean res = SomoimService.addDataSub(partData);
			if (result == true && res == true) {
				chk = true;
			}
			json.put("data", chk);
		} else {
			json.put("data", chk);
			json.put("message", "가입가능한 모임 수를 초과하였습니다.");
		}
		return json.toJSONString();
	}

	@RequestMapping(value = "/moim/add/add_join_list", method = RequestMethod.GET)
	@ResponseBody
	public String addJoinList( HttpSession session) {

		MembersDTO membersData = (MembersDTO) session.getAttribute("loginData");
		List<SomoimDTO> participantsData = SomoimService.getDatas(membersData.getMemberId());
		JSONArray join_datas = new JSONArray();
		for (SomoimDTO smoim : (List<SomoimDTO>)participantsData) {
			JSONObject json = new JSONObject();
			json.put("moimId", smoim.getMoimId());
			json.put("moimTitle", smoim.getMoimTitle());
			join_datas.add(json);
		}
		return join_datas.toJSONString();
	}

	@RequestMapping(value = "/moim/add/add_bookmark_list", method = RequestMethod.GET)
	@ResponseBody
	public String addBookMarkList( HttpSession session) {

		JSONArray join_datas = new JSONArray();
		MembersDTO membersData = (MembersDTO) session.getAttribute("loginData");
		List<String> bookmarkData = memberService.getBmkData(membersData.getMemberId());
		List<SomoimDTO> participantsData = SomoimService.getDatas_bmk(bookmarkData);
		for (SomoimDTO smoim : (List<SomoimDTO>)participantsData) {
			JSONObject json = new JSONObject();
			json.put("moimId", smoim.getMoimId());
			json.put("moimTitle", smoim.getMoimTitle());
			join_datas.add(json);
		}
		return join_datas.toJSONString();
	}
	

	@RequestMapping(value = "/moim/meeting", method = RequestMethod.GET)
	public String board(Model model
			        ,@RequestParam int id
			        ,@SessionAttribute("loginData") MembersDTO membersDto ) {

		SomoimDTO moimData = SomoimService.getData(id); //모임정보
		List<MoimParticipantsDTO> moimParticipants = moimParticipantsService.getDatas(id); //참가자정보

		List<MeetingsDTO> meetingsData = meetingsService.getDatas(id);//정모정보

		List<MeetingParticipantsDTO> meetingParticipants = meetingParticipantsService.getDatas(id);

		MoimParticipantsDTO data = new MoimParticipantsDTO();//로그인한유저가 참가자인지 확인
		data.setMemberId(membersDto.getMemberId());
		data.setMoimId(id);
		MoimParticipantsDTO res = moimParticipantsService.getData(data);

		model.addAttribute("res" , res); //로그인한 유저가 참가자인지 확인
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
			            ,@SessionAttribute("loginData") MembersDTO membersDto ) {

		SomoimDTO moimData = SomoimService.getData(id);//모임정보
		List<MoimParticipantsDTO> moimParticipants = moimParticipantsService.getDatas(id); //참가자정보



		List datas = boardsService.getDatas(id); //게시글 전부 가져오기


		int pageCount = 5;

        PagingDTO paging = new PagingDTO (datas,page,pageCount);

        MoimParticipantsDTO data = new MoimParticipantsDTO();//로그인한유저가 참가자인지 확인
		data.setMemberId(membersDto.getMemberId());
		data.setMoimId(id);

		MoimParticipantsDTO res = moimParticipantsService.getData(data);


		   model.addAttribute("res",res);//참가자정보확인하고 가입,작성버튼출력
           model.addAttribute("paging",paging); //PagingDTO 객체 통째로 넘겨주기
		   model.addAttribute("moimData" , moimData); //모임정보
		   model.addAttribute("moimParticipants",moimParticipants); //모임참가자 정보
		
		
		return "moim/board";
	}
	
	@RequestMapping(value = "/moim/modify", method = RequestMethod.GET)
	public String modify(Model model
			,@RequestParam int id
            ,@RequestParam String test
            ,@SessionAttribute("loginData") MembersDTO membersDto) {

	SomoimDTO  somoimDto =	SomoimService.getData(id);
	List<LocationsDTO> locList =  locationService.getAll();
	List<CategorysDTO> categoryList =  categoryService.getAll();


	   model.addAttribute("test",test); //board,meeting 쪽으로 가기하기위한 구분
	   model.addAttribute("locList" , locList);
	   model.addAttribute("categoryList" , categoryList);
	   model.addAttribute("somoimDto" , somoimDto);
		return "moim/meetingmodify";
	}

	@RequestMapping(value = "/moim/update", method = RequestMethod.POST)
     public String update(Model model
			            ,@RequestParam int id
			            ,@RequestParam String test //보드 미팅 리다이렉트시 구분하기위해 넣은 값
			            ,@SessionAttribute("loginData") MembersDTO membersDto
			            ,@RequestParam("locationId") int locationId
			 		    ,@RequestParam String moimTitle
			 		    ,@RequestParam String moimInfo
			 		    ,@RequestParam int moimLimit
			 		    ,@RequestParam int categoryId) {




		SomoimDTO data = new SomoimDTO();
		data.setMoimId(id);
		data.setLocationId(locationId);
		data.setMoimTitle(moimTitle);
		data.setMoimInfo(moimInfo);
		data.setMoimLimit(moimLimit);
		data.setMoimImagePath(null);
		data.setCategoryId(categoryId);


		boolean result = SomoimService.modifyData(data);


		if(test.equals("2")) {
			 return "redirect:/moim/board?id="+id;
		}

		return "redirect:/moim/meeting?id="+id;

		}








   @RequestMapping(value = "/moim/board/add", method = RequestMethod.GET)

	public String boardAddPage(Model model,
			@RequestParam int id
			,HttpSession session
		   ) {

	   model.addAttribute("moimId",id);

		return "moim/boardadd";
	}



	@RequestMapping(value = "/moim/board/add", method = RequestMethod.POST)

	public String boardAdd(Model model,
			@RequestParam int id
			,@RequestParam String boardTitle
			,@RequestParam String content
			,@SessionAttribute("loginData") MembersDTO membersDto ) {

	  BoardsDTO boardsDto = new BoardsDTO();
	  boardsDto.setMoimId(id);
	  boardsDto.setBoardTitle(boardTitle);
	  boardsDto.setContent(content);
	  boardsDto.setMemberId(membersDto.getMemberId());
	  boardsDto.setMemberName(membersDto.getMemberName());

	  boolean result = boardsService.addData(boardsDto);

	  if(result) {
		  return "redirect:/moim/board?id="+id;
	  }

	  return "redirect:/moim/board?id="+id;
	}





	@PostMapping(value = "/moim/imageUpload", produces="application/json; charset=utf-8")
	@ResponseBody
	public String addBoard(Model model
			,@RequestParam int id
			,@RequestParam("moimimage") MultipartFile file
			,HttpServletRequest request) throws Exception {



		SomoimDTO data1 = SomoimService.getData(id);

	 data1.setMoimImagePath(request.getServletContext().getRealPath("/resources/img/")+data1.getMoimId() + ".png");


	boolean res = fileUploadService.modifyMoimImage(data1); //업로드한이미지path를  DB에 저장


	String realPath= request.getServletContext().getRealPath("/resources"); //실제로 파일업로드 할 곳 지정
	file.transferTo(new File(realPath + "/img/" + data1.getMoimId() + ".png"));	//실제로 업로드해주기

	JSONObject json = new JSONObject();
	//json.put("uploaded", 1); //하나의 파일업로드 되었다. //무조건1
	//json.put("fileName", file.getOriginalFilename());//업로드한 파일이름
	json.put("url", request.getContextPath() + "/resources/img/" + data1.getMoimId() + ".png");



		return json.toJSONString();
	}


}