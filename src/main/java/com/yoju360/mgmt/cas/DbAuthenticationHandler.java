/**
 * 
 */
package com.yoju360.mgmt.cas;

import javax.validation.constraints.NotNull;

import org.jasig.cas.adaptors.jdbc.AbstractJdbcUsernamePasswordAuthenticationHandler;
import org.jasig.cas.authentication.handler.AuthenticationException;
import org.jasig.cas.authentication.principal.UsernamePasswordCredentials;
import org.springframework.dao.IncorrectResultSizeDataAccessException;

/**
 * @author evan
 *
 */
public class DbAuthenticationHandler extends AbstractJdbcUsernamePasswordAuthenticationHandler {
	@NotNull
    private String sql;

    protected final boolean authenticateUsernamePasswordInternal(final UsernamePasswordCredentials credentials) throws AuthenticationException {
        final String username = getPrincipalNameTransformer().transform(credentials.getUsername());
        final String password = credentials.getPassword();
        final String encryptedPassword = this.getPasswordEncoder().encode(
            username + password);
        
        try {
            final String dbPassword = getJdbcTemplate().queryForObject(this.sql, String.class, username);
            return dbPassword.equals(encryptedPassword);
        } catch (final IncorrectResultSizeDataAccessException e) {
            // this means the username was not found.
            return false;
        }
    }

    /**
     * @param sql The sql to set.
     */
    public void setSql(final String sql) {
        this.sql = sql;
    }
}
