package com.myweb.somoim.common.abstracts;

import org.apache.ibatis.session.SqlSession;

public abstract class AbstractDAO<C, E> {
	protected SqlSession session;
	
	public abstract C selectAll();
	
	public abstract E selectData(int i);
	
	public abstract E selectData(E e);
	
	public abstract int getNextSeq();
	
	public abstract boolean insertData(E e);
	
	public abstract boolean updateData(E e);
	
	public abstract boolean deleteData(E e);
	
	public abstract boolean deleteData(int i);
}
