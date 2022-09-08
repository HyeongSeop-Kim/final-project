package com.myweb.somoim.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.common.model.PagingDTO;
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
	
	public Map<String,Object> getAll(int page, int pageCount, String search) {
		int num_start =((page-1) * pageCount) + 1;
		int num_end   = (page * pageCount); 
		String search_title = search;
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("num_start", num_start);
		map.put("num_end", num_end);
		map.put("search_title", search_title);
		List<SomoimDTO> datas = dao.selectAll(map);
		int total = dao.selectAllCnt();
		PagingDTO pager = new PagingDTO(total, page, pageCount);
		Map res_data = new HashMap<String, Object>();
		res_data.put("datas", datas);
		res_data.put("page_data", pager);
		return res_data;
	}

	@Override
	public List<SomoimDTO> getDatas(int i) {
		return null;
	}

	@Override
	public List<SomoimDTO> getDatas(String s) {
		return null;
	}

	@Override
	public SomoimDTO getData(String s) {
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
