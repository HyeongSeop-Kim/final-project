package com.myweb.somoim.members.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.members.model.MembersDAO;
import com.myweb.somoim.members.model.MembersDTO;
@Service
public class MembersService extends AbstractService<List<MembersDTO>, MembersDTO>{
	
	@Autowired
	private MembersDAO dao;
	
	@Override
	public List<MembersDTO> getAll() {
		return null;
	}

	@Override
	public MembersDTO getData(int id) {
		return null;
	}

	@Override
	public MembersDTO getData(MembersDTO dto) {
		return null;
	}

	@Override
	public boolean addData(MembersDTO data) {
		int seq = dao.getNextSeq();
		data.setMemberId(seq);
		boolean result = dao.insertData(data);
		
		return result;
	}

	@Override
	public boolean modifyData(MembersDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(MembersDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(int id) {
		return false;
	}

}
