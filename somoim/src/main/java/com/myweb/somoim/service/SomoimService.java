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
	private SomoimDAO dao;
	
	@Override
	public List<SomoimDTO> getAll() {
		List<SomoimDTO> datas = dao.selectAll();
		return datas;
	}

	@Override
	public SomoimDTO getData(int id) {
		SomoimDTO datas = dao.selectData(id);
		return datas;
	}

	@Override
	public SomoimDTO getData(SomoimDTO dto) {
		return null;
	}

	@Override
	public boolean addData(SomoimDTO dto) {
		int seq = dao.getNextSeq();
		dto.setMoimId(seq);
		
		boolean result = dao.insertData(dto);
		return result;
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
