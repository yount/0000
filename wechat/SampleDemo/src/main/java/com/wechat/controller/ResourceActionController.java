package com.wechat.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.MessagingException;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.fileupload.WebFTPUtil;
import com.liferay.portal.kernel.dao.jdbc.DataAccess;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.util.PortalUtil;
import com.wechat.utils.SendMailUtil;
import com.wechat.utils.Util;

@Controller
@RequestMapping("VIEW")
public class ResourceActionController {
	/**private static final String infoStatu = "infoStatus";
	*private static final String infovalue="infoValue";
	*private static final String result="result";*/
	Logger logger = Logger.getLogger(ResourceActionController.class.getName());
	
	@ResourceMapping(value="changeUserInfoStatus")
	@ResponseBody
	public void setInfoStatus(ResourceRequest request, ResourceResponse response){
	
		PrintWriter pw = null;
		JSONObject json = new JSONObject();
		String[] requestElement={"infoUUID","infoStatus","infoValue"};
		try {
			User user = PortalUtil.getUser(request);
			pw = response.getWriter();
			JSONObject jsonObject = new JSONObject();
			
			String infoUUID = ParamUtil.getString(request, requestElement[0]);
			String infoStatus = ParamUtil.getString(request, requestElement[1]);
			
			Connection conn = DataAccess.getConnection();
			PreparedStatement ps;
			/** 
			 *  0-数据库中还没有数据
			 *  1-数据库中有数据，是注册状态
			 *  2-数据库中有数据，是取消状态
			 */
			if("0".equals(infoStatus)){
				/** 数据库中没有这条信息**/
				String sql = "insert into p_info_user(uuid, userId, infoId, registerTime, status) values(?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				String uuid = Util.getUUID();
				ps.setString(1, uuid);
				ps.setLong(2, user.getUserId());
				ps.setString(3, infoUUID);
				ps.setString(4, Util.getTime());
				ps.setString(5, "1");
				
				ps.execute();
				jsonObject.put(requestElement[1], "1");
				jsonObject.put(requestElement[2], " cancel ");
			} else {
				String status = null;
				if("1".equals(infoStatus)){
					status = "2";
					jsonObject.put(requestElement[1], status);
					jsonObject.put(requestElement[2], "register");
				} else if("2".equals(infoStatus)){
					status = "1";
					jsonObject.put(requestElement[1], status);
					jsonObject.put(requestElement[2], " cancel ");
				}
				String sql = "update p_info_user set status=? where infoId = ? and userId = ? ";
				ps = conn.prepareStatement(sql);
				ps.setString(1, status);
				ps.setString(2, infoUUID);
				ps.setLong(3, user.getUserId());
				ps.executeUpdate();
			} 
			json.put("msg", jsonObject);
			json.put("result", 1);
			pw.println(json.toString());
			
			conn.close();
			pw.close();
			ps.close();
		} catch (Exception e) {
			logger.log(null, "context", e);
		}
	}
	
	
	@ResourceMapping(value="activate")
	@ResponseBody
	public void activate(ResourceRequest request, ResourceResponse response){
		PrintWriter pw = null;
		JSONObject json = new JSONObject();
		
		String empId = ParamUtil.getString(request, "empId");
		String emailAddress = ParamUtil.getString(request, "email").trim();
		String openId = ParamUtil.getString(request, "openId").trim();
		
		JSONObject msgJson = new JSONObject();
		
		try {
			User user = UserLocalServiceUtil.getUserByEmailAddress(20155, emailAddress);
			pw = response.getWriter();
			
			if(user==null){
				json.put("result", "0");
				msgJson.put("error", "Employee ID or EmailAddress error, please contact the administrator");
				
				json.put("msg", msgJson);
				pw.println(json.toString());
				return ;
			}
			
			if(openId==null || "".equals(openId)){
				/** 界面没有传openId，到登录界面**/
				json.put("result", "0");
				msgJson.put("error", "Please go to login page");
				
				json.put("msg", msgJson);
				pw.println(json.toString());
				return ;
			}
			
			if(user.getOpenId()!=null && !"".equals(user.getOpenId())){
				/** 已经绑定过openId，则跳转到登录界面**/
				json.put("result", "0");
				msgJson.put("error", "Please go to login page");
				
				json.put("msg", msgJson);
				pw.println(json.toString());
				return ;
			}
			
			if(user.getScreenName()==null || "".equals(user.getScreenName()) || user.getScreenName().length()<=5){
				json.put("result", "0");
				msgJson.put("error", "Employee ID or EmailAddress error, please contact the administrator");
				
				json.put("msg", msgJson);
				pw.println(json.toString());
				return ;
			}
			
			if(!empId.equalsIgnoreCase(user.getScreenName().substring(5)) || !emailAddress.equalsIgnoreCase(user.getEmailAddress())){
				/** ScreenName中获取到的数据不为空，且数据格式为"empIdxxxxxx"**/
				/** empId，emailAddress和数据库中的不一致，返回激活界面**/
				json.put("result", "0");
				msgJson.put("error", "Please check your mailbox or employee ID");
				
				json.put("msg", msgJson);
				pw.println(json.toString());
				return ;
			}
			
			user.setOpenId(openId);
			UserLocalServiceUtil.updateUser(user);
			
			json.put("result", "1");
			msgJson.put("email", user.getEmailAddress());
			msgJson.put("password", user.getPassword());
			
			json.put("msg", msgJson);
			pw.println(json.toString());
			return ;
		} catch (Exception e) {
			
		} finally{
			if(pw!=null){
				pw.flush();
				pw.close();
			}
		}
		
	}
	
