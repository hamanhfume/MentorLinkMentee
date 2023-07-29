/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.CreateRequest;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author LENOVO
 */
public class Mail {

    final String username = "mentorlinkswp391@gmail.com";
    final String password = "ogwkxdjdmqepnjxz";

    public void send(String toEmail, String messageText) throws ParseException {

        // Thiết lập thuộc tính
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");

        // Truyền các thuộc tính đã tạo vào Session và chứng thực xem mail có
        // đăng nhập vào được không
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Tạo tin nhắn truyền đi
            MimeMessage message = new MimeMessage(session);

            // Địa chỉ mail người nhận
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(toEmail)
            );

            // Đặt tiêu đề của email (nếu cần)
            message.setSubject("Subject of Email");

            // Đặt nội dung của email với mã hóa UTF-8
            message.setText(messageText, "UTF-8");

            // Gửi tin nhắn đi
            Transport.send(message);
            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

//    public static void main(String[] args) {
//        SendEmail sd = new SendEmail();
//        sd.sendCode("buivantruong16082002@gmail.com", "123123");
//    }
}
