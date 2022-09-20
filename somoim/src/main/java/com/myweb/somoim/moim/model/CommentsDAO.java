package com.myweb.somoim.moim.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.somoim.members.model.MembersDTO;

@Repository
public class CommentsDAO {
	
	@Autowired
	private SqlSession session ;
	private String mapper ="commentsMapper.%s";
	
	
	
	public List<CommentsDTO> selectDatas(Map map) {
		String mapperId = String.format(mapper, "selectDatas");
		List<CommentsDTO> datas = session.selectList(mapperId,map);
		return datas;
		
	}
	public List<CommentsDTO> selectDatas(String id) {
		String mapperId = String.format(mapper, "selectWriteDatas");
		List<CommentsDTO> datas = session.selectList(mapperId, id);
		return datas;
	}


    public boolean insert(CommentsDTO commentsDto) {
    	String mapperId = String.format(mapper, "insertData");
		int res = session.insert(mapperId,commentsDto);
		return res == 1 ? true : false;
	}


	public boolean delete(int id) {
		String mapperId = String.format(mapper, "deleteData");
		System.out.println("코멘트삭제3");
		int res = session.delete(mapperId,id);
		System.out.println("코멘트삭제결과 DAO ="+ res);
		return res == 1 ? true : false;
		
	}

}
