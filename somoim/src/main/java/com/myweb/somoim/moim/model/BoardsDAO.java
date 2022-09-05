package com.myweb.somoim.moim.model;

import java.util.List;

import com.myweb.somoim.common.abstracts.AbstractDAO;
import com.myweb.somoim.model.SomoimDTO;

public class BoardsDAO extends AbstractDAO<List<BoardsDTO>, BoardsDTO> {

	@Override
	public List<BoardsDTO> selectAll() {
		return null;
	}

	@Override
	public List<BoardsDTO> selectDatas(int i) {
		return null;
	}
	
	@Override
	public BoardsDTO selectData(int id) {
		return null;
	}

	@Override
	public BoardsDTO selectData(BoardsDTO dto) {
		return null;
	}

	@Override
	public int getNextSeq() {
		return 0;
	}

	@Override
	public boolean insertData(BoardsDTO dto) {
		return false;
	}

	@Override
	public boolean updateData(BoardsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(BoardsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(int id) {
		return false;
	}
}
