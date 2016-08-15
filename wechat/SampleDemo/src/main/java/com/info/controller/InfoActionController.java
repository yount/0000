package com.info.controller;

import java.io.IOException;
import java.util.Random;

import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;

@Controller
@RequestMapping("VIEW")
public class InfoActionController {
	
	@ResourceMapping(value="addInfoURL")
	@ResponseBody
	public void setDat(ResourceRequest request, ResourceResponse response){
		System.out.println("9999999999");
		try {
			
//			User user = UserLocalServiceUtil.getUserById(20199);
//			System.out.println(user.getEmailAddress()+" "+user.getUserId()+" "+user.getOpenId()+" "+user.getPassword()+" "+user.getPasswordUnencrypted());
//			System.out.println(user.getPasswordModified()+" "+user.getPasswordReset());
//			System.out.println();
////			UserLocalServiceUtil.updatePasswordReset(user.getUserId(), false);
////			UserLocalServiceUtil.updatePassword(user.getUserId(), "123456", "123456",false);
//			user.setOpenId(""+new Random().nextInt(20));
//			// user.setPassword("123456");
//// 			user.setPasswordUnencrypted("654321");
//			UserLocalServiceUtil.updateUser(user);
//			response.getWriter().println("{'a':'a'}");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
