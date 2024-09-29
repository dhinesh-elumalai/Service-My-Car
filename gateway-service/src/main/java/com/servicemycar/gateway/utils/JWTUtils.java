package com.servicemycar.gateway.utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;

public class JWTUtils {

    public static final String SECRET = "mysecret-value-1234567890";

    /**
     * Extract claims
     * @param token token
     * @return claims
     */
    public static Claims extractClaims(String token) {
        return Jwts.parser()
                .setSigningKey(SECRET)
                .parseClaimsJws(token)
                .getBody();
    }

    /**
     * Extract username
     * @param token token
     * @return username
     */
    public static String extractUsername(String token) {
        return extractClaims(token).getSubject();
    }

    /**
     * Extract user role
     * @param token token
     * @return user role
     */
    public static Object extractUserRole(String token) {
        return extractClaims(token).get("role");
    }

    // write a method to check if the token is valid
    public static boolean isValidToken(String token) {
        try {
            extractClaims(token);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
