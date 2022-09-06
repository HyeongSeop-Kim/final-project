package com.myweb.somoim.categorys.model;

import java.util.List;

import com.myweb.somoim.common.abstracts.AbstractDAO;

public class CategorysDAO extends AbstractDAO<List<CategorysDTO>, CategorysDTO> {

	@Override
	public List<CategorysDTO> selectAll() {
		return null;
	}
	
	@Override
	public List<CategorysDTO> selectDatas(int i) {
		return null;
	}

	@Override
	public CategorysDTO selectData(int id) {
		return null;
	}

	@Override
	public CategorysDTO selectData(CategorysDTO dto) {
		return null;
	}

	@Override
	public int getNextSeq() {
		return 0;
	}

	@Override
	public boolean insertData(CategorysDTO dto) {
		return false;
	}

	@Override
	public boolean updateData(CategorysDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(CategorysDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(int id) {
		return false;
	}
}
