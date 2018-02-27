package com.durin93.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.durin93.domain.LoginInfo;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	private SqlSession session;

	@Override
	public boolean loginCheck(LoginInfo loginInfo) {
		int count = Integer.parseInt(session.selectOne("loginCheck", loginInfo).toString()),
		totalCount = session.selectOne("totalAccount");
		
		if(totalCount> 0) {
			if(count > 0) {
				return true;
			}else {
				return false;
			}
		}
		return false;
	};

}