	@ResourceMapping(value="ResetPassword")
	@ResponseBody
	public void ResetPassword(ResourceRequest request, ResourceResponse response){
		PrintWriter pw = null;
		JSONObject json = new JSONObject();
		JSONObject msgJson = new JSONObject();
		String password = ParamUtil.getString(request,"password");
		//使用API更新密码
		try{
			User user = PortalUtil.getUser(request);
			long userId=user.getUserId();
			UserLocalServiceUtil.updatePassword(userId,password,password,false);
			pw = response.getWriter();
			
			msgJson.put("success", "Reset password successfully");
			json.put("result", "1");
			json.put("msg", msgJson);
			pw.println(json.toString());
		}catch(Exception e){
			logger.log(null, "context", e);
		}finally{
			if(pw!=null){
				pw.flush();
				pw.close();
			}
		}	
	}
	
	
	@ResourceMapping(value="sendMail")
	@ResponseBody
	public void sendMail(ResourceRequest request, ResourceResponse response) throws PortalException, SystemException, IOException, MessagingException{
		PrintWriter pw = null;
		JSONObject json = new JSONObject();
		JSONObject msgJson=new JSONObject();
		String content=ParamUtil.getString(request,"content");
		User user = PortalUtil.getUser(request);
		pw = response.getWriter();
		
		String toEmailAddress="wjx_cjhlTQL@163.com";
		String subject="userId("+user.getUserId()+")/"+user.getFirstName()+"."+user.getLastName()+" need help!";

		try{
			SendMailUtil.sendEmail(toEmailAddress,subject,content);
		}catch(UnsupportedEncodingException e){
			msgJson.put("error", "failed to send email");
			json.put("result", "0");
			json.put("msg", msgJson);
			pw.println(json.toString());
			return ;
		}
		msgJson.put("success", "succeed in sending email to admin!");
		json.put("result", "1");
		json.put("msg", msgJson);
		pw.println(json.toString());
		return ;
		
	}
	
	
	@ResourceMapping(value="addinfo")
	@ResponseBody
	public void addinfo(ResourceRequest request, ResourceResponse response) throws PortalException, SystemException, SQLException, ParseException, IOException{
		PrintWriter pw = null;
		JSONObject json = new JSONObject();
		User user = PortalUtil.getUser(request);
		pw = response.getWriter();
		String title = ParamUtil.getString(request, "title");
		String location = ParamUtil.getString(request, "location").trim();
		String start_time = ParamUtil.getString(request, "startTime").trim();
		System.out.println(start_time);
		Date testDate = new Date(start_time);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String startTime=format.format(testDate);
	
		String end_time = ParamUtil.getString(request, "endTime");
		Date te = new Date(end_time);
		SimpleDateFormat forma= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String endTime=forma.format(te);
		
		String targetedaudience = ParamUtil.getString(request, "targetedaudience").trim();
		String description = ParamUtil.getString(request, "description").trim();
		String mainimage= ParamUtil.getString(request, "mainimage").trim();
		String image= ParamUtil.getString(request, "image").trim();
		String video= ParamUtil.getString(request, "video").trim();
		
		String uuid = Util.getUUID();
		
		Connection conn = DataAccess.getConnection();
		PreparedStatement ps;
		String sql = "insert into p_info(uuid, createId, startTime, endTime, title,content,target_audience,event_location,status,mainImageUrl,imageUrl,mediaUrl) values(?,?,?,?,?,?,?,?,?,?,?,?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1, uuid);
		ps.setLong(2, user.getUserId());
		ps.setString(3,startTime);
		ps.setString(4, endTime);
		ps.setString(5, title);
		ps.setString(6, description);
		ps.setString(7, targetedaudience);
		ps.setString(8, location);
		ps.setString(9, "0");
		ps.setString(10, mainimage);
		ps.setString(11, image);
		ps.setString(12, video);
		ps.execute();
		conn.close();
		ps.close();
		json.put("result", 1);
		pw.println(json.toString());
		pw.close();
		
	}
	
	
//	private static String hostname = "121.43.175.85";
//	private static int port = 21;
//	private static String username = "root";
//	private static String password = "123cjhlTQL";
	private static String hostname = "121.43.175.85";
	private static int port = 21;
//	private static String username = "perficient";
//	private static String password = "perficient";
	private static String username = "root";
	private static String password = "123cjhlTQL";
	@ResourceMapping(value="uploadImage")
	@ResponseBody
	public void uploadImage(ResourceRequest req, ResourceResponse resp) throws Exception{
		HttpServletRequest request = PortalUtil.getHttpServletRequest(req);
		HttpServletResponse response = PortalUtil.getHttpServletResponse(resp);
		response.setContentType("text/html");     
        response.setCharacterEncoding("UTF-8");
//        String realDir = request.getSession().getServletContext().getRealPath("");  
//        String contextpath = request.getContextPath();  
//        String basePath = request.getScheme() + "://"  
//        + request.getServerName() + ":" + request.getServerPort()  
//        + contextpath + "/";  
//        String basePath = contextpath + "/";
        
        
        JSONObject json = new JSONObject();
        
        try {
	        String filePath="images";  
//	        String realPath = realDir+File.separator+filePath;  
	        //判断路径是否存在，不存在则创建  
//	        File dir = new File(realPath);  
//	        if(!dir.isDirectory())  
//	            dir.mkdir();  
	  
	        if(ServletFileUpload.isMultipartContent(request)){  
	  
	            DiskFileItemFactory dff = new DiskFileItemFactory();
//	            dff.setRepository(dir);  
//	            dff.setSizeThreshold(1024000);  
	            ServletFileUpload sfu = new ServletFileUpload(dff);  
	            FileItemIterator fii = null;  
	            fii = sfu.getItemIterator(request);  
	            String title = "";   //图片标题
	            String url = "";    //图片地址
	            String fileName = "";
	            String state="SUCCESS";  
	            String realFileName="";  
	            while(fii.hasNext()){
	                FileItemStream fis = fii.next();  
	                try{
	                    if(!fis.isFormField() && fis.getName().length()>0){
	                        fileName = fis.getName();
	                        if(fileName.endsWith(".mp4")){
	                        	filePath = "videos";
	                        }
	                        Pattern reg=Pattern.compile("[.]jpg|png|jpeg|gif|mp4$");  
	                        Matcher matcher=reg.matcher(fileName);  
	                        if(!matcher.find()) {
	                            state = "文件类型不允许！";
	                            json.put("msg", "文件类型不允许！");
	                            json.put("status", "0");
	                            break;  
	                        }
//	                        realFileName = new Date().getTime()+fileName.substring(fileName.lastIndexOf("."),fileName.length());  
//	                        url = realPath+File.separator+realFileName;
	                        fileName = new Date().getTime()+fileName.substring(fileName.lastIndexOf("."),fileName.length());
	                        String path_ftp = filePath+"/"+fileName;
	                        WebFTPUtil.uploadFile(hostname, port, username, password, 
	                        		WebFTPUtil.getFTPPath(path_ftp), WebFTPUtil.getFileName(fileName), fis.openStream());
//	                        BufferedInputStream in = new BufferedInputStream(fis.openStream());//获得文件输入流  
//	                        FileOutputStream a = new FileOutputStream(new File(url));  
//	                        BufferedOutputStream output = new BufferedOutputStream(a);  
//	                        Streams.copy(in, output, true);//开始把文件写到你指定的上传文件夹
	                        // json.put("src", basePath+filePath+"/"+realFileName);
	                        json.put("src", "/"+path_ftp);
	                        json.put("status", "1");
	                    }else{
	                        String fname = fis.getFieldName();  
	  
	                        if(fname.indexOf("pictitle")!=-1){
	                            BufferedInputStream in = new BufferedInputStream(fis.openStream());  
	                            byte c [] = new byte[10];  
	                            int n = 0;  
	                            while((n=in.read(c))!=-1){
	                                title = new String(c,0,n);  
	                                break;  
	                            }
	                        }  
	                    }  
	  
	                }catch(Exception e){
	                	logger.log(null, "context", e); 
	                }  
	            }  
//	            response.getWriter().println(json.toString());
	            resp.getWriter().println(json.toString());
	        }  
        }catch(Exception ee) {
        	logger.log(null, "context", ee);
        }
	}
	
