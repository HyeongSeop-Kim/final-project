package com.myweb.somoim.participants.model;

import java.util.List;

import com.myweb.somoim.common.abstracts.AbstractDAO;
import com.myweb.somoim.model.SomoimDTO;

public class MoimParticipantsDAO extends AbstractDAO<List<SomoimDTO>, SomoimDTO> {

	@Override
	public List<SomoimDTO> selectAll() {
		return null;
	}

	@Override
	public SomoimDTO selectData(int id) {
		return null;
	}

	@Override
	public SomoimDTO selectData(SomoimDTO dto) {
		return null;
	}

	@Override
	public int getNextSeq() {
		return 0;
	}

	@Override
	public boolean insertData(SomoimDTO dto) {
		return false;
	}

	@Override
	public boolean updateData(SomoimDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(SomoimDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(int id) {
		return false;
	}

}
