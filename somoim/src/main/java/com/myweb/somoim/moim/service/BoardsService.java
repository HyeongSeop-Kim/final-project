package com.myweb.somoim.moim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.moim.model.BoardsDAO;
import com.myweb.somoim.moim.model.BoardsDTO;


@Service
public class BoardsService extends AbstractService<List<BoardsDTO>, BoardsDTO> {

	@Autowired
	private BoardsDAO dao;

	@Override
	public List<BoardsDTO> getAll() {
		return null;
	}


	public List<BoardsDTO> getDatas(int id) {  //추가메서드
		List<BoardsDTO> datas = dao.selectDatas(id);
		return datas;
	}


	@Override
	public BoardsDTO getData(int id) {
		return null;
	}

	@Override
	public BoardsDTO getData(BoardsDTO dto) {
		return null;
	}

	@Override
	public boolean addData(BoardsDTO dto) {
		return false;
	}

	@Override
	public boolean modifyData(BoardsDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(BoardsDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(int id) {
		return false;
	}

}