	@ResourceMapping(value="showImage")
	@ResponseBody
	public void showImage(ResourceRequest request, ResourceResponse response) throws Exception{
		String imgFile = ParamUtil.getString(request, "imgFile"); //文件名  路径
        String path= getValue(imgFile);//这里是存放图片的文件夹地址
        int index = path.lastIndexOf("/");
        String pathname = path.substring(0, index);
        String filename = path.substring(index+1, path.length());
        response.setContentType("image/*"); 
        OutputStream outStream=PortalUtil.getHttpServletResponse(response).getOutputStream();
        WebFTPUtil.downloadFile(hostname, port, username, password, pathname, filename, outStream);
        outStream.close();
	}
	
	@ResourceMapping(value="loadVideo")
	@ResponseBody
	public void loadVideo(ResourceRequest request, ResourceResponse response) throws Exception{
		String imgFile = ParamUtil.getString(request, "imgFile"); //文件名  路径
        String path= getValue(imgFile);//这里是存放图片的文件夹地址
        int index = path.lastIndexOf("/");
        String pathname = path.substring(0, index);
        String filename = path.substring(index+1, path.length());
        response.setContentType("video/*"); 
        OutputStream outStream=PortalUtil.getHttpServletResponse(response).getOutputStream();
        WebFTPUtil.downloadFile(hostname, port, username, password, pathname, filename, outStream);
        outStream.close();
        
	}
	
