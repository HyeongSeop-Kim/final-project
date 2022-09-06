package com.myweb.somoim.moim.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.somoim.common.abstracts.AbstractDAO;

@Repository
public class MeetingsDAO extends AbstractDAO<List<MeetingsDTO>, MeetingsDTO>{

	@Autowired
	private SqlSession session;
	private String mapper = "mettingsMapper.%s";



	@Override
	public List<MeetingsDTO> selectAll() {
		return null;
	}

	public List<MeetingsDTO> selectDatas(int id){ //새로 만든메서드
		String mapperId = String.format(mapper,"selectDatas");
		List<MeetingsDTO> data =  session.selectList(mapperId,id);
		return data;
	}

	@Override
	public MeetingsDTO selectData(int id) {
		return null;
	}

	@Override
	public MeetingsDTO selectData(MeetingsDTO dto) {
		return null;
	}

	@Override
	public int getNextSeq() {
		return 0;
	}

	@Override
	public boolean insertData(MeetingsDTO dto) {
		return false;
	}

	@Override
	public boolean updateData(MeetingsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(MeetingsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(int id) {
		return false;
	}

}
