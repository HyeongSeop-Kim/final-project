package com.myweb.somoim.participants.model;

import java.util.List;

import com.myweb.somoim.common.abstracts.AbstractDAO;
import com.myweb.somoim.model.SomoimDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MoimParticipantsDAO extends AbstractDAO<List<MoimParticipantsDTO>, MoimParticipantsDTO> {

	@Autowired
	private SqlSession session;
	private String mapper = "ParticipantsMapper.%s";

	@Override
	public List<MoimParticipantsDTO> selectAll() {
		return null;
	}
	
	@Override
	public List<MoimParticipantsDTO> selectDatas(int id) {
		String mapperId = String.format(mapper, "selectMoimDatas");
		List<MoimParticipantsDTO> datas = session.selectList(mapperId, id);
		return datas;
	}

	@Override
	public MoimParticipantsDTO selectData(int id) {
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