	@ResourceMapping(value="delImage")
	@ResponseBody
	public boolean delImage(ResourceRequest request, ResourceResponse response) throws Exception{
		String imgFile = ParamUtil.getString(request, "imgFile"); //文件名  路径
		String path= getValue(imgFile);//这里是存放图片的文件夹地址
		int index = path.lastIndexOf("/");
        String pathname = path.substring(0, index);
        String filename = path.substring(index+1, path.length());
		boolean flag=WebFTPUtil.deleteFile(hostname, port, username, password, pathname, filename);
		return flag;
	}
	
	public String getValue(String filename){
		if(filename.startsWith("/")){
			return filename;
		} else {
			return "/"+filename;
		}
	}
	
	@ResourceMapping(value="showinfo")
	@ResponseBody
	public void publish(ResourceRequest request, ResourceResponse response) throws PortalException, SystemException, SQLException, IOException {
		PrintWriter pw = null;
		JSONObject json = new JSONObject();
		User user = PortalUtil.getUser(request);
		pw = response.getWriter();
		Connection conn = DataAccess.getConnection();
		PreparedStatement ps;
		String sql = "update p_info set status='1' where createId=?";
		ps = conn.prepareStatement(sql);
		ps.setLong(1, user.getUserId());
		ps.execute();
		conn.close();
		ps.close();
		
		json.put("result", "0");
		pw.println(json.toString());
	}
	
	
}