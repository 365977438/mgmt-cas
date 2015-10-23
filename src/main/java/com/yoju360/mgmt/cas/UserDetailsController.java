package com.yoju360.mgmt.cas;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public class UserDetailsController  extends AbstractController {
	
	public UserDetailsController() {
		//TODO do not verify SSL host
		javax.net.ssl.HttpsURLConnection.setDefaultHostnameVerifier(
		    new javax.net.ssl.HostnameVerifier(){
		        public boolean verify(String hostname,
		                javax.net.ssl.SSLSession sslSession) {
		            return true; 
		        }
		});
	}
	
	protected ModelAndView handleRequestInternal(
			final HttpServletRequest request, final HttpServletResponse response)
			        throws Exception {
		response.getWriter().print("user details");
		return null;
	}

}
