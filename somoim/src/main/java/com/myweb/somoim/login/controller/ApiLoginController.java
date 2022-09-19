package com.myweb.somoim.login.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.net.http.HttpRequest;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
public class ApiLoginController {
	
//	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	
	@Autowired
	private LocationsService locSerivce;
	
	@Autowired
	private CategorysService categorysService;
	
	@Autowired
	private MembersService membersService;
	
//	@Autowired
//	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
//		this.naverLoginBO = naverLoginBO;
//	}
	
	
	@RequestMapping(value = "kakaoAddJoin", method = RequestMethod.POST)
	public String kakaoAddJoin(MembersDTO membersDTO
			,HttpServletRequest request
			,HttpSession session
			,Model  model
			,@RequestParam (required = false) String year
			,@RequestParam (required = false) String month
			,@RequestParam (required = false) String day
			,@RequestParam (required = false) String memberName
			,@RequestParam (required = false, defaultValue ="/resources/img/members/basicImg.png" ) String memberImagePath
			,@RequestParam (required = false) String loginType) {
		
		String bitrhs = year+month+day;
		
		String imagePath = request.getContextPath() + memberImagePath;
		
		MembersDTO data = new MembersDTO();

		data.setMemberId(membersDTO.getMemberId());
		data.setMemberName(membersDTO.getMemberName());
		data.setPassword(membersDTO.getPassword());
		data.setGender(membersDTO.getGender());
		data.setBirth(membersDTO.getBirth());
		data.setPhone(membersDTO.getPhone());
		data.setCategory(membersDTO.getCategory());
		data.setLocationId(membersDTO.getLocationId());
		data.setBirth(bitrhs);
		data.setMemberImagePath(imagePath);
		// 카카오 로그인 컨트롤를 통한 회원가입의 loginType --> kakao
		System.out.println(loginType);
		data.setLoginType(loginType);
		
		System.out.println("최종 이미지 패스 경로= " +data.getMemberImagePath());
		
		System.out.println("카카오톡 회원가입 추가 정보 입력=" + data);
		
		boolean result = membersService.addData(data);
		
		if ( session.getAttribute("loginData") != null) {
			//기존의 loginData 란 세션 값이 존재한다면 제거
			session.removeAttribute("loginData");   //기존 값 제거후 로그인
		}
		
		MembersDTO kakaodata = membersService.getLogin(membersDTO);
		
		
		if(data !=null && result ==true) {
			// 로그인 성공
			System.out.println("카카오 로그인 데이터 확인 : " + kakaodata);
			session.setAttribute("loginData", kakaodata);
			return "redirect:/";
		}else {
			return "form/join";
		}
		
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
	
	@RequestMapping(value = "/kakaoIdChk",produces="application/json; charset=utf-8")
	@ResponseBody
	public int kakapIdChk(MembersDTO membersDTO) throws Exception {
		int result = membersService.kakaoIdChk(membersDTO);
		// 아이디 중복 체크 버튼 클릭 시 
		// 아이디 중복 = 1
		// 아이디 중복이 아니면 = 0
		return result;
	}
	
	
	
	
	@RequestMapping(value = "/login/kakao/auth_code", method = RequestMethod.GET)
	public String kakaoAuthCode(HttpSession SessionStatus
			,HttpSession session
			,Model model
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
					    System.out.println("[code] = " + code);
			            System.out.println("[access_token] = " + accessToken);
		                System.out.println("[refresh_token] = " + refreshToken);
		                
		                HashMap<String, Object> userInfo = membersService.getUserInfo(accessToken);
		               
		                System.out.println("-------카카오 로그인-------");
		                System.out.println("##kakaoId## : " + userInfo.get("kakaoId"));
		                System.out.println("##nickname## : " + userInfo.get("nickname"));
		                System.out.println("##birthday## : " + userInfo.get("birthday"));
		                System.out.println("##email## : " + userInfo.get("email"));
		                
		                userInfo.put("loginType", "kakao");
		                List<LocationsDTO> locDatas = locSerivce.getAll();
		        		List<CategorysDTO> categorysDatas = categorysService.getAll();
		        		
		        		model.addAttribute("categorysDatas",categorysDatas);
		        		model.addAttribute("locDatas", locDatas);
		                model.addAttribute("userInfo", userInfo);
		                
		                MembersDTO loginInfoChk = membersService.kakaogetLogin(userInfo);
		                
		                System.out.println("카카로 로그인 시 데이터 베이스에 id + 로그인 타입이 있다면 바로 로그인 실행");
		                System.out.println(loginInfoChk);
		                if (loginInfoChk != null) {
						   session.setAttribute("loginData", loginInfoChk);
						   return "redirect:/";
						}
		                
		                
				} catch (ParseException e) {
				 e.printStackTrace();
				}
			}
		return "apiTest";
	}
	@RequestMapping(value="/login/kakao/kakaoLogout",method = RequestMethod.GET)
	public String kakapLogout(HttpSession session) {
	    membersService.kakaoLogout((String)session.getAttribute("accessToken"));
	    session.removeAttribute("accessToken");
	    return "redirect:/";
	}
	// 네이버 로그인창 호출
//	@RequestMapping(value = "login/naver", method = {RequestMethod.GET, RequestMethod.POST})
//	public String getNaverAuthUrl(HttpSession session
//			,Model model){
//	    String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//	    System.out.println("네이버 로그인 url:" +  naverAuthUrl);
//	    model.addAttribute("urlNaver", naverAuthUrl);
//	    return "login";
//	}
	
}
