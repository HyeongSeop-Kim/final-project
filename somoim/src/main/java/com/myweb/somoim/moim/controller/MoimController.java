package com.myweb.somoim.moim.controller;


import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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


	int currentMemberCount = moimParticipantsService.getcurrentMemberCount(id); //현재정원알아오기
	SomoimDTO moimData = SomoimService.getData(id); //모임정보


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

   @RequestMapping(value = "/moim/bookmark", method = RequestMethod.GET)
     public String moimBookMark(Model model,
			@RequestParam int id
			,@RequestParam String test //보드 미팅 리다이렉트시 구분하기위해 넣은 값
			,@SessionAttribute("loginData") MembersDTO membersDto ) {

	   JSONObject json = new JSONObject();

	   int res = memberService.checkBookMarkData(memberId,id);
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

		int memberCnt = SomoimService.getDataCnt(memData.getMemberId());
		boolean chk = false;
		if(memberCnt < 5) {
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

	@RequestMapping(value = "/moim/modify/modify_join_list", method = RequestMethod.GET)
	@ResponseBody
	public String modifyJoinList( HttpSession session) {

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

	@RequestMapping(value = "/moim/modify/modify_bookmark_list", method = RequestMethod.GET)
	@ResponseBody
	public String modifyBookMarkList( HttpSession session) {

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

		int currentMemberCount = moimParticipantsService.getcurrentMemberCount(id); //현재 정원확인

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

		SomoimDTO moimData = SomoimService.getData(id);//모임정보
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
		}


		   model.addAttribute("res",res);//참가자정보확인하고 가입,작성버튼출력
           model.addAttribute("paging",paging); //PagingDTO 객체 통째로 넘겨주기
		   model.addAttribute("moimData" , moimData); //모임정보
		   model.addAttribute("moimParticipants",moimParticipants); //모임참가자 정보
		   model.addAttribute("currentMemberCount", currentMemberCount); //현재정원수
		
		return "moim/board";
	}
	

	@RequestMapping(value = "/moim/boardDetail", method = RequestMethod.GET)
	public String boarDetail(Model model
			            ,@RequestParam int id
			            ,@RequestParam int boardId
			            ,@RequestParam(defaultValue="1", required=false) int page
			            ,@SessionAttribute("loginData") MembersDTO membersDto ) {

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


		return "moim/boarddetail";
	}



	@RequestMapping(value = "/moim/modify", method = RequestMethod.GET)
	public String modify(Model model
			,@RequestParam int id
            ,@RequestParam String test
            ,@SessionAttribute("loginData") MembersDTO membersDto) {

	SomoimDTO  somoimDto =	SomoimService.getData(id);
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


	@GetMapping(value = "/moim/board/delete", produces="application/json; charset=utf-8")
	@ResponseBody
	   public String BoardDelete(Model model,
			    @RequestParam int bid
				,@SessionAttribute("loginData") MembersDTO membersDto ) {

		System.out.println("여기로 넘어오나");
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






	@PostMapping(value = "/moim/imageUpload", produces="application/json; charset=utf-8")
	@ResponseBody
	public String addBoard(Model model
			,@RequestParam int id
			,@RequestParam("moimimage") MultipartFile file
			,HttpServletRequest request) throws Exception {



		SomoimDTO data1 = SomoimService.getData(id);


	 data1.setMoimImagePath(request.getContextPath() + "/resources/img/moim/" + data1.getMoimId() + ".png");


	boolean res = fileUploadService.modifyMoimImage(data1); //업로드한이미지path를  DB에 저장


	String realPath= request.getServletContext().getRealPath("/resources"); //실제로 파일업로드 할 곳 지정
	file.transferTo(new File(realPath + "/img/moim/" + data1.getMoimId() + ".png"));	//실제로 업로드해주기

	JSONObject json = new JSONObject();

	json.put("url",   request.getContextPath() + "/resources/img/moim/" + data1.getMoimId() + ".png");



		return json.toJSONString();
	}


}