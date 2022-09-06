package com.myweb.somoim.login.controller;

import java.util.List;
import java.util.Locale;

import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.myweb.somoim.categorys.model.CategorysDTO;
import com.myweb.somoim.categorys.service.CategorysService;
import com.myweb.somoim.common.model.LocationsDTO;
import com.myweb.somoim.common.service.LocationsService;
import com.myweb.somoim.members.model.MembersDTO;
import com.myweb.somoim.members.service.MembersService;

@Controller
public class LoginController {
	
	
	@Autowired
	private LocationsService locSerivce;
	
	@Autowired
	private CategorysService categorysService;
	
	@Autowired
	private MembersService membersService;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "form/login";
	}
	
	@RequestMapping(value = "findId", method = RequestMethod.GET)
	public String findId(Locale locale, Model model) {
		
		return "form/findId";
	}
	
	@RequestMapping(value = "findPw", method = RequestMethod.GET)
	public String findPw(Locale locale, Model model) {
		
		return "form/findPw";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		
		List<LocationsDTO> locDatas = locSerivce.getAll();
		List<CategorysDTO> categorysDatas = categorysService.getAll();
		
		model.addAttribute("categorysDatas",categorysDatas);
		model.addAttribute("locDatas", locDatas);
		return "form/join";
	}
	
	@RequestMapping(value = "addJoin", method = RequestMethod.POST)
	public String addJoin(MembersDTO membersDTO
			,@RequestParam (required = false) String year
			,@RequestParam (required = false) String month
			,@RequestParam (required = false) String day
			 ,@RequestParam (required = false) String memberName) {
		System.out.println(membersDTO);
		System.out.println(year+month+day);
		System.out.println(memberName);
		
		String bitrhs = year+month+day;
		
		membersDTO.setBirth(bitrhs);
		
		MembersDTO data = new MembersDTO();
		data.setMemberId(membersDTO.getMemberId());
		data.setMemberName(membersDTO.getMemberName());
		data.setPassword(membersDTO.getPassword());
		data.setGender(membersDTO.getGender());
		data.setBirth(membersDTO.getBirth());
		data.setPhone(membersDTO.getPhone());
		data.setCategory(membersDTO.getCategory());
		data.setLocationId(membersDTO.getLocationId());
		
		System.out.println(data);
		
		boolean result = membersService.addData(data);
		
		if (result) {
			return "form/join";
		}else {
			return "form/join";
		}
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(MembersDTO membersDTO) {
		System.out.println(membersDTO);
		
		
		return "";
	}
	
	@RequestMapping(value = "/login/kakao",method = RequestMethod.GET)
	public String kakaoLogin() {
		UriComponents kakaoAuthUri = UriComponentsBuilder.newInstance()
				.scheme("https").host("kauth.kakao.com").path("/oauth/authoize")
				.queryParam("client_id","9e97acd24d70a166f8d300fad1b72ab7" )
				.queryParam("redirect_uri", "https://localhost/home/")
				.queryParam("response_type", "code").build();
		
		RestTemplate rest = new RestTemplate();
		
		CloseableHttpClient httpCilent = HttpClientBuilder.create().disableRedirectHandling().build();
		
		HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
		
		factory.setHttpClient(httpCilent);
		rest.setRequestFactory(factory);
		
		ResponseEntity<String> restResponse = rest.getForEntity(kakaoAuthUri.toUriString(), String.class);
		
		return "redirect:" + restResponse.getHeaders().getLocation();
	}
}
