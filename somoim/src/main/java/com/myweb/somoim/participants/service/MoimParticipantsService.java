package com.myweb.somoim.participants.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.participants.model.MoimParticipantsDTO;
import com.myweb.somoim.participants.model.MoimParticipantsDAO;

@Service
public class MoimParticipantsService extends AbstractService<List<MoimParticipantsDTO>, MoimParticipantsDTO> {

	@Autowired
	private MoimParticipantsDAO dao;


	@Override
	public List<MoimParticipantsDTO> getAll() {
		return null;
	}


	public List<MoimParticipantsDTO> getDatas(int id) { //추가한 메서드
		List<MoimParticipantsDTO> data = dao.selectDatas(id);
		return data;
	}

	@Override
	public List<MoimParticipantsDTO> getDatas(String id) {
		List<MoimParticipantsDTO> data = dao.selectJoinMoimData(id);
		return data;
	}

	
	@Override
	public MoimParticipantsDTO getData(int id) {
		return null;
	}

	@Override
	public MoimParticipantsDTO getData(String s) {
		return null;
	}

	@Override
	public MoimParticipantsDTO getData(MoimParticipantsDTO dto) {
		MoimParticipantsDTO data = dao.selectData(dto);
		
		return data;
	}

	@Override
	public boolean addData(MoimParticipantsDTO dto) {
		boolean result = dao.insertData(dto);
		
		return result;
	}

	@Override
	public boolean modifyData(MoimParticipantsDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(MoimParticipantsDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(int id) {
		return false;
	}


	public int  getcurrentMemberCount(int id) {
		
		int  res = dao.currentMemberCount(id);
		
		return res ;
	}

}
