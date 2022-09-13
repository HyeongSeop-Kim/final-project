package com.myweb.somoim.controller;

import java.awt.print.Pageable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.myweb.somoim.categorys.model.CategorysDTO;
import com.myweb.somoim.categorys.service.CategorysService;
import com.myweb.somoim.common.model.PagingDTO;
import com.myweb.somoim.members.model.MembersDTO;
import com.myweb.somoim.members.service.MembersService;
import com.myweb.somoim.model.SomoimDTO;
import com.myweb.somoim.participants.model.MoimParticipantsDTO;
import com.myweb.somoim.participants.service.MoimParticipantsService;
import com.myweb.somoim.service.SomoimService;

@Controller
public class SomoimController {
	
	private static final Logger logger = LoggerFactory.getLogger(SomoimController.class);
	
	@Autowired
	private SomoimService service;
	
	@Autowired
	private CategorysService categoryService;
	
	@Autowired
	private	MoimParticipantsService moimParticipantsService;
	
	@Autowired
	private MembersService memberservice;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String moimMain(HttpSession session) {
		MembersDTO membersData = (MembersDTO) session.getAttribute("loginData");
		String memberId = membersData.getMemberId();
		MembersDTO bookmarkData = memberservice.getData(memberId);
		return "somoim";
	}
	
// 리스트 뽑기	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public String moimList(@RequestParam(defaultValue="1", required=false) int page //현재페이지
			, @RequestParam("page_count") int pageCount //한페이지에 몇개 게시물
			, @RequestParam("list_search") String search
			, @RequestParam("category_id") int categoryId) {
		Map res_data = service.getAll(page, pageCount, search, categoryId);
		List datas = (List)res_data.get("datas"); // 가져온 데이터 리스트
		PagingDTO pager = (PagingDTO)res_data.get("page_data"); // 가져온 페이징 객체
		JSONArray data_arr = new JSONArray(); // 가져온 데이터 리스트를 넣는 배열
		JSONObject page_obj = new JSONObject(); // 가져온 페이징 데이터를 넣는 객체
		JSONObject rtn_data = new JSONObject(); // 결과값
		for (SomoimDTO smoim : (List<SomoimDTO>)datas) {
			JSONObject json = new JSONObject();
			json.put("moimId", smoim.getMoimId());
			json.put("moimTitle", smoim.getMoimTitle());
			json.put("moimInfo", smoim.getMoimInfo());
			json.put("moimLimit", smoim.getMoimLimit());
			json.put("locationId", smoim.getLocationId());
			json.put("moimImagePath", smoim.getMoimImagePath());
			json.put("locationName", smoim.getLocationName());
			data_arr.add(json);
		}
		page_obj.put("c_page", pager.getCurrentPageNumber());
		page_obj.put("pagelist", pager.getPageList());
		page_obj.put("n_page", pager.getNextPageNumber());
		page_obj.put("p_page", pager.getPrevPageNumber());
		page_obj.put("is_npage", pager.isNextPage());
		page_obj.put("is_ppage", pager.isPrevPage());
		rtn_data.put("datas", data_arr);
		rtn_data.put("pager", page_obj);
		return rtn_data.toJSONString();
	}
	
	@RequestMapping(value = "/join_list", method = RequestMethod.GET)
	@ResponseBody
	public String joinList( HttpSession session) {
		
		MembersDTO membersData = (MembersDTO) session.getAttribute("loginData");
		List<SomoimDTO> participantsData = service.getDatas(membersData.getMemberId());
		JSONArray join_datas = new JSONArray();
		for (SomoimDTO smoim : (List<SomoimDTO>)participantsData) {
			JSONObject json = new JSONObject(); 
			json.put("moimId", smoim.getMoimId());
			json.put("moimTitle", smoim.getMoimTitle());
			join_datas.add(json);
		}
		return join_datas.toJSONString();
	}
	
	@RequestMapping(value = "/bookmark_list", method = RequestMethod.GET)
	@ResponseBody
	public String bookMarkList( HttpSession session) {
		
		MembersDTO membersData = (MembersDTO) session.getAttribute("loginData");
		MembersDTO bookmarkData = memberservice.getData(membersData.getMemberId());
		List<SomoimDTO> participantsData = service.getDatas_bmk(bookmarkData.getBookmark());
		
		JSONArray join_datas = new JSONArray();
		
		return join_datas.toJSONString();
	}

	
	@GetMapping(value="/userInfo") 
	public String info() {
		return "info/userInfo";
	}

	@GetMapping(value = "category")
	public String category(Locale locale, Model model) {

		return "form/category";
	}

//	@PostMapping(value = "/ajax/cate")
//	@ResponseBody
//	public String ajaxCategory(@RequestBody List<Map<String, Object>> param) throws Exception {
//		System.out.println(param);
//		return null;
//	}
	
}
