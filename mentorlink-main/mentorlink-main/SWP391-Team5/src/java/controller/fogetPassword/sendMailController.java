
package controller.fogetPassword;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.User;

/**
 *
 * @author admin
 */
@WebServlet(name = "sendMailController", urlPatterns = {"/sendMail"})
public class sendMailController extends HttpServlet {

    
    /**
     * 
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException 
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /* "\b": This is a special character in the regular expression representing a word boundary.
        It ensures that the email address is not allowed to contain characters outside of a word*/
        /* "[a-zA-Z0-9._%+-]+": This is a character group allowed in the username part of the email address.
        It includes both uppercase and lowercase letters, digits from 0 to 9, and some special characters 
        such as dot, underscore, hyphen, percent, and plus.*/
        // "@": This is a fixed character representing the at symbol in the email address.
        /* "[a-zA-Z0-9.-]+": This is a character group allowed in the domain part of the email address. 
        It includes both uppercase and lowercase letters, digits from 0 to 9, dot, and hyphen.*/
        /* "\.": This is a fixed character representing a dot in the email address. 
        The backslash is used to escape the special character and treat it as part of the regular expression.*/
        /* "[a-zA-Z]{2,}": This is a character group allowed in the domain extension.
        It includes both uppercase and lowercase letters and must have at least two characters.*/
        String regexEmail = "\\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\\b";
        //Get User forget password from session
        User newUser = (User) req.getAttribute("userForgetPass");
        //Get email of user forget password
        String recipient = newUser.getEmail();
        //Check email matches with regex email
        if (recipient.matches(regexEmail)) {
            
            // Get recipient email address and message from form data
            String verifyCode = getRandomNumberString();
            String message = messageProcess(verifyCode);
            
            //Set session and time exist for verifyCode;
            HttpSession verifyPremium = req.getSession();
            verifyPremium.setAttribute("verifyCode", verifyCode);
            verifyPremium.setMaxInactiveInterval(2 * 60);

            // Set up mail server and authentication
            String host = "smtp.gmail.com";
            String user = "mentorlinkswp391@gmail.com";
            String password = "ogwkxdjdmqepnjxz";

            // Create properties object for the mail session
            Properties prop = new Properties();
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.port", "465");
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.socketFactory.port", "465");
            prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            // Create mail session and authenticate with credentials
            Session session = Session.getInstance(prop, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(user, password);
                }
            });

            try {
                // Create message and set recipient, subject, and message body
                Message msg = new MimeMessage(session);
                msg.setFrom(new InternetAddress(user));
                msg.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
                msg.setSubject("Account Verification");
                msg.setText(message);

                // Send message
                javax.mail.Transport.send(msg);

                // Redirect to success page
                req.getRequestDispatcher("forgetPassword/confirmEmail.jsp").forward(req, resp);
            } catch (MessagingException e) {
                // Redirect to error page
                resp.getWriter().print("We can't send the code to your email");
            }
        }
    }

    /**
     * 
     * @return 
     */
    public static String getRandomNumberString() {
        // It will generate 6 digit random Number.
        // from 0 to 999999
        Random random = new Random();
        int number = random.nextInt(999999);
        // this will convert any number sequence into 6 character.
        return String.format("%06d", number);
    }

    /**
     *
     * @param verifyCode
     * @return
     */
    public static String messageProcess(String verifyCode) {
        String message = "Mentor Link hello you,\n"
                + "This is code define forget password , don't share"
                + " code for anyone, If you don't care"
                + " this action, please skip this email. "
                + "Code : " + verifyCode;

        return message;
    }

}
