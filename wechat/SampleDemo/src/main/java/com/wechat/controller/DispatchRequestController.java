package com.wechat.controller;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.ActionMapping;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.util.PortalUtil;

/*
 * This class Dispatches the request to the demanded controller.
 * PLEASE DO NOT WRITE CODES HERE!!!
 */

@Controller("dispatchRequestController")
@RequestMapping("VIEW")
public class DispatchRequestController {

	@ActionMapping("dispatchRequest")
	public void dispatchRequest(ActionRequest request, ActionResponse response)
			throws PortalException, SystemException {
		
		PortalUtil.copyRequestParameters(request, response);
		

	}

}
