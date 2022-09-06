package com.myweb.somoim.participants.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.moim.model.MeetingsDTO;
import com.myweb.somoim.participants.model.MeetingParticipantsDAO;
import com.myweb.somoim.participants.model.MeetingParticipantsDTO;

@Service
public class MeetingParticipantsService extends AbstractService<List<MeetingsDTO>, MeetingsDTO>{

	@Autowired
	private MeetingParticipantsDAO dao;
	
	
	public List<MeetingParticipantsDTO> getAll(int id) {
		List<MeetingParticipantsDTO> data = dao.selectAll(id);
		System.out.println("미팅참가자서비스:" + data);
		return data;
	}
	
	
	@Override
	public List<MeetingsDTO> getAll() {
		return null;
	}
	
	@Override
	public MeetingsDTO getData(int id) {
		return null;
	}

	@Override
	public MeetingsDTO getData(MeetingsDTO dto) {
		return null;
	}

	@Override
	public boolean addData(MeetingsDTO dto) {
		return false;
	}

	@Override
	public boolean modifyData(MeetingsDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(MeetingsDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(int id) {
		return false;
	}

}
