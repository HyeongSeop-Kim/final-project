package com.myweb.somoim.moim.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.model.SomoimDTO;
import com.myweb.somoim.moim.model.MeetingsDAO;
import com.myweb.somoim.moim.model.MeetingsDTO;

@Service
public class MeetingsService extends AbstractService<List<MeetingsDTO>, MeetingsDTO>{

	@Autowired
	private MeetingsDAO dao;



	@Override
	public List<MeetingsDTO> getAll() {
		return null;
	}

	@Override
	public List<MeetingsDTO> getDatas(int id){ //새로 만든 메서드
		List<MeetingsDTO> data = dao.selectDatas(id);
	    return data;
	}

	@Override
	public List<MeetingsDTO> getDatas(String s) {
		return null;
	}

	@Override
	public MeetingsDTO getData(int id) {
		return null;
	}

	@Override
	public MeetingsDTO getData(String s) {
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
		boolean result = dao.deleteData(id);
		return result;
	}
	

}
