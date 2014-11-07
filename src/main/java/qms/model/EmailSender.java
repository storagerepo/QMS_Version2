package qms.model;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.lang.StringUtils;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;
import org.springframework.ui.velocity.VelocityEngineUtils;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@Component("emailSender")
public class EmailSender {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private VelocityEngine velocityEngine;
    
    public static final String TEMPLATE_NAME = "sample_template.vm";


    public void sendEmail(final String toEmailAddresses, final String fromEmailAddress, final String subject) {
        sendEmail(toEmailAddresses, fromEmailAddress, subject, null, null);
    }

    public void sendEmailWithAttachment(final String toEmailAddresses, final String fromEmailAddress,
                                        final String subject, final String attachmentPath,
                                        final String attachmentName) {
        sendEmail(toEmailAddresses, fromEmailAddress, subject, attachmentPath, attachmentName);
    }

    private void sendEmail(final String toEmailAddresses, final String fromEmailAddress,
                           final String subject, final String attachmentPath,
                           final String attachmentName) {
        MimeMessagePreparator preparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true);
                message.setTo(toEmailAddresses);
                message.setFrom(new InternetAddress(fromEmailAddress));
                message.setSubject(subject);
                //Pass values to Template
                Map<String, String> model = new HashMap<String, String>();
                model.put("toName", "Deemsys");
                model.put("fromName", "Suresh");
              //Pass values to Template End
                String body = VelocityEngineUtils.mergeTemplateIntoString(
                        velocityEngine, "templates/" + TEMPLATE_NAME, "UTF-8", model);
                message.setText(body, true);
                if (!StringUtils.isBlank(attachmentPath)) {
                    FileSystemResource file = new FileSystemResource(attachmentPath);
                    message.addAttachment(attachmentName, file);
                }
            }
        };
        this.mailSender.send(preparator);
    }
    
    public void sendRequestForCAPA(final String toEmailAddresses,
			final String fromEmailAddress, final String subject) {
    	System.out.println("in process of sending mail...");
		sendtoGMail(fromEmailAddress, toEmailAddresses, subject);
	}
	 
	   private static void sendtoGMail(String from, String to, String subject) {
	        Properties props = System.getProperties();
	        String host = "server.deemsysinc.com";
	        String pass = "deemsys@#123";
	        props.put("mail.smtp.starttls.enable", "false");
	        props.put("mail.smtp.ssl.trust", host);
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.user", from);
	        props.put("mail.smtp.password", pass);
	        props.put("mail.smtp.port", "25");
	        props.put("mail.smtp.auth", "true");
	       
	        Session session = Session.getDefaultInstance(props);
	        MimeMessage message = new MimeMessage(session);

	        try {
	            message.setFrom(new InternetAddress(from));
	            InternetAddress toAddress = new InternetAddress(to);

	            // To get the array of addresses
	           
	            message.addRecipient(Message.RecipientType.TO, toAddress);
	            message.setSubject("QMS Request for CAPA");
	            message.setText(subject);
	            Transport transport = session.getTransport("smtp");
	            transport.connect(host, from, pass);
	            transport.sendMessage(message, message.getAllRecipients());
	            transport.close();
	            System.out.println("mail send");
	        }
	        catch (AddressException ae) {
	            ae.printStackTrace();
	        }
	        catch (MessagingException me) {
	            me.printStackTrace();
	        }
	    }

}
