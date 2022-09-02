package com.myweb.somoim.common.model;

import java.util.List;

import com.myweb.somoim.common.abstracts.AbstractDAO;

public class LocationsDAO extends AbstractDAO<List<LocationsDTO>, LocationsDTO> {

	@Override
	public List<LocationsDTO> selectAll() {
		return null;
	}

	@Override
	public LocationsDTO selectData(int id) {
		return null;
	}

	@Override
	public LocationsDTO selectData(LocationsDTO dto) {
		return null;
	}

	@Override
	public int getNextSeq() {
		return 0;
	}

	@Override
	public boolean insertData(LocationsDTO dto) {
		return false;
	}

	@Override
	public boolean updateData(LocationsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(LocationsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(int id) {
		return false;
	}
	
}
