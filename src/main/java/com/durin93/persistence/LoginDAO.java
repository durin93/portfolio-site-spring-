package com.durin93.persistence;

import com.durin93.domain.LoginInfo;

public interface LoginDAO {
	public boolean loginCheck (LoginInfo loginInfo);
}
