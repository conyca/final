package com.pknu.pro.board.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

@Component
public class FileUploaderHtml5 {
	public void file_uploader_html5(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("file_uploader_html5");
		try {
			String sFileInfo="";
			
			String fileName = request.getHeader("file-name");
			
			String fileName_ext = fileName.substring(fileName.lastIndexOf(".")+1);
			
			fileName_ext = fileName_ext.toLowerCase();
			
			
			
			String[] allow_file = {"jpg", "png", "bmp", "gif"};
			
			int cnt =0;
			for(int i=0; i<allow_file.length; i++){
				if(fileName_ext.equals(allow_file[i])){
					cnt++;
				}
			}
			
			
			
			if(cnt == 0){
				PrintWriter print = response.getWriter();
				print.print("NOTALLOW_"+fileName);
				print.flush();
				print.close();
			}else{ 				
				String dftFilePath = request.getSession().getServletContext().getRealPath("/");
				
				String filePath = dftFilePath + "resources"+ File.separator + "editor" + File.separator + "multiupload" + File.separator;
				
				File file = new File(filePath);
				
				if(!file.exists()){
					file.mkdirs();
				}
				
				String realFileNm ="";
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today = formatter.format(new java.util.Date());
				realFileNm = today +UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
				String rlFileNm = filePath + realFileNm;
				
				InputStream is = request.getInputStream();
				OutputStream os = new FileOutputStream(rlFileNm);
				int numRead;
				byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
				while((numRead = is.read(b,0,b.length)) != -1){
					os.write(b, 0, numRead);
				}
				if(is != null){
					is.close();
				}
				os.flush();
				os.close();
				
				sFileInfo += "&bNewLine=true";
				
				sFileInfo += "&sFileName="+fileName;
				sFileInfo += "&sFileURL=" + "../editor/multiupload/"+realFileNm;
				System.out.println(sFileInfo);
				PrintWriter print = response.getWriter();
				print.println(sFileInfo);
				print.flush();
				print.close();
				
			}
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
