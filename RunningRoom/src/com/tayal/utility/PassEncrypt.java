package com.tayal.utility;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;



public class PassEncrypt {
    
    public static String encrypt(String password) {
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            byte[] result = md5.digest(password.getBytes());

            // Change it to HEX format.
            final char lookup[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                                   'a', 'b', 'c', 'd', 'e', 'f'};
            StringBuffer buf = new StringBuffer("");
            int i, c, j;
            for(i = 0; i < result.length; i++) {
                //     logger.info(bytes[i]+" "+(bytes[i] & 0xFF));
                c = result[i] & 0xFF;
                j = c >> 4;
                buf.append((char) lookup[j]);
                j = (c & 0xF);
                buf.append((char) lookup[j]);
            }
            return new String(buf);
        } catch(NoSuchAlgorithmException e) {
            return password;
        }
    }
}