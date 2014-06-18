package ezo.mp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezo.mp.dao.UserMapper;
import ezo.mp.domain.Job;
import ezo.mp.domain.Users;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public List<Job> getJobCode() {
		List<Job> list = userMapper.getJobCode();
		return list;
	}

	@Override
	public void insertUser(Users users) {
		userMapper.insertUser(users);
	}

	public Users loginUser(Users users) {

		System.out.println(users.getUserid() + "/" + users.getPassword());
		/*
		 * List list= userMapper.loginUser(users); System.out.println(list);
		 */
		/*
		 * Users users2= userMapper.loginUser(users);
		 */
		System.out.println("Å×½ºÆ®: "+userMapper.loginUser(users));

		return userMapper.loginUser(users);
	}

	public String loginUser(String userid, String password) {

		/*
		 * List list= userMapper.loginUser(users); System.out.println(list);
		 */
		/*
		 * Users users2= userMapper.loginUser(users);
		 */
		System.out
				.println(userMapper.loginUser(userid.trim(), password.trim()));

		return null;
	}

}
