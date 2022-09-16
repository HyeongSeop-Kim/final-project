package com.myweb.somoim.members.service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.members.model.MembersDAO;
import com.myweb.somoim.members.model.MembersDTO;
@Service
public class MembersService extends AbstractService<List<MembersDTO>, MembersDTO>{
	
	@Autowired
	private MembersDAO dao;
	
	
	public MembersDTO getLogin(HttpSession session, MembersDTO membersDTO) {
		MembersDTO data = new MembersDTO();
		
		data.setMemberId(membersDTO.getMemberId());
		data.setPassword(membersDTO.getPassword());
		
		data = dao.selectLogin(data);
		
		if(data == null) {
			return data;
		}else {
			System.out.println(data);
			return data;
		}
	}
	
	@Override
	public List<MembersDTO> getAll() {
		return null;
	}
	
	@Override
	public List<MembersDTO> getDatas(int i) {
		return null;
	}

	@Override
	public List<MembersDTO> getDatas(String s) {
		return null;
	}

	@Override
	public MembersDTO getData(int id) {
		MembersDTO data = dao.selectData(id);
		return data;
	}

	@Override
	public MembersDTO getData(String s) {
		return null;
	}

	public List<String> getBmkData(String memberId)  {
			MembersDTO bookmarkData = dao.selectData(memberId);
		if(bookmarkData != null) {
			List<String> bookmarkList = Arrays.asList(bookmarkData.getBookmark().split(","));
			return bookmarkList;
		}else {
			MembersDTO data = new MembersDTO();
			data.setBookmark("");
			data.setMemberId(memberId);
			boolean result = dao.updateBookmark(data);
			List<String> nullBookmark =Arrays.asList(data.getBookmark());
			return nullBookmark;
		}
	}


	public boolean addBookmark(String memberId) {
		MembersDTO bookmarkData = dao.selectData(memberId);
		 if(bookmarkData != null) {
		    	String[] bookmarkList = bookmarkData.getBookmark().split(",");
		    	if(!Arrays.asList(bookmarkList).contains(memberId)) {
		    		int length = bookmarkList.length;
		    		bookmarkList[length+1] = memberId;
		    		String bookmark = String.join("','",bookmarkList);
		    	  boolean	res = dao.updateBookmark(bookmark);
		    	  return res;
		    	}
	         return false;
		 }
		 return false;
	}



	@Override
	public MembersDTO getData(MembersDTO dto) {
		return null;
	}

	@Override
	public boolean addData(MembersDTO data) {
		
		boolean result = dao.insertData(data);
		
		return result;
	}

	@Override
	public boolean modifyData(MembersDTO dto) {
		return false;
	}

	public boolean modifyCate(MembersDTO dto) {
		boolean res = dao.updateCate(dto);
		return res;
	}
	@Override
	public boolean removeData(MembersDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(int id) {
		return false;
	}


	public MembersDTO selectFindId(MembersDTO data) {
		MembersDTO res = dao.selectFindId(data);
		return res;
	}

	public MembersDTO selectFindPw(MembersDTO data) {
		MembersDTO res = dao.selectFindPw(data);

		return res;
	}


}
