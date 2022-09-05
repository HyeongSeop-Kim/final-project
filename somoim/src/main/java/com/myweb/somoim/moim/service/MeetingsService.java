package com.myweb.somoim.moim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.moim.model.MeetingsDAO;
import com.myweb.somoim.moim.model.MeetingsDTO;

@Service
public class MeetingsService extends AbstractService<List<MeetingsDTO>, MeetingsDTO>{

	@Autowired
	MeetingsDAO dao;
	
	@Override
	public List<MeetingsDTO> getAll() {
		return null;
	}
	
	@Override
	public List<MeetingsDTO> getDatas(int id) {
		List<MeetingsDTO>datas = dao.selectDatas(id);
		return datas;
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
