package com.fileupload;

import static org.junit.Assert.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.junit.Test;

public class WebFTPUtilTest {
	private static String hostname = "121.43.175.85";
	private static int port = 21;
	private static String username = "perficient";
	private static String password = "perficient";
	
	private File file = new File("test.txt");
	
	@Test
	public void testUploadFile() throws Exception{
		file.createNewFile();
		FileOutputStream fos = new FileOutputStream(file);
		fos.write("1234567890".getBytes());
		fos.close();
		InputStream in = new FileInputStream(file);
		String path = "/images/test.txt";
		boolean b = WebFTPUtil.uploadFile(hostname, port, username, password, WebFTPUtil.getFTPPath(path), WebFTPUtil.getFileName(path), in);
		file.delete();
		assertTrue(b);
	}
	
	@Test
	public void testDownloadFile(){
		OutputStream os = null;
		try {
			os = new FileOutputStream(file);
			String path = "/images/img_001.jpg";
			boolean b = WebFTPUtil.downloadFile(hostname, port, username, password, WebFTPUtil.getFTPPath(path), WebFTPUtil.getFileName(path), os);
			assertTrue(b);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			file.delete();
			if(os!=null){
				try {
					os.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@Test
	public void testDeleteFile(){
		String path = "images/test.txt";
		boolean b = WebFTPUtil.deleteFile(hostname, port, username, password, WebFTPUtil.getFTPPath(path), WebFTPUtil.getFileName(path));
		file.delete();
		assertTrue(b);
	}
	@Test
	public void testIsLocal(){
		boolean real1=WebFTPUtil.isLocal("121.43.175.85");
		boolean real2=WebFTPUtil.isLocal("127.0.0.1");
//		System.out.println(real1+"sss"+real2);
		assertTrue(!real1);
		assertTrue(real2);
	}
	
	
}
