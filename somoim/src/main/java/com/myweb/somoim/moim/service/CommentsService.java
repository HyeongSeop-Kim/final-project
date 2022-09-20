package com.myweb.somoim.moim.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.somoim.members.model.MembersDTO;
import com.myweb.somoim.moim.model.BoardsDTO;
import com.myweb.somoim.moim.model.CommentsDAO;
import com.myweb.somoim.moim.model.CommentsDTO;

@Service
public class CommentsService {
	
	@Autowired
	private CommentsDAO dao;
	
	
	public List<CommentsDTO> getDatas(Map map) {  //추가메서드
		List<CommentsDTO> datas = dao.selectDatas(map);
		return datas;
	}

	public List<CommentsDTO> getDatas(String id) {  //추가메서드
		List<CommentsDTO> datas = dao.selectDatas(id);
		return datas;
	}


	public boolean addData(CommentsDTO commentsDto) {
		boolean res = dao.insert(commentsDto);
		return res;
	}


	public boolean removeData(int id) {
		System.out.println("코멘트삭제2");
		boolean res = dao.delete(id);
		return res;
		
	}


}
