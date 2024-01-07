
package utils;

import java.math.BigInteger;
import java.security.MessageDigest;

public class Encriptar {

    public String getMD5(String texto) {
        try {
            // Crear una máquina especial que mezcle usando MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            // Mezclar el texto y obtener un conjunto de bytes
            byte[] encriptacionBytes = md.digest(texto.getBytes());
            // Convertir los bytes a un número grande positivo
            BigInteger num = new BigInteger(1, encriptacionBytes);
            // Convertir el número a una cadena en formato hexadecimal
            String encriptacionString = num.toString(16);
            // Asegurar que la cadena resultante tenga siempre 32 caracteres
            while(encriptacionString.length() < 32) {
                encriptacionString = "0" + encriptacionString;
            }
            // Devolver la cadena en formato hexadecimal
            return encriptacionString;
        } catch (Exception ex) {
            // Manejar cualquier error lanzando una excepción
            throw new RuntimeException(ex);
        }
    }
}
