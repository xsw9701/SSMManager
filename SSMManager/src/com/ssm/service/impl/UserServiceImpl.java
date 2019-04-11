package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.ssm.mapper.UserMapper;
import com.ssm.pojo.User;
import com.ssm.service.UserService;
import com.ssm.util.Pagination;
import com.ssm.util.Util;

import net.sf.json.JSONObject;

public class UserServiceImpl implements UserService {
	@Autowired
	@Qualifier("userMapper")
	private UserMapper userMapper;
	public void insert(User info) {
		userMapper.insert(info);
	}
	public User login(User user) {
		return userMapper.login(user);
	}
	public String list(Pagination pagination) {
		List<User> users=userMapper.list(pagination);
		pagination.setCount(userMapper.count(pagination));
		Util<User> util=new Util<User>();
		return util.SplitPage(users, pagination.getCount());
	}
	public void delete(User user) {
		userMapper.delete(user);
		
	}
	public String findById(String id) {
		User user=userMapper.findById(id);
		JSONObject jsonObject=JSONObject.fromObject(user);
		return jsonObject.toString();
	}
	public void update(User user) {
		userMapper.update(user);
	}
	
}
