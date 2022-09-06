package com.myweb.somoim.members.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.somoim.common.abstracts.AbstractDAO;
@Repository
public class MembersDAO extends AbstractDAO<List<MembersDTO>, MembersDTO> {

	@Autowired
	private SqlSession session;
	
	private String mapper = "memberMapper.%s";
	
	@Override
	public List<MembersDTO> selectAll() {
		return null;
	}
	
	@Override
	public List<MembersDTO> selectDatas(int i) {
		return null;
	}

	@Override
	public MembersDTO selectData(int id) {
		return null;
	}

	@Override
	public MembersDTO selectData(MembersDTO dto) {
		return null;
	}

	@Override
	public int getNextSeq() {
		String mapperId = String.format(mapper, "getNextSeq");
		int seq = session.selectOne(mapperId);
		return seq;
	}

	@Override
	public boolean insertData(MembersDTO data) {
		String mapId = String.format(mapper, "insertData");
		int res = session.insert(mapId, data);
		return res == 1 ? true : false;
	}

	@Override
	public boolean updateData(MembersDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(MembersDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(int id) {
		return false;
	}
}
