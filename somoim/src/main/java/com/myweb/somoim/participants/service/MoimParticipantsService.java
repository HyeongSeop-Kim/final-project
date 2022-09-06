package com.myweb.somoim.participants.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.model.SomoimDTO;
import com.myweb.somoim.participants.model.MoimParticipantsDTO;
import com.myweb.somoim.participants.model.MoimParticipantsDAO;

@Service
public class MoimParticipantsService extends AbstractService<List<SomoimDTO>, SomoimDTO> {

	@Autowired
	private MoimParticipantsDAO dao;
	
	
	@Override
	public List<SomoimDTO> getAll() {
		return null;
	}
	

	public List<MoimParticipantsDTO> getParticipantAll(int id) { //추가한 메서드
		List<MoimParticipantsDTO> data = dao.selectParticipantsAll(id);
		return data;
	}
	

	@Override
	public SomoimDTO getData(int id) {
		return null;
	}

	@Override
	public SomoimDTO getData(SomoimDTO dto) {
		return null;
	}

	@Override
	public boolean addData(SomoimDTO dto) {
		return false;
	}

	@Override
	public boolean modifyData(SomoimDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(SomoimDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(int id) {
		return false;
	}

}
