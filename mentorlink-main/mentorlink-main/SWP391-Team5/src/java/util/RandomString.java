/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.util.Random;

/**
 *
 * @author LENOVO
 */
public class RandomString {
    public String getString(int length){
        String charPool = "0123456789";
        
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        
        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(charPool.length());
            char randomChar = charPool.charAt(randomIndex);
            sb.append(randomChar);
        }
        return sb.toString();
    }
}
