package com.tayal.utility;


import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import org.apache.commons.codec.binary.Base64;

public class AESencrp 
{
   
    private static final Charset UTF_8 = StandardCharsets.UTF_8;
    
    public static String encrypt(String value) throws Exception
    {
        byte[] encodedBytes = Base64.encodeBase64(value.getBytes(UTF_8));
        String encryptedValue64 = new String(encodedBytes, UTF_8);
        System.out.println("Encrypted : " + encryptedValue64);
        return encryptedValue64;
               
    }
    
    public static String decrypt(String value) throws Exception
    {   
        byte[] decodedBytes = Base64.decodeBase64(value.getBytes(UTF_8));
        String decryptedValue64 = new String(decodedBytes, UTF_8);
        System.out.println("Decrypted : " + decryptedValue64);
        
        return decryptedValue64;
    }
    
  
}