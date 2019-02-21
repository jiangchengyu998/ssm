package com.ssm.utils;

import com.ssm.entity.TUser;

import javax.servlet.http.HttpServletRequest;

public class UserUtils {
	
	/**
	 * 获取当前系统用户
	 * @param request
	 * @return
	 */
	public static TUser getCurrentUser(HttpServletRequest request){
		TUser user = null;
		Object attribute = request.getSession().getAttribute("login");
		if(attribute!=null && attribute instanceof TUser){
			user = (TUser) attribute;
		}
		return user;
	}
}
