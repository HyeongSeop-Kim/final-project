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
	private String mapper = "MeetingsMapper.%s";
	
	@Override
	public List<MeetingsDTO> selectAll() {
		return null;
	}
	
	@Override
	public List<MeetingsDTO> selectDatas(int id) {
		String mapperId = String.format(mapper, "selectDatas");
		List<MeetingsDTO> datas = session.selectList(mapperId, id);
		return datas;
	}
	
	@Override
	public MeetingsDTO selectData(int i) {
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
