package ezo.mp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ezo.mp.domain.Job;
import ezo.mp.domain.Users;

public interface UserMapper {
	List<Job> getJobCode();

	void insertUser(Users users);

	Users loginUser(Users users);

	String loginUser(@Param("userid") String userid,
			@Param("password") String password);
	// List<Users> loginUser(Users users);

}
