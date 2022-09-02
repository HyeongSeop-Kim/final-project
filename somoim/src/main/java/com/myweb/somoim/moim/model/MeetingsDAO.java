package com.myweb.somoim.moim.model;

import java.util.List;

import com.myweb.somoim.common.abstracts.AbstractDAO;

public class MeetingsDAO extends AbstractDAO<List<MeetingsDTO>, MeetingsDTO>{

	@Override
	public List<MeetingsDTO> selectAll() {
		return null;
	}

	@Override
	public MeetingsDTO selectData(int id) {
		return null;
	}

	@Override
	public MeetingsDTO selectData(MeetingsDTO dto) {
		return null;
	}

	@Override
	public int getNextSeq() {
		return 0;
	}

	@Override
	public boolean insertData(MeetingsDTO dto) {
		return false;
	}

	@Override
	public boolean updateData(MeetingsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(MeetingsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(int id) {
		return false;
	}

}
