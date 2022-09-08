package com.myweb.somoim.common.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.myweb.somoim.model.SomoimDAO;
import com.myweb.somoim.model.SomoimDTO;


@Service
public class FileUploadService {
	
	@Autowired
	private SomoimDAO dao;

	@Transactional
	public int modifyMoimImage(SomoimDTO data){

		
		boolean result = dao.modifyImage(data);
		return 1;


}

	
	
}
