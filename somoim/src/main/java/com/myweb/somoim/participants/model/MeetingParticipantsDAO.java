package com.myweb.somoim.participants.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.somoim.common.abstracts.AbstractDAO;

@Repository
public class MeetingParticipantsDAO extends AbstractDAO<List<MeetingParticipantsDTO>, MeetingParticipantsDTO> {

	@Autowired
	private SqlSession session ;

	private String mapper ="meetingParticipantsMapper.%s";


	@Override
	public List<MeetingParticipantsDTO> selectAll() {
		return null;
	}

	@Override
	public List<MeetingParticipantsDTO> selectDatas(String s) {
		return null;
	}

	@Override
	public List<MeetingParticipantsDTO> selectDatas(int id) {
		String mapperId = String.format(mapper, "selectDatas");
		List<MeetingParticipantsDTO> data = session.selectList(mapperId,id);

		return data;
	}


	@Override
	public MeetingParticipantsDTO selectData(int id) {
		return null;
	}

	@Override
	public MeetingParticipantsDTO selectData(String s) {
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
		String mapperId = String.format(mapper, "deleteData");
		int res = session.delete(mapperId, id);

		return res > 0 ? true : false;
	}

}
