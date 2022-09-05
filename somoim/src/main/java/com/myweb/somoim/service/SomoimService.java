package com.myweb.somoim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.model.SomoimDAO;
import com.myweb.somoim.model.SomoimDTO;

@Service
public class SomoimService extends AbstractService<List<SomoimDTO>, SomoimDTO>{

	@Autowired
	SomoimDAO dao;
	
	@Override
	public List<SomoimDTO> getAll() {
		return null;
	}
	
	@Override
	public List<SomoimDTO> getDatas(int id) {
		return null;
	}

	@Override
	public SomoimDTO getData(int id) {
		SomoimDTO data = dao.selectData(id);
		return data;
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
