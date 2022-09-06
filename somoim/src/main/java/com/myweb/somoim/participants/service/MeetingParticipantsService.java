package com.myweb.somoim.participants.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.participants.model.MeetingParticipantsDAO;
import com.myweb.somoim.participants.model.MeetingParticipantsDTO;

@Service
public class MeetingParticipantsService extends AbstractService<List<MeetingParticipantsDTO>, MeetingParticipantsDTO>{

	@Autowired
	private MeetingParticipantsDAO dao;

	@Override
	public List<MeetingParticipantsDTO> getDatas(int id) {
		List<MeetingParticipantsDTO> data = dao.selectDatas(id);
		return data;
	}


	@Override
	public List<MeetingParticipantsDTO> getAll() {
		return null;
	}

	@Override
	public List<MeetingParticipantsDTO> getDatas(String s) {
		return null;
	}

	@Override
	public MeetingParticipantsDTO getData(int id) {
		return null;
	}

	@Override
	public MeetingParticipantsDTO getData(String s) {
		return null;
	}

	@Override
	public MeetingParticipantsDTO getData(MeetingParticipantsDTO dto) {
		return null;
	}

	@Override
	public boolean addData(MeetingParticipantsDTO dto) {
		return false;
	}

	@Override
	public boolean modifyData(MeetingParticipantsDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(MeetingParticipantsDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(int id) {
		return false;
	}

}
