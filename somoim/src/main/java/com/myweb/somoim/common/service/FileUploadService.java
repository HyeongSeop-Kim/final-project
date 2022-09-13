package com.myweb.somoim.common.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.somoim.common.model.FilesDAO;
import com.myweb.somoim.model.SomoimDAO;
import com.myweb.somoim.model.SomoimDTO;


@Service
public class FileUploadService {
	
	@Autowired
	private FilesDAO dao;

	
	public boolean modifyMoimImage(SomoimDTO data){
        boolean result = dao.modifyImage(data);
		return result;


}

	
	
}
