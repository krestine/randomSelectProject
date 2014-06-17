package ezo.mp.service;

import java.util.List;

import ezo.mp.domain.Job;
import ezo.mp.domain.Users;

public interface UserService {
	List<Job> getJobCode();

	void insertUser(Users users);

	Users  loginUser(Users users);

	String loginUser(String userid, String password);
}
