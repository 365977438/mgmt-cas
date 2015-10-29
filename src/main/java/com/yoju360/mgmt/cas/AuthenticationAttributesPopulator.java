/**
 * 
 */
package com.yoju360.mgmt.cas;

import org.jasig.cas.authentication.Authentication;
import org.jasig.cas.authentication.AuthenticationMetaDataPopulator;
import org.jasig.cas.authentication.principal.Credentials;

/**
 * Fix bug of CAS 3.6, not populating Authentication attributes. 
 * @see org.jasig.cas.authentication.AbstractAuthenticationManager line 64
 * @see org.jasig.cas.authenticationMutableAuthentication line 49
 * 
 * <p>
 * In casServiceValidationSuccess.jsp
 * <c:if test="${fn:length(assertion.chainedAuthentications[fn:length(assertion.chainedAuthentications)-1].principal.attributes) > 0}">
			<cas:attributes>
				<c:forEach var="attr"
					items="${assertion.chainedAuthentications[fn:length(assertion.chainedAuthentications)-1].principal.attributes}">
					<cas:${fn:escapeXml(attr.key)}>${fn:escapeXml(attr.value)}</cas:${fn:escapeXml(attr.key)}>
				</c:forEach>
			</cas:attributes>
		</c:if>
  change to: 
  
  <c:if test="${fn:length(assertion.chainedAuthentications[fn:length(assertion.chainedAuthentications)-1].attributes) > 0}">
			<cas:attributes>
				<c:forEach var="attr"
					items="${assertion.chainedAuthentications[fn:length(assertion.chainedAuthentications)-1].attributes}">
					<cas:${fn:escapeXml(attr.key)}>${fn:escapeXml(attr.value)}</cas:${fn:escapeXml(attr.key)}>
				</c:forEach>
			</cas:attributes>
		</c:if>
		
 * @author evan
 *
 */
public class AuthenticationAttributesPopulator implements AuthenticationMetaDataPopulator {
	static {
		//TODO do not verify SSL host
		javax.net.ssl.HttpsURLConnection.setDefaultHostnameVerifier(
			    new javax.net.ssl.HostnameVerifier(){
			 
			        public boolean verify(String hostname,
			                javax.net.ssl.SSLSession sslSession) {
			            return true; 
			        }
			    });
	}
	
	/* (non-Javadoc)
	 * @see org.jasig.cas.authentication.AuthenticationMetaDataPopulator#populateAttributes(org.jasig.cas.authentication.Authentication, org.jasig.cas.authentication.principal.Credentials)
	 */
	@Override
	public Authentication populateAttributes(Authentication authentication, Credentials credentials) {
		
		authentication.getAttributes().putAll(authentication.getPrincipal().getAttributes());
		return authentication;
	}

}
