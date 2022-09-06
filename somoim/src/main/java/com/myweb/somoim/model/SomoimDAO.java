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
	
	private String mapper = "somoimMapper.%s";
	
	@Override
	public List<SomoimDTO> selectAll() {
		String mapperId = String.format(mapper, "selectAll");
		List<SomoimDTO> datas = session.selectList(mapperId);
		System.out.println(datas);
		return datas;
	}

	@Override
	public SomoimDTO selectData(int id) {
		String mapperId = String.format(mapper, "selectData");
		SomoimDTO datas = session.selectOne(mapperId);
		return datas;
	}

	@Override
	public SomoimDTO selectData(SomoimDTO dto) {
		return null;
	}

	@Override
	public int getNextSeq() {
		String mapperId = String.format(mapper, "getNextSeq");
		int seq = session.selectOne(mapperId);
		return seq;
	}

	@Override
	public boolean insertData(SomoimDTO dto) {
		String mapperId = String.format(mapper, "insertData");
		int res = session.insert(mapperId, dto);
		return res == 1 ? true : false;
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
