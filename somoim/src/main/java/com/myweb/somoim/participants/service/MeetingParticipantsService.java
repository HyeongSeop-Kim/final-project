package com.myweb.somoim.participants.service;

import java.util.List;

import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.moim.model.MeetingsDTO;

public class MeetingParticipantsService extends AbstractService<List<MeetingsDTO>, MeetingsDTO>{

	@Override
	public List<MeetingsDTO> getAll() {
		return null;
	}
	
	@Override
	public List<MeetingsDTO> getDatas(int i) {
		return null;
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
