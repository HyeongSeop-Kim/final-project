package com.myweb.somoim.members.service;

import java.util.List;

import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.members.model.MembersDTO;

public class MembersService extends AbstractService<List<MembersDTO>, MembersDTO>{

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
	public boolean addData(MembersDTO dto) {
		return false;
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
