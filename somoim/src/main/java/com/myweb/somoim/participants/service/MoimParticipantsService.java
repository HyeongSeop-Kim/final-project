package com.myweb.somoim.participants.service;

import java.util.List;

import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.participants.model.MoimParticipantsDAO;
import com.myweb.somoim.participants.model.MoimParticipantsDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MoimParticipantsService extends AbstractService<List<MoimParticipantsDTO>, MoimParticipantsDTO> {

	@Autowired
	private MoimParticipantsDAO dao;

	@Override
	public List<MoimParticipantsDTO> getAll() {
		return null;
	}

	@Override
	public List<MoimParticipantsDTO> getDatas(int id) {
		List<MoimParticipantsDTO> datas = dao.selectDatas(id);
		return datas;
	}

	@Override
	public MoimParticipantsDTO getData(int id) {
		return null;
	}

	@Override
	public MoimParticipantsDTO getData(MoimParticipantsDTO dto) {
		return null;
	}

	@Override
	public boolean addData(MoimParticipantsDTO dto) {
		return false;
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

}
