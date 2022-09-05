package com.myweb.somoim.participants.model;

import java.util.List;

import com.myweb.somoim.common.abstracts.AbstractDAO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MeetingParticipantsDAO extends AbstractDAO<List<MeetingParticipantsDTO>, MeetingParticipantsDTO> {

	@Autowired
	private SqlSession session;
	private String mapper = "ParticipantsMapper.%s";

	@Override
	public List<MeetingParticipantsDTO> selectAll() {
		return null;
	}
	
	@Override
	public List<MeetingParticipantsDTO> selectDatas(int id) {
		String mapperId = String.format(mapper, "selectMeetingDatas");
		List<MeetingParticipantsDTO> datas = session.selectList(mapperId, id);
		return datas;
	}

	@Override
	public MeetingParticipantsDTO selectData(int id) {
		return null;
	}

	@Override
	public MeetingParticipantsDTO selectData(MeetingParticipantsDTO dto) {
		return null;
	}

	@Override
	public int getNextSeq() {
		return 0;
	}

	@Override
	public boolean insertData(MeetingParticipantsDTO dto) {
		return false;
	}

	@Override
	public boolean updateData(MeetingParticipantsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(MeetingParticipantsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(int id) {
		return false;
	}
}
