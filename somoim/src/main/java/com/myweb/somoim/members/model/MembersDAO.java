package com.myweb.somoim.members.model;

import java.util.List;

import com.myweb.somoim.common.abstracts.AbstractDAO;

public class MembersDAO extends AbstractDAO<List<MembersDTO>, MembersDTO> {

	@Override
	public List<MembersDTO> selectAll() {
		return null;
	}

	@Override
	public MembersDTO selectData(int id) {
		return null;
	}

	@Override
	public MembersDTO selectData(MembersDTO dto) {
		return null;
	}

	@Override
	public int getNextSeq() {
		return 0;
	}

	@Override
	public boolean insertData(MembersDTO dto) {
		return false;
	}

	@Override
	public boolean updateData(MembersDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(MembersDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(int id) {
		return false;
	}

}
