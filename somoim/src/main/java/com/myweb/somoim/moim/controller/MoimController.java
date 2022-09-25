package com.myweb.somoim.moim.controller;


import java.io.File;
import java.util.*;
import java.sql.Date;
import java.time.LocalDate;

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
import com.myweb.somoim.moim.model.CommentsDTO;
import com.myweb.somoim.moim.model.MeetingsDTO;
import com.myweb.somoim.moim.service.BoardsService;
import com.myweb.somoim.moim.service.CommentsService;
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

	@Autowired
	private CommentsService commentsService;


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


	int memberJoinMoimCount =  moimParticipantsService.getMemberJoinMoimCount(membersDto.getMemberId()); //멤버가 가입한 모임수알아오기


	Map map = new HashMap();
	map.put("id", id);
	map.put("memberId", membersDto.getMemberId());

	boolean memberAlreadyJoin = moimParticipantsService.getMemberAlreadyJoin(map);

	JSONObject json = new JSONObject();
	if(memberAlreadyJoin) { //로그인유저가 이미 가입한 모임인경우
		json.put("code",   "alreadyJoinMember");
		json.put("message",   "이미 가입한 모임입니다.");
        return json.toJSONString();
	}else if(currentMemberCount >= moimData.getMoimLimit()) { //모임 정원이 마감된 경우
        json.put("code",   "over");
		json.put("message",   "정원이 이미 마감 되었습니다.");
        return json.toJSONString();
	}else if(memberJoinMoimCount >= 5 ) { //로그인한 멤버가 모임5개가 넘는경우
	    json.put("code",   "joinCountover");
		json.put("message",   "가입 가능한 모임수를 초과했습니다. 가입 가능한 모임수는 5개 입니다.");
	    return json.toJSONString();
	}else {  //가입
		MoimParticipantsDTO dto = new MoimParticipantsDTO();

		dto.setMoimId(id);
		dto.setMemberId(membersDto.getMemberId());
		boolean result = moimParticipantsService.addData(dto);
		json.put("code",   "success");
		json.put("message",   "가입이 완료되었습니다.");
        return json.toJSONString();

	 }


	}



	@GetMapping(value = "/moim/leave", produces="application/json; charset=utf-8")
	@ResponseBody
	public String moimLeave(Model model,
			 @RequestParam int id
			,@SessionAttribute("loginData") MembersDTO membersDto ) {

		JSONObject json = new JSONObject();



	Map map = new HashMap();
	map.put("id", id);
	map.put("memberId", membersDto.getMemberId());

	boolean memberAlreadyJoin = moimParticipantsService.getMemberAlreadyJoin(map); //가입했던유저인지 먼저확인


	MoimParticipantsDTO BossData = moimParticipantsService.getData(id); //모임장확인



	if(memberAlreadyJoin) {
		if(BossData.getMemberId().equals(membersDto.getMemberId())) { //로그인한 유저가 모임장인지 확인
			json.put("code",   "bossMember");
			json.put("message",   "모임장은 탈퇴할 수 없습니다. 다른 멤버에게 모임장 권한을 위임하세요.");
	        return json.toJSONString();
		}else {

			moimParticipantsService.removeData(map);  //탈퇴처리
			json.put("code",   "success");
			json.put("message",   "탈퇴 되었습니다.");
	        return json.toJSONString();

	     }
	}else {
		json.put("code",   "alreadyleaveMember");
		json.put("message",   "이미 탈퇴한 멤버입니다.");
        return json.toJSONString();

	}



	 }





	@GetMapping(value = "/moim/bookmarkAdd", produces="application/json; charset=utf-8")
	@ResponseBody
	public String bookmarkAdd(Model model,
							  @RequestParam int id,
							  @RequestParam String memberId
							  //,@RequestParam String test //보드 미팅 리다이렉트시 구분하기위해 넣은 값
			,@SessionAttribute("loginData") MembersDTO membersDto ) {
		if(id == 0) {
			return null;
		}
		JSONObject json = new JSONObject();


		MembersDTO membersDTO = new MembersDTO();
		membersDTO.setMemberId(memberId);
		MembersDTO membersData = memberService.getData(membersDTO);
		if(membersData.getBookmark() == null){
			membersData.setBookmark(",");
		}

		memberService.modifyData(membersData);

		int res = memberService.checkBookMarkData(memberId, id);

		if(res == 1) {
			json.put("code",   "alreadybookmark");
			json.put("message",   "이미 찜한 모임입니다.");
			return json.toJSONString();
		}else if(res == 2 ) {
			json.put("code",   "bookmarkover");
			json.put("message",   "찜 가능한 모임수를 초과 하였습니다. 찜은 5개까지 가능합니다.");
			return json.toJSONString();
		}else if(res == 4) {
			boolean res1 = memberService.addBookmark(memberId,id);
			if(res1) {
				json.put("code",   "bookmarked");
				json.put("message",   "찜 되었습니다.");
				return json.toJSONString();
			}
		}

		json.put("code",   "error");
		json.put("message",   "알 수 없는 오류가 발생했습니다. 다시 시도해주세요");
		return json.toJSONString();

	}
   @GetMapping(value = "/moim/bookmarkDelete", produces="application/json; charset=utf-8")
   @ResponseBody
   public String bookmarkDelete(Model model,
		    @RequestParam int id,
			@RequestParam String memberId
			//,@RequestParam String test //보드 미팅 리다이렉트시 구분하기위해 넣은 값
			,@SessionAttribute("loginData") MembersDTO membersDto ) {

	   JSONObject json = new JSONObject();

	   int res = memberService.checkBookMarkData(memberId,id);

	   if(res == 1) {
		   boolean res1 = memberService.deleteBookmark(memberId,id); //삭제기능넣어줘야함
		   if(res1) {
			   json.put("code",   "deletebookmark");
			   json.put("message",   "찜이 해제 되었습니다.");
			   return json.toJSONString();
			}
		 }else if(res == 4 ) {
		   json.put("code",   "alreadybookmarkdelete");
		   json.put("message",   "이미 찜이 해제 되었습니다.");
		   return json.toJSONString();
	     }
		 else if(res == 3 ) {
			   json.put("code",   "nodetabookmark");
			   json.put("message",   "찜 기록이 존재하지않습니다.");
			   return json.toJSONString();
		   }

	   json.put("code",   "error");
	   json.put("message",   "알 수 없는 오류가 발생했습니다. 다시 시도해주세요");
	   return json.toJSONString();



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

	@RequestMapping(value = "/moim/modify/modify_join_list", method = RequestMethod.GET)
	@ResponseBody
	public String modifyJoinList( HttpSession session) {

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

	@RequestMapping(value = "/moim/modify/modify_bookmark_list", method = RequestMethod.GET)
	@ResponseBody
	public String modifyBookMarkList( HttpSession session) {

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

	@RequestMapping(value = "/moim/board/add/board_join_list", method = RequestMethod.GET)
	@ResponseBody
	public String boardJoinList( HttpSession session) {

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

	@RequestMapping(value = "/moim/board/add/board_bookmark_list", method = RequestMethod.GET)
	@ResponseBody
	public String boardBookMarkList( HttpSession session) {

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

		CategorysDTO categorysDTO = categoryService.getData(moimData.getCategoryId());  // 카테고리 정보
		String categoryName = categorysDTO.getCategoryName();

		int currentMemberCount = moimParticipantsService.getcurrentMemberCount(id); //현재 정원확인

		for(MeetingsDTO a : meetingsData){
			System.out.println(a);
		}

		if(currentMemberCount >= moimData.getMoimLimit() ) {
			model.addAttribute("over" , "초과");
		}

		int bookmarkcheck = memberService.checkBookMarkData(membersDto.getMemberId(),id); //북마크체크
		if(bookmarkcheck == 1 ) {
			model.addAttribute("bookmarkcheck" , bookmarkcheck);
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

		int bookmarkcheck = memberService.checkBookMarkData(membersDto.getMemberId(),id); //북마크체크
		if(bookmarkcheck == 1 ) {
			model.addAttribute("bookmarkcheck" , bookmarkcheck);
		}else if(bookmarkcheck == 3) {
			model.addAttribute("bookmarkcheck" , bookmarkcheck);
		}


		   model.addAttribute("res",res);//참가자정보확인하고 가입,작성버튼출력
           model.addAttribute("paging",paging); //PagingDTO 객체 통째로 넘겨주기
		   model.addAttribute("moimData" , moimData); //모임정보
		   model.addAttribute("moimParticipants",moimParticipants); //모임참가자 정보
		   model.addAttribute("currentMemberCount", currentMemberCount); //현재정원수
		
		return "moim/board";
	}
	

	@RequestMapping(value = "/moim/board/modify", method = RequestMethod.GET) //수정화면
	public String boardModify(Model model
			            ,@RequestParam int id
			            ,@RequestParam int boardId
			            ,@SessionAttribute("loginData") MembersDTO membersDto ) {

		SomoimDTO moimData = somoimService.getData(id);//모임정보
		List<MoimParticipantsDTO> moimParticipants = moimParticipantsService.getDatas(id); //참가자정보

		MoimParticipantsDTO partData = new MoimParticipantsDTO();//로그인한유저가 참가자인지 확인
		partData.setMemberId(membersDto.getMemberId());
		partData.setMoimId(id);

		MoimParticipantsDTO res = moimParticipantsService.getData(partData);

		int currentMemberCount = moimParticipantsService.getcurrentMemberCount(id);  //현재 정원확인
		if(currentMemberCount >= moimData.getMoimLimit() ) { //정원수 초과할경우 정원마감모임이라고 알려주기
			model.addAttribute("over" , "초과");
		}

		int bookmarkcheck = memberService.checkBookMarkData(membersDto.getMemberId(),id); //북마크체크
		if(bookmarkcheck == 1 ) {
			model.addAttribute("bookmarkcheck" , bookmarkcheck);
		}else if(bookmarkcheck == 3) {
			model.addAttribute("bookmarkcheck" , bookmarkcheck);
		}

		model.addAttribute("res",res);//참가자정보확인하고 가입,작성버튼출력
		model.addAttribute("moimData" , moimData); //모임정보
		model.addAttribute("moimParticipants",moimParticipants); //모임참가자 정보
		model.addAttribute("currentMemberCount", currentMemberCount); //현재정원수

		BoardsDTO data =  boardsService.getData(boardId);//존재하는 게시글인지 확인


		if(data == null) {
			  model.addAttribute("id",id);
			  model.addAttribute("data",data);

		}else {
			model.addAttribute("id",id);
			model.addAttribute("data",data);

		}

		return "moim/boardmodify";
	}



	  @PostMapping(value = "/moim/board/modify" , produces="application/json; charset=utf-8") //게시글수정
	  @ResponseBody
	  public String boarModify(Model model
			            ,@RequestParam int id
			            ,@RequestParam int boardId
			            ,@RequestParam String boardTitle
						,@RequestParam String content
			            ,@SessionAttribute("loginData") MembersDTO membersDto ) {



		BoardsDTO boardDto = new BoardsDTO(); //board가져오기
		boardDto.setBoardId(boardId);
		boardDto.setContent(content);
		boardDto.setBoardTitle(boardTitle);

		 JSONObject json = new JSONObject();

		 BoardsDTO data =  boardsService.getData(boardId);

		 if(data == null) {
			   json.put("code",   "notexist");
			   json.put("message",   "이미 삭제되었거나 존재하지않은 데이터입니다.");
			   return json.toJSONString();

		 }else {
			  boolean res = boardsService.modifyData(boardDto);

				if(res) {
					 json.put("code",   "success");
					 json.put("message",   "수정이 완료되었습니다.");
					 return json.toJSONString();
				}else {
					 json.put("code",   "error");
					 json.put("message",   "알수없는 에러로 게시글 수정에 실패했습니다.");
					 return json.toJSONString();
				}
		 }
	}


	@RequestMapping(value = "/moim/boardDetail", method = RequestMethod.GET)
	public String boarDetail(Model model
			            ,@RequestParam int id
			            ,@RequestParam int boardId
			            ,@RequestParam(defaultValue="1", required=false) int page
			            ,@SessionAttribute("loginData") MembersDTO membersDto ) {

		SomoimDTO moimData = somoimService.getData(id);//모임정보
		List<MoimParticipantsDTO> moimParticipants = moimParticipantsService.getDatas(id); //참가자정보

		MoimParticipantsDTO part = new MoimParticipantsDTO();//로그인한유저가 참가자인지 확인
		part.setMemberId(membersDto.getMemberId());
		part.setMoimId(id);

		MoimParticipantsDTO res = moimParticipantsService.getData(part);

		int currentMemberCount = moimParticipantsService.getcurrentMemberCount(id);  //현재 정원확인
		if(currentMemberCount >= moimData.getMoimLimit() ) { //정원수 초과할경우 정원마감모임이라고 알려주기
			model.addAttribute("over" , "초과");
		}

		int bookmarkcheck = memberService.checkBookMarkData(membersDto.getMemberId(),id); //북마크체크
		if(bookmarkcheck == 1 ) {
			model.addAttribute("bookmarkcheck" , bookmarkcheck);
		}

		BoardsDTO boardDto = new BoardsDTO(); //board가져오기
		boardDto.setBoardId(boardId);
		boardDto.setMoimId(id);
		BoardsDTO data =  boardsService.getData(boardDto);


		Map map = new HashMap();   //comments list가져오기
		map.put("id", id); //가져온 데이터에 키와 벨류값을 지정
		map.put("boardId", boardId);
		List datas = commentsService.getDatas(map);

		int pageCount = 5;

		PagingDTO paging = new PagingDTO (datas,page,pageCount);


		model.addAttribute("data",data);//boardId로 정보받아오기
		model.addAttribute("paging",paging); //PagingDTO 객체 통째로 넘겨주기
		model.addAttribute("res",res);//참가자정보확인하고 가입,작성버튼출력
		model.addAttribute("moimData" , moimData); //모임정보
		model.addAttribute("moimParticipants",moimParticipants); //모임참가자 정보
		model.addAttribute("currentMemberCount", currentMemberCount); //현재정원수


		return "moim/boarddetail";
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
	public String removeMoim(HttpSession session, @RequestParam int id){
		MembersDTO loginData = (MembersDTO)session.getAttribute("loginData");
		MoimParticipantsDTO moimParticipantsDTO = new MoimParticipantsDTO();
		moimParticipantsDTO.setMemberId(loginData.getMemberId());
		moimParticipantsDTO.setMoimId(id);
		MoimParticipantsDTO moimParticipantsData = moimParticipantsService.getData(moimParticipantsDTO);
		if(moimParticipantsData.getJobId() == 1) {
			boolean removeMeetingPart = meetingParticipantsService.removeDatas(id);
			boolean removeMeeting = meetingsService.removeData(id);
			boolean removeMoimPart = moimParticipantsService.removeData(id);
			boolean removeBoard = boardsService.removeBoardsData(id);
			boolean removeMoim = somoimService.removeData(id);
		} else {
			return null;	// 에러페이지로
		}

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

	public String boardAddPage(Model model
		   ,@RequestParam int id
		   ,@SessionAttribute("loginData") MembersDTO membersDto ) {

	   SomoimDTO moimData = somoimService.getData(id);//모임정보
	   List<MoimParticipantsDTO> moimParticipants = moimParticipantsService.getDatas(id); //참가자정보

	   MoimParticipantsDTO data = new MoimParticipantsDTO();//로그인한유저가 참가자인지 확인
	   data.setMemberId(membersDto.getMemberId());
	   data.setMoimId(id);

	   MoimParticipantsDTO res = moimParticipantsService.getData(data);

	   int currentMemberCount = moimParticipantsService.getcurrentMemberCount(id);  //현재 정원확인
	   if(currentMemberCount >= moimData.getMoimLimit() ) { //정원수 초과할경우 정원마감모임이라고 알려주기
		   model.addAttribute("over" , "초과");
	   }

	   int bookmarkcheck = memberService.checkBookMarkData(membersDto.getMemberId(),id); //북마크체크
	   if(bookmarkcheck == 1 ) {
		   model.addAttribute("bookmarkcheck" , bookmarkcheck);
	   }else if(bookmarkcheck == 3) {
		   model.addAttribute("bookmarkcheck" , bookmarkcheck);
	   }

	   model.addAttribute("res",res);//참가자정보확인하고 가입,작성버튼출력
	   model.addAttribute("moimData" , moimData); //모임정보
	   model.addAttribute("moimParticipants",moimParticipants); //모임참가자 정보
	   model.addAttribute("currentMemberCount", currentMemberCount); //현재정원수
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


	@GetMapping(value = "/moim/board/delete", produces="application/json; charset=utf-8")
	@ResponseBody
	   public String BoardDelete(Model model,
			    @RequestParam int bid
				,@SessionAttribute("loginData") MembersDTO membersDto ) {


		   JSONObject json = new JSONObject();

		   BoardsDTO data = boardsService.getData(bid);


		   if(data == null) {
			       json.put("code",   "alreadyDelete");
				   json.put("message",   "이미 삭제된 게시물 입니다.");
				   return json.toJSONString();
				}else  {
					System.out.println("코멘트삭제1");
				boolean result = commentsService.removeData(bid);  //코멘트 먼저 삭제
				System.out.println("코멘트삭제하러");
				boolean res = boardsService.removeData(bid);
			    if(res) {
			    	json.put("code",   "success");
					json.put("message",   "게시물이 삭제되었습니다.");
					return json.toJSONString();
			    }else {
			    	json.put("code",   "error");
					json.put("message",   "알 수 없는 에러가 발생했습니다.");
					return json.toJSONString();
			    }
			 }

	 }




	@RequestMapping(value = "/moim/board/comment/add", method = RequestMethod.POST)

	public String commentAdd(Model model,
			@RequestParam int id
			,@RequestParam int bid
			,@RequestParam String content
			,@SessionAttribute("loginData") MembersDTO membersDto ) {


	  CommentsDTO commentsDto = new CommentsDTO();
	  commentsDto.setMoimId(id);
	  commentsDto.setBoardId(bid);
	  commentsDto.setContent(content);
	  commentsDto.setMemberId(membersDto.getMemberId());


	  boolean result = commentsService.addData(commentsDto);


	  if(result) {
		  return "redirect:/moim/boardDetail?id="+id+"&boardId="+bid;
	  }

	  return "redirect:/moim/boardDetail?id="+id+"&boardId="+bid;
	}



	@PostMapping(value = "/moim/board/comment/modify", produces="application/json; charset=utf-8")
	@ResponseBody
	public String commentModify(Model model,
			//@RequestParam int id
			@RequestParam int cid
		   ,@RequestParam String content
		   ,@SessionAttribute("loginData") MembersDTO membersDto ) {


		System.out.println("댓글아이디"+cid);
		System.out.println("댓글내용"+content);

		CommentsDTO data = commentsService.getData(cid); //댓글존재하는지


	  CommentsDTO commentsDto = new CommentsDTO();
	  //commentsDto.setMoimId(id);
	  //commentsDto.setBoardId(bid);
      //commentsDto.setMemberId(membersDto.getMemberId());

	  commentsDto.setContent(content);
	  commentsDto.setCommentId(cid);

	  JSONObject json = new JSONObject();





	  if(data == null) {
		   json.put("code",   "notexist");
		   json.put("message",   "이미 삭제되었거나 존재하지않은 데이터입니다.");
		   return json.toJSONString();
		}else  {
		   boolean res = commentsService.modifyComment(commentsDto);//코멘트 업데이트

			    if(res) {
			    	json.put("code",   "success");
					json.put("message",   "게시물이 수정되었습니다.");
					return json.toJSONString();
			    }else {
			    	json.put("code",   "error");
					json.put("message",   "알 수 없는 에러가 발생했습니다.");
					return json.toJSONString();
			    }
	 }
	}



	@GetMapping(value = "/moim/board/comment/delete", produces="application/json; charset=utf-8")
	@ResponseBody
	   public String CommentDelete(Model model,
			   // @RequestParam int bid
			    @RequestParam int cid
				,@SessionAttribute("loginData") MembersDTO membersDto ) {


		   JSONObject json = new JSONObject();

		   CommentsDTO data = commentsService.getData(cid); //댓글존재하는지



		   if(data == null) {
			       json.put("code",   "alreadyDelete");
				   json.put("message",   "이미 삭제되었거나 존재하지 않는 댓글입니다. ");
				   return json.toJSONString();
				}else  {
				boolean result = commentsService.removeComment(cid);  //코멘트 삭제

			    if(result) {
			    	json.put("code",   "success");
					json.put("message",   "댓글이 삭제되었습니다.");
					return json.toJSONString();
			    }else {
			    	json.put("code",   "error");
					json.put("message",   "알 수 없는 에러가 발생했습니다.");
					return json.toJSONString();
			    }
			 }

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
		MembersDTO membersDTO = memberService.getMemData(id);
		List<MoimParticipantsDTO> partDatas = moimParticipantsService.getDatas(membersDTO.getMemberId());
		List<SomoimDTO> moimDatas = new ArrayList<SomoimDTO>();
		List<BoardsDTO> boardDatas = boardsService.getDatas(membersDTO.getMemberId());
		List<CommentsDTO> commentsDatas = commentsService.getDatas(membersDTO.getMemberId());
		List<BoardsDTO> boardsId = new ArrayList<BoardsDTO>();

		for (MoimParticipantsDTO data : partDatas) {
			SomoimDTO moimData = somoimService.getData(data.getMoimId());
			moimDatas.add(moimData);
		}
		for (CommentsDTO data : commentsDatas) {
			BoardsDTO boardId = boardsService.getData(data.getBoardId());
			boardsId.add(boardId);
		}
		model.addAttribute("moimDatas", moimDatas);
		model.addAttribute("boardDatas", boardDatas);
		model.addAttribute("userInfo", membersDTO);
		model.addAttribute("commentsDatas", commentsDatas);
		model.addAttribute("boardsId", boardsId);

		return "info/userInfo";
	}

	@GetMapping(value = "/moim/modJob")
	public String modJob(HttpServletRequest request
			,@RequestParam int id
			,@SessionAttribute("loginData") MembersDTO loginData ) {
		MoimParticipantsDTO moimParticipantsDTO = new MoimParticipantsDTO();
		moimParticipantsDTO.setMemberId(loginData.getMemberId());
		moimParticipantsDTO.setMoimId(id);
		MoimParticipantsDTO moimParticipantsData = moimParticipantsService.getData(moimParticipantsDTO);
		if(moimParticipantsData.getJobId() == 1) {
			List<MoimParticipantsDTO> moimParticipants = moimParticipantsService.getDatas(id); //참가자정보

			request.setAttribute("moimParticipants",moimParticipants);
		} else {
			return null;	// 에러페이지로
		}

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
			, @RequestParam int id
			, @RequestParam (required = false) String month
			, @RequestParam (required = false) String day) {
		List<MeetingParticipantsDTO> meetingParticipantsDatas = meetingParticipantsService.getDatas(id);
		if(meetingParticipantsDatas.size()<4) {
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
			return "/moim/addMeeting";
		} else {
			return null; // eror페이지로 이동
		}

//		boolean result = meetingsService.addData(data);
//
//		if (result) {
//			return "form/join";
//		}else {
//			return "form/join";
//		}
	}

	@GetMapping(value = "/moim/modMeeting")
	public String modMeeting(Model model
			,@RequestParam int meetingId
			,@SessionAttribute("loginData") MembersDTO membersDto ) {
		MeetingsDTO meetingData = meetingsService.getData(meetingId);
		model.addAttribute("meetingData", meetingData);

		return "form/modMeeting";
	}

	@PostMapping(value = "/moim/modMeeting")
	public String modMeeting(MeetingsDTO modData
			, HttpSession session
			, @RequestParam (required = false) String month
			, @RequestParam (required = false) String day) {
		LocalDate now = LocalDate.now();
		String year = String.valueOf(now.getYear());
		String meetingDate = year + "-" + String.format("%02d", Integer.parseInt(month)) + "-" + String.format("%02d", Integer.parseInt(day));
		Date date = java.sql.Date.valueOf(meetingDate);

		modData.setMeetingDate(date);

		boolean res = meetingsService.modifyData(modData);

		return null;

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

	@PostMapping(value = "/moim/ajax/meetingPart")
	@ResponseBody
	public String ajaxMeetingPart(@RequestBody Map<String, Object> param) {
		String memberId = param.get("memberId").toString();
		int moimId = Integer.parseInt(param.get("moimId").toString());
		int meetingId = Integer.parseInt(param.get("meetingId").toString());
		JSONObject jsonObject = new JSONObject();
		boolean res = false;

		MeetingParticipantsDTO meetingParticipantsData = new MeetingParticipantsDTO();
		meetingParticipantsData.setMoimId(moimId);
		meetingParticipantsData.setMemberId(memberId);
		meetingParticipantsData.setMeetingId(meetingId);
		MeetingParticipantsDTO meetingParticipantsDTO = meetingParticipantsService.getData(meetingParticipantsData);

		if(meetingParticipantsDTO == null) {
			res = meetingParticipantsService.addData(meetingParticipantsData);
			jsonObject.put("msg", "참가 신청이 완료되었습니다.");
		} else {
			res = meetingParticipantsService.removeData(meetingParticipantsDTO);
			jsonObject.put("msg", "참가 신청이 취소되었습니다.");
		}
		if(!res) {
			jsonObject.replace("msg", "참가 신청 중 오류가 발생했습니다.");
		}
		return jsonObject.toJSONString();
	}

	@PostMapping(value = "/moim/ajax/removeMeeting")
	@ResponseBody
	public String ajaxRemoveMeeting(@RequestBody Map<String, Object> param) {
		int meetingId = Integer.parseInt(param.get("meetingId").toString());
		JSONObject jsonObject = new JSONObject();
		boolean res = false;

		MeetingsDTO meetingsDTO = meetingsService.getData(meetingId);

		if(meetingsDTO == null) {
			jsonObject.put("msg", "해당 정모를 찾을 수 없습니다.");
		} else {
			res = meetingParticipantsService.removeMeetingDatas(meetingId)
				&& meetingsService.removeMeetingData(meetingsDTO.getMeetingId());

			jsonObject.put("msg", "삭제가 완료되었습니다.");
		}
		if(!res) {
			jsonObject.replace("msg", "정모 삭제 중 오류가 발생했습니다.");
		}
		return jsonObject.toJSONString();
	}
}