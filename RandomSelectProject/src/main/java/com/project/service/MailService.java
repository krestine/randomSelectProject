package com.project.service;

import java.io.Serializable;

public interface MailService extends Serializable {

	void sendMail(String fromUser, String toUser, String subject, String text);

}
