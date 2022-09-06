package com.myweb.somoim.participants.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.somoim.common.abstracts.AbstractDAO;

@Repository
public class MoimParticipantsDAO extends AbstractDAO<List<MoimParticipantsDTO>, MoimParticipantsDTO> {

	@Autowired
	private SqlSession session;
	private String mapper = "moimParticipantsMapper.%s";

	@Override
	public List<MoimParticipantsDTO> selectAll() {
		return null;
	}

	@Override
	public List<MoimParticipantsDTO> selectDatas(String i) {
		return null;
	}

	@Override
	public List<MoimParticipantsDTO> selectDatas(int id) {
		String mapperId = String.format(mapper, "selectDatas");
		List<MoimParticipantsDTO> data = session.selectList(mapperId,id);
		return data;
	}


	@Override
	public MoimParticipantsDTO selectData(int id) {
		return null;
	}

	@Override
	public MoimParticipantsDTO selectData(String s) {
		return null;
	}

	@Override
	public MoimParticipantsDTO selectData(MoimParticipantsDTO dto) {
		return null;
	}

	@Override
	public int getNextSeq() {
		return 0;
	}

	@Override
	public boolean insertData(MoimParticipantsDTO dto) {
		return false;
	}

	@Override
	public boolean updateData(MoimParticipantsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(MoimParticipantsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(int id) {
		return false;
	}

}
