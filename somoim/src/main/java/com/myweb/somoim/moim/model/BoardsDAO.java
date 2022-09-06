package com.myweb.somoim.moim.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.somoim.common.abstracts.AbstractDAO;
import com.myweb.somoim.model.SomoimDTO;

@Repository
public class BoardsDAO extends AbstractDAO<List<BoardsDTO>, BoardsDTO> {

	@Autowired
	private SqlSession session ;
	
	private String mapper ="boardsMapper.%s";
	
	
	@Override
	public List<BoardsDTO> selectAll() {
		return null;
	}
	
	
	public List<BoardsDTO> selectBoardAll(int id) {
		String mapperId = String.format(mapper, "selectAll");
		List<BoardsDTO> res = session.selectList(mapperId,id);
		return res;
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
