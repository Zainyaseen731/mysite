package EmailSender;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
import javax.mail.Authenticator;

public class Main
{

    public Main(String  d_email,String d_password,String d_port,String d_host,String m_to,String m_subject,String m_text)
    {
        Properties props = new Properties();
        props.put("mail.smtp.user", d_email);
        props.put("mail.smtp.host", d_host);
        props.put("mail.smtp.port", d_port);
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.debug", "true");
        props.put("mail.smtp.socketFactory.port", d_port);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");

        SecurityManager security = System.getSecurityManager();

        try
        {
            Session session = Session.getDefaultInstance(props,  
            new javax.mail.Authenticator() {  
            protected PasswordAuthentication getPasswordAuthentication() {  
            return new PasswordAuthentication(d_email, d_password);  
            }  
            });
            session.setDebug(true);
            MimeMessage msg = new MimeMessage(session);
            msg.setText(m_text);
            msg.setSubject(m_subject);
            msg.setFrom(new InternetAddress(d_email));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(m_to));
            Transport.send(msg);
            System.out.println("Email sent Succsesfully...!");
        }
        catch (Exception mex)
        {
            mex.printStackTrace();
        } 

   
}
}

