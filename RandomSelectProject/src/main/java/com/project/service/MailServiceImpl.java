package com.project.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("mailService")
public class MailServiceImpl implements MailService {

	private static final long serialVersionUID = 1L;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private MessageSource messageSource;

	@Override
	public void sendMail(String fromUser, String toUser, String subject,
			String text) {

		MimeMessage message = mailSender.createMimeMessage();

		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(fromUser);
			messageHelper.setTo(toUser);
			messageHelper.setSubject(subject);
			messageHelper.setText(text, true);

			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
