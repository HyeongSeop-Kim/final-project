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
	
	@Override
	public List<BoardsDTO> selectDatas(int id) {
		String mapperId = String.format(mapper, "selectDatas");
		List<BoardsDTO> res = session.selectList(mapperId,id);
		return res;
	}

	@Override
	public List<BoardsDTO> selectDatas(String s) {
		return null;
	}
	
	@Override
	public BoardsDTO selectData(int id) {
		return null;
	}

	@Override
	public BoardsDTO selectData(String s) {
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
