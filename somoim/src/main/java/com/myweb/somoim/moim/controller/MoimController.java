package com.myweb.somoim.moim.controller;


import java.io.File;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import oracle.jdbc.proxy.annotation.Post;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
	private SomoimService somoimService;

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
	

	@GetMapping(value = "/moim/join", produces="application/json; charset=utf-8")
	@ResponseBody
	public String moimJoin(Model model,
			@RequestParam int id
			//,@RequestParam String test //보드 미팅 리다이렉트시 구분하기위해 넣은 값
			,@SessionAttribute("loginData") MembersDTO membersDto ) {


	int currentMemberCount = moimParticipantsService.getcurrentMemberCount(id);
	SomoimDTO moimData = somoimService.getData(id); //모임정보


	JSONObject json = new JSONObject();

	if(currentMemberCount >= moimData.getMoimLimit()) {


		json.put("code",   "over");
		json.put("message",   "정원이 이미 마감 되었습니다.");
        return json.toJSONString();
	}else {
		MoimParticipantsDTO dto = new MoimParticipantsDTO();

		dto.setMoimId(id);
		dto.setMemberId(membersDto.getMemberId());


		boolean result = moimParticipantsService.addData(dto);
		json.put("code",   "success");
		json.put("message",   "가입이 완료되었습니다.");
        return json.toJSONString();

	 }


	}

   @RequestMapping(value = "/moim/bookmark", method = RequestMethod.GET)
     public String moimBookMark(Model model,
			@RequestParam int id
			,@RequestParam String test //보드 미팅 리다이렉트시 구분하기위해 넣은 값
			,@SessionAttribute("loginData") MembersDTO membersDto ) {



	     return "redirect:/moim/meeting?id="+id;

   }


   @RequestMapping(value = "/moim/bookmarkAdd", method = RequestMethod.GET)
   public String bookmarkAdd(Model model,
			@RequestParam int id
			//,@RequestParam String test //보드 미팅 리다이렉트시 구분하기위해 넣은 값
			,@SessionAttribute("loginData") MembersDTO membersDto ) {


	   MembersDTO data = memberService.getData(id);

	 // boolean res = memberService.addBookmark(data);




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

		int memberCnt = somoimService.getDataCnt(memData.getMemberId());
		boolean chk = false;
		if(memberCnt < 5) {
			SomoimDTO data = new SomoimDTO();
			data.setLocationId(locationId);
			data.setMoimTitle(moimTitle);
			data.setMoimLimit(moimLimit);
			data.setMoimInfo(moimInfo);
			data.setMoimImagePath("/somoim/resources/img/moim/profile.png");
			data.setCategoryId(categoryId);

			boolean result = somoimService.addData(data);

			MoimParticipantsDTO partData = new MoimParticipantsDTO();
			partData.setMemberId(memData.getMemberId());
			partData.setMoimId(data.getMoimId());

			boolean res = somoimService.addDataSub(partData);
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
		List<SomoimDTO> participantsData = somoimService.getDatas(membersData.getMemberId());
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
		List<SomoimDTO> participantsData = somoimService.getDatas_bmk(bookmarkData);
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

		SomoimDTO moimData = somoimService.getData(id); //모임정보
		List<MoimParticipantsDTO> moimParticipants = moimParticipantsService.getDatas(id); //참가자정보

		List<MeetingsDTO> meetingsData = meetingsService.getDatas(id);//정모정보

		List<MeetingParticipantsDTO> meetingParticipants = meetingParticipantsService.getDatas(id);

		MoimParticipantsDTO data = new MoimParticipantsDTO();//로그인한유저가 참가자인지 확인
		data.setMemberId(membersDto.getMemberId());
		data.setMoimId(id);
		MoimParticipantsDTO res = moimParticipantsService.getData(data);

		int currentMemberCount = moimParticipantsService.getcurrentMemberCount(id); //현재 정원확인

		for(MeetingsDTO a : meetingsData){
			System.out.println(a);
		}

		if(currentMemberCount >= moimData.getMoimLimit() ) {
			model.addAttribute("over" , "초과");
		}
		model.addAttribute("res" , res); //로그인한 유저가 참가자인지 확인
		model.addAttribute("moimData" , moimData);
		model.addAttribute("meetingsData",meetingsData);
		model.addAttribute("moimParticipants",moimParticipants);
		model.addAttribute("meetingParticipants", meetingParticipants);
		model.addAttribute("currentMemberCount", currentMemberCount);

		
		return "moim/meeting";
	}
	
	@RequestMapping(value = "/moim/board", method = RequestMethod.GET)
	public String detail(Model model
			            ,@RequestParam int id
			            ,@RequestParam(defaultValue="1", required=false) int page
			            ,@SessionAttribute("loginData") MembersDTO membersDto ) {

		SomoimDTO moimData = somoimService.getData(id);//모임정보
		List<MoimParticipantsDTO> moimParticipants = moimParticipantsService.getDatas(id); //참가자정보



		List datas = boardsService.getDatas(id); //게시글 전부 가져오기


		int pageCount = 5;

        PagingDTO paging = new PagingDTO (datas,page,pageCount);

        MoimParticipantsDTO data = new MoimParticipantsDTO();//로그인한유저가 참가자인지 확인
		data.setMemberId(membersDto.getMemberId());
		data.setMoimId(id);

		MoimParticipantsDTO res = moimParticipantsService.getData(data);

		int currentMemberCount = moimParticipantsService.getcurrentMemberCount(id);  //현재 정원확인
		if(currentMemberCount >= moimData.getMoimLimit() ) { //정원수 초과할경우 정원마감모임이라고 알려주기
			model.addAttribute("over" , "초과");
		}

		   model.addAttribute("res",res);//참가자정보확인하고 가입,작성버튼출력
           model.addAttribute("paging",paging); //PagingDTO 객체 통째로 넘겨주기
		   model.addAttribute("moimData" , moimData); //모임정보
		   model.addAttribute("moimParticipants",moimParticipants); //모임참가자 정보
		   model.addAttribute("currentMemberCount", currentMemberCount); //현재정원수
		
		return "moim/board";
	}
	
	@RequestMapping(value = "/moim/modify", method = RequestMethod.GET)
	public String modify(Model model
			,@RequestParam int id
            ,@RequestParam String test
            ,@SessionAttribute("loginData") MembersDTO membersDto) {

	SomoimDTO  somoimDto =	somoimService.getData(id);
	List<LocationsDTO> locList =  locationService.getAll();
	List<CategorysDTO> categoryList =  categoryService.getAll();
	int currentMemberCount = moimParticipantsService.getcurrentMemberCount(id); //현재정원알아오기

	   model.addAttribute("test",test); //board,meeting 쪽으로 가기하기위한 구분
	   model.addAttribute("locList" , locList);
	   model.addAttribute("categoryList" , categoryList);
	   model.addAttribute("somoimDto" , somoimDto);
	   model.addAttribute("currentMemberCount", currentMemberCount);
		return "moim/meetingmodify";
	}

	@GetMapping(value = "/moim/remove")
	public String removeMoim(@RequestParam int id){
		boolean removeMeetingPart = meetingParticipantsService.removeData(id);
		boolean removeMeeting = meetingsService.removeData(id);
		boolean removeMoimPart = moimParticipantsService.removeData(id);
		boolean removeBoard = boardsService.removeData(id);
		boolean removeMoim = somoimService.removeData(id);

		return "redirect:/";
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


		boolean result = somoimService.modifyData(data);


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



		SomoimDTO data1 = somoimService.getData(id);


	 data1.setMoimImagePath(request.getContextPath() + "/resources/img/moim/" + data1.getMoimId() + ".png");


	boolean res = fileUploadService.modifyMoimImage(data1); //업로드한이미지path를  DB에 저장


	String realPath= request.getServletContext().getRealPath("/resources"); //실제로 파일업로드 할 곳 지정
	file.transferTo(new File(realPath + "/img/moim/" + data1.getMoimId() + ".png"));	//실제로 업로드해주기

	JSONObject json = new JSONObject();

	json.put("url",   request.getContextPath() + "/resources/img/moim/" + data1.getMoimId() + ".png");



		return json.toJSONString();
	}

	@GetMapping(value="/info/userInfo")
	public String userInfo(HttpSession session, Model model,
						   @RequestParam (required = false) String id) {
		if(((MembersDTO)session.getAttribute("loginData")).getMemberId().equals(id)) {
			return "redirect:/info/myInfo";
		}
		MembersDTO membersDTO = memberService.getData(id);
		List<MoimParticipantsDTO> partDatas = moimParticipantsService.getDatas(membersDTO.getMemberId());
		List<SomoimDTO> moimDatas = new ArrayList<SomoimDTO>();
		List<BoardsDTO> boardDatas = boardsService.getDatas(membersDTO.getMemberId());

		for (MoimParticipantsDTO data : partDatas) {
			SomoimDTO moimData = somoimService.getData(data.getMoimId());
			moimDatas.add(moimData);
		}
		model.addAttribute("moimDatas", moimDatas);
		model.addAttribute("boardDatas", boardDatas);
		model.addAttribute("userInfo", membersDTO);
		return "info/userInfo";
	}

	@GetMapping(value = "/moim/modJob")
	public String modJob(HttpServletRequest request
			,@RequestParam int id
			,@SessionAttribute("loginData") MembersDTO membersDto ) {
		List<MoimParticipantsDTO> moimParticipants = moimParticipantsService.getDatas(id); //참가자정보

		request.setAttribute("moimParticipants",moimParticipants);
		return "form/modJob";
	}

	@GetMapping(value = "/moim/addMeeting")
	public String addMeeting(HttpServletRequest request
			,@RequestParam int id
			,@SessionAttribute("loginData") MembersDTO membersDto ) {

		return "form/addMeeting";
	}

	@PostMapping(value = "/moim/addMeeting")
	public String addMeeting(MeetingsDTO meetingsDTO
			, HttpSession session
			, @RequestParam (required = false) String month
			, @RequestParam (required = false) String day) {
		LocalDate now = LocalDate.now();
		String year = String.valueOf(now.getYear());
		String meetingDate = year + "-" + String.format("%02d", Integer.parseInt(month)) + "-" + String.format("%02d", Integer.parseInt(day));
		Date date = java.sql.Date.valueOf(meetingDate);
		int meetingId = meetingsService.getNextSeq();
		meetingsDTO.setMeetingDate(date);
		meetingsDTO.setMeetingId(meetingId);

		meetingsService.addData(meetingsDTO);

		MeetingParticipantsDTO meetingParticipantsDTO = new MeetingParticipantsDTO();
		meetingParticipantsDTO.setMeetingId(meetingsDTO.getMeetingId());
		meetingParticipantsDTO.setMoimId(meetingsDTO.getMoimId());
		meetingParticipantsDTO.setMemberId(((MembersDTO)session.getAttribute("loginData")).getMemberId());

		meetingParticipantsService.addData(meetingParticipantsDTO);
		return null;
//		boolean result = meetingsService.addData(data);
//
//		if (result) {
//			return "form/join";
//		}else {
//			return "form/join";
//		}
	}

	@PostMapping(value = "/moim/ajax/modJob")
	@ResponseBody
	public String ajaxModJob(HttpServletRequest request
			, @RequestBody List<Map<String, Object>> param) {
		JSONObject jsonObject = new JSONObject();

		for (Map<String, Object> data : param) {
			MoimParticipantsDTO moimParticipantsDTO = new MoimParticipantsDTO();

			moimParticipantsDTO.setMoimId(Integer.parseInt(data.get("moimId").toString()));
			moimParticipantsDTO.setMemberId(data.get("memberId").toString());
			moimParticipantsDTO.setJobId(Integer.parseInt(data.get("job").toString()));

			boolean result = moimParticipantsService.modifyData(moimParticipantsDTO);

			if(!result) {
				jsonObject.put("res", false);
				return jsonObject.toJSONString();
			}
		}
		jsonObject.put("res", true);
		return jsonObject.toJSONString();
	}
}