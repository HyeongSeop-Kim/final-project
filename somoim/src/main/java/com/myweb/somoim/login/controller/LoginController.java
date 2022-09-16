package com.myweb.somoim.login.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String home(Model model) {
		
		return "form/login";
	}
	
	@RequestMapping(value = "findId", method = RequestMethod.GET)
	public String findId(Locale locale, Model model) {
		
		return "form/findId";
	}
	@PostMapping(value = "findId", produces="application/json; charset=utf-8")
	@ResponseBody
	public String findId(MembersDTO data) throws Exception {
		MembersDTO result = membersService.selectFindId(data);
		
		JSONObject json = new JSONObject();
		
		if(result== null) {
			json.put("code", "noData");
			json.put("message", "해당 데이터가 존재하지 않습니다.");
		}else {
			json.put("code", "success");
			json.put("id", result.getMemberId());
			
		}

		return json.toJSONString();
	}
	
	
	@RequestMapping(value = "findPw", method = RequestMethod.GET)
	public String findPw(Locale locale, Model model) {
		
		return "form/findPw";
	}
	
	@PostMapping(value = "findPw", produces="application/json; charset=utf-8")
	@ResponseBody
	public String findPw(MembersDTO data) throws Exception {
		MembersDTO result = membersService.selectFindPw(data);
		JSONObject json = new JSONObject();
		
		if(result== null) {
			json.put("code", "noData");
			json.put("message", "해당 데이터가 존재하지 않습니다.");
		}else {
			json.put("code", "success");
			json.put("pw", result.getPassword());
			
		}

		return json.toJSONString();
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
	public String login(MembersDTO membersDTO
			,HttpSession session, Model model
			,HttpServletRequest request
			,HttpServletResponse response
			,@RequestParam(value = "userCookies", required = false) boolean checkboxValue) {
		System.out.println("체크박스" + checkboxValue);
		
		if ( session.getAttribute("loginData") != null) {
			//기존의 loginData 란 세션 값이 존재한다면 제거
			session.removeAttribute("loginData");   //기존 값 제거후 로그인
		}
		MembersDTO data = membersService.getLogin(session, membersDTO);
		
		
		if(data !=null) {
			// 로그인 성공
			session.setAttribute("loginData", data);
			
			if (checkboxValue){
				 Cookie cookie = new Cookie("loginCookie", session.getId());
				 cookie.setPath("/");
				 cookie.setMaxAge(60);
				 response.addCookie(cookie); 
			}
			return "redirect:/";
		} else {
			// 로그인 실패
			return home(model);
		}
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		// session.invalidate();
		session.invalidate();
		return "somoim_m";
	}
	
	@RequestMapping(value = "/login/kakao",method = RequestMethod.GET)
	public String kakaoLogin() {
		UriComponents kakaoAuthUri = UriComponentsBuilder.newInstance()
				.scheme("https").host("kauth.kakao.com").path("/oauth/authoize")
				.queryParam("client_id","9e97acd24d70a166f8d300fad1b72ab7" )
				.queryParam("redirect_uri", "http://localhost/somoim/login/kakao/auth_code")
				.queryParam("response_type", "code").build();
		
		RestTemplate rest = new RestTemplate();
		
		CloseableHttpClient httpCilent = HttpClientBuilder.create().disableRedirectHandling().build();
		
		HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
		
		factory.setHttpClient(httpCilent);
		rest.setRequestFactory(factory);
		
		ResponseEntity<String> restResponse = rest.getForEntity(kakaoAuthUri.toUriString(), String.class);
	
		return "redirect:" + restResponse.getHeaders().getLocation();
	}
	
	@RequestMapping(value = "/login/kakao/auth_code", method = RequestMethod.GET)
	public String kakaoAuthCode(HttpSession SessionStatus
			,String code, String error, String state
			,@RequestParam(name="error_descripition",required = false)String Descripition) {
			String tokenType = null, accessToken =null, refreshToken = null;
			long expiresIn = -1, refreshTokenExpiresIn = -1;
			
			if (error == null) {
				UriComponents kakaoAuthUri = UriComponentsBuilder.newInstance()
						.scheme("https").host("kauth.kakao.com").path("/oauth/token").build();
				
				HttpHeaders headers = new HttpHeaders();
				headers.add("Content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=utf-8");
				
				MultiValueMap<String, String> param = new LinkedMultiValueMap<String, String>();
				param.add("grant_type", "authorization_code");
				param.add("client_id","9e97acd24d70a166f8d300fad1b72ab7" );
				param.add("redirect_uri", "http://localhost/somoim/login/kakao/auth_code");
				param.add("code",code);
				
				HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<MultiValueMap<String,String>>(param,headers);
				
				RestTemplate rest = new RestTemplate();
				rest.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
				
				ResponseEntity<String> restResponse = rest.postForEntity(kakaoAuthUri.toUriString(), entity, String.class);
				
				JSONParser jsonParser = new JSONParser();
				try {
					JSONObject json = (JSONObject)jsonParser.parse(restResponse.getBody());
					
					tokenType = json.get("token_type").toString();
					
					accessToken = json.get("access_token").toString();
					
					expiresIn = Long.valueOf(json.get("expires_in").toString());
					
					refreshToken = json.get("refresh_token").toString();
					
					refreshTokenExpiresIn = Long.valueOf(json.get("refresh_token_expires_in").toString());
					    System.out.println(code);
			            System.out.println("access_token : " + accessToken);
		                System.out.println("refresh_token : " + refreshToken);
				} catch (ParseException e) {
				 e.printStackTrace();
				}
				
			}
			
		return "redirect:/" ;
	}
	
	
}
