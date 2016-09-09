package com.fileupload;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;



public class WebFTPUtil {
	static Logger logger = Logger.getLogger(WebFTPUtil.class.getName());
	
	/**
	 * 上传文件（可供Action/Controller层使用）
	 * 
	 * @param hostname
	 *            FTP服务器地址
	 * @param port
	 *            FTP服务器端口号
	 * @param username
	 *            FTP登录帐号
	 * @param password
	 *            FTP登录密码
	 * @param pathname
	 *            FTP服务器保存目录
	 * @param fileName
	 *            上传到FTP服务器后的文件名称
	 * @param inputStream
	 *            输入文件流
	 * @return
	 */
	public static boolean uploadFile(String hostname, int port,
			String username, String password, String pathname, String fileName,
			InputStream inputStream) {
		
		boolean flag = false;
		FTPClient ftpClient = new FTPClient();
		ftpClient.setControlEncoding("UTF-8");
		try {
			// 连接FTP服务器
			ftpClient.connect(hostname, port);
			// 登录FTP服务器
			ftpClient.login(username, password);
			// 是否成功登录FTP服务器
			int replyCode = ftpClient.getReplyCode();
			if (!FTPReply.isPositiveCompletion(replyCode)) {
				return flag;
			}
			ftpClient.enterLocalPassiveMode();
			//////////////////////////
			// ftpClient.enterLocalPassiveMode();
			///////////////////////////
			ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
			ftpClient.setFileTransferMode(FTPClient.BINARY_FILE_TYPE);
			ftpClient.makeDirectory(pathname);
			ftpClient.changeWorkingDirectory(pathname);
			ftpClient.storeFile(fileName, inputStream);
			inputStream.close();
			ftpClient.logout();
			flag = true;
		} catch (Exception e) {
			
		} finally {
			if (ftpClient.isConnected()) {
				try {
					ftpClient.disconnect();
				} catch (IOException e) {
					logger.log(Level.INFO, "context", e);
				}
			}
		}
		return flag;
	}
	
	/**
	 * 下载文件
	 * 
	 * @param hostname
	 *            FTP服务器地址
	 * @param port
	 *            FTP服务器端口号
	 * @param username
	 *            FTP登录帐号
	 * @param password
	 *            FTP登录密码
	 * @param pathname
	 *            FTP服务器文件目录
	 * @param filename
	 *            文件名称
	 * @param localpath
	 *            下载后的文件路径
	 * @return
	 */
	public static boolean downloadFile(String hostname, int port,
			String username, String password, String pathname, String filename,
			OutputStream localOutput) {
		
		boolean flag = false;
		FTPClient ftpClient = new FTPClient();
		ftpClient.setControlEncoding("UTF-8");
		try {
			// 连接FTP服务器
			ftpClient.connect(hostname, port);
			// 登录FTP服务器
			ftpClient.login(username, password);
			// 验证FTP服务器是否登录成功
			int replyCode = ftpClient.getReplyCode();
			if (!FTPReply.isPositiveCompletion(replyCode)) {
				return flag;
			}
			ftpClient.enterLocalPassiveMode();
			//////////////////////////////////
			// ftpClient.enterLocalPassiveMode();
			/////////////////////////////////
			// 切换FTP目录
			ftpClient.changeWorkingDirectory(pathname);
			FTPFile[] ftpFiles = ftpClient.listFiles();
			for (FTPFile file : ftpFiles) {
				if (filename.equalsIgnoreCase(file.getName())) {
					ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
					ftpClient.setFileTransferMode(FTPClient.BINARY_FILE_TYPE);
					ftpClient.retrieveFile(file.getName(), localOutput);
					break;
				}
			}
			ftpClient.logout();
			flag = true;
		} catch (Exception e) {
			
		} finally {
			if (ftpClient.isConnected()) {
				try {
					ftpClient.logout();
				} catch (IOException e) {
					
				}
			}
		}
		return flag;
	}

	
	/**
	 * 删除文件
	 * 
	 * @param hostname
	 *            FTP服务器地址
	 * @param port
	 *            FTP服务器端口号
	 * @param username
	 *            FTP登录帐号
	 * @param password
	 *            FTP登录密码
	 * @param pathname
	 *            FTP服务器保存目录
	 * @param filename
	 *            要删除的文件名称
	 * @return
	 */
	public static boolean deleteFile(String hostname, int port,
			String username, String password, String pathname, String filename) {
		boolean flag = false;
		FTPClient ftpClient = new FTPClient();
		try {
			// 连接FTP服务器
			ftpClient.connect(hostname, port);
			// 登录FTP服务器
			ftpClient.login(username, password);
			// 验证FTP服务器是否登录成功
			int replyCode = ftpClient.getReplyCode();
			if (!FTPReply.isPositiveCompletion(replyCode)) {
				return flag;
			}
			ftpClient.enterLocalPassiveMode();
			///////////////////////////////////////
			// ftpClient.enterLocalPassiveMode();
			///////////////////////////////////////
			// 切换FTP目录
			ftpClient.changeWorkingDirectory(pathname);
			ftpClient.dele(filename);
			ftpClient.logout();
			flag = true;
		} catch (Exception e) {
			
		} finally {
			if (ftpClient.isConnected()) {
				try {
					ftpClient.logout();
				} catch (IOException e) {
					
				}
			}
		}
		return flag;
	}
	
	
	
	// public final static String FTP_HOME = "/files";
	public final static String FTP_HOME = "";
	// path : /images/img_001.jpg  -> 返回 : /files/images
	public static String getFTPPath(String path){
		if(path.startsWith(File.separator)){
			return FTP_HOME+path.substring(0, path.lastIndexOf(File.separator));
		} else {
			return FTP_HOME+File.separator+path.substring(0, path.lastIndexOf(File.separator));
		}
	}
	// path : /images/img_001.jpg  -> 返回 : img_001.jpg
	public static String getFileName(String path){
		return path.substring(path.lastIndexOf(File.separator)+1, path.length());
	}
	
	public static boolean isLocal(String IP){
		Enumeration<NetworkInterface> netInterfaces = null;  
    	try {  
    	    netInterfaces = NetworkInterface.getNetworkInterfaces();  
    	    while (netInterfaces.hasMoreElements()) {  
    	        NetworkInterface ni = netInterfaces.nextElement();  
    	        Enumeration<InetAddress> ips = ni.getInetAddresses();  
    	        while (ips.hasMoreElements()) {  
    	        	if(ips.nextElement().getHostAddress().equalsIgnoreCase(IP)){
    	        		return true;
    	        	}
    	        }  
    	        
    	    }  
    	} catch (Exception e) {  
    		
    	}
    	return false;
	}
	
	public static void main(String[] args) throws FileNotFoundException{
//		String hostname = "121.43.175.85";
//		int port = 21;
//		String username = "root";
//		String password = "123cjhlTQL";
//		File f = new File("1471587004520.png");
//		OutputStream os = new FileOutputStream(f);
//		downloadFile(hostname, port, username, password, "/images", "1471587004520.png", os);
		
	}
	
}
