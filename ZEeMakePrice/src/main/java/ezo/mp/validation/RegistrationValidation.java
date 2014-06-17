package ezo.mp.validation;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import ezo.mp.domain.Users;

@Component("registrationValidator")
public class RegistrationValidation {
	public boolean supports(Class<?> klass) {
		return Users.class.isAssignableFrom(klass);
	}

	public void validate(Object target, Errors errors) {
		Users users = (Users) target;
		
		if (!(users.getPassword()).equals(users.getPassconfirm())) {
			errors.rejectValue("passconfirm",
			"matchingresult.users.passconfirm",
			"> 패스워드가 일치하지 않습니다.");
		}
	}
}
