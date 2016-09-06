package com.wechat.utils;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
  
public class SendMailUtil {
	 private SendMailUtil() {
		 
	 }
  
    static int port = 25;

    static String server = "smtp.163.com";//邮件服务器mail.cpip.net.cn
  
    static String from = "Perficient WeChat Help";//发送者,显示的发件人名字
  
    static String user = "wjx_cjhlTQL@163.com";//发送者邮箱地址
  
    static String password = "SendEmail123";//密码
  
     
    public static void sendEmail(String email, String subject, String body) throws UnsupportedEncodingException, MessagingException {
        
        Properties props = new Properties();
        props.put("mail.smtp.host", server);
        props.put("mail.smtp.port", String.valueOf(port));
        props.put("mail.smtp.auth", "true");
        Transport transport = null;
        Session session = Session.getDefaultInstance(props, null);
        transport = session.getTransport("smtp");
        transport.connect(server, user, password);
        MimeMessage msg = new MimeMessage(session);
        msg.setSentDate(new Date());
        InternetAddress fromAddress = new InternetAddress(user,from,"UTF-8");
        msg.setFrom(fromAddress);
        InternetAddress[] toAddress = new InternetAddress[1];
        toAddress[0] = new InternetAddress(email);
        msg.setRecipients(Message.RecipientType.TO, toAddress);
        msg.setSubject(subject, "UTF-8");  
        msg.setText(body, "UTF-8");
        msg.saveChanges();
        transport.sendMessage(msg, msg.getAllRecipients());
    }
//    public static void main(String args[]) throws UnsupportedEncodingException
//    {
//  
//        sendEmail("15757126461@163.com","Need Help For Perficient Wechat Project","Hello,admin, I need some help!");//收件人
////        sendEmail("2363761370@qq.com","Need Help For Perficient Wechat Project","Hello,admin, I need some help!");//收件人

//    }
}
