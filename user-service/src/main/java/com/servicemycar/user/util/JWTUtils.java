package com.servicemycar.user.util;

import com.servicemycar.user.entity.User;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.experimental.UtilityClass;

import java.util.Date;

@UtilityClass
public class JWTUtils {

    public static final String SECRET = "mysecret-value-1234567890";

    public static final long EXPIRATION_TIME = 2360000; // 30 minutes

//    1727029435-1727027075
    /**
     * Generate token
     * @param user User
     * @return token
     */
    public static String generateToken(User user) {
        return Jwts.builder()
                .setSubject(user.getUsername())
                .claim("role", user.getRole())
                .claim("firstName", user.getFirstName())
                .claim("lastName", user.getLastName())
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
                .signWith(SignatureAlgorithm.HS256, SECRET)
                .compact();
    }

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
}
