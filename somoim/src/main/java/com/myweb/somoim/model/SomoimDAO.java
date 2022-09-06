package com.myweb.somoim.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.somoim.common.abstracts.AbstractDAO;

@Repository
public class SomoimDAO extends AbstractDAO<List<SomoimDTO>, SomoimDTO> {

	@Autowired
	private SqlSession session;
	
	private String mapper = "moimsMapper.%s";
	
	@Override
	public List<SomoimDTO> selectAll() {
		return null;
	}

	@Override
	public SomoimDTO selectData(int id) {
		String mapperId = String.format(mapper,"selectData");
		SomoimDTO data = session.selectOne(mapperId,id);
		return data;
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
