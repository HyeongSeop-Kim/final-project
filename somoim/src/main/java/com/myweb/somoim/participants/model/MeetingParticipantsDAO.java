package com.myweb.somoim.participants.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.somoim.common.abstracts.AbstractDAO;
import com.myweb.somoim.moim.model.MeetingsDTO;

@Repository
public class MeetingParticipantsDAO extends AbstractDAO<List<MeetingsDTO>, MeetingsDTO> {

	@Autowired
	private SqlSession session ;

	private String mapper ="meetingParticipantsMapper.%s";


	@Override
	public List<MeetingsDTO> selectAll() {
		return null;
	}

	@Override
	public List<MeetingParticipantsDTO> selectDatas(int id) {
		String mapperId = String.format(mapper, "selectDatas");
		List<MeetingParticipantsDTO> data = session.selectList(mapperId,id);
		System.out.println("미팅참가자DAO:" + data);
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