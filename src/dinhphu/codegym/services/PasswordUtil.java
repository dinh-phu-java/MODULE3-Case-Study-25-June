package dinhphu.codegym.services;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordUtil {
    public static String hashPassword(String password){
        StringBuilder sb=null;
        try {

            MessageDigest md =MessageDigest.getInstance("SHA-256");
            md.update(password.getBytes());
            byte[] mdArray= md.digest();
            sb= new StringBuilder(mdArray.length*2);

            for (byte b: mdArray){
                int v= b & 0xff;
                if (v < 16){
                    sb.append('0');
                }
                sb.append(Integer.toHexString(v));
            }

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return sb.toString();
    }

}
