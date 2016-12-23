package com.pknu.pro.board.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;


import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	
	private static final Logger LOGGER = 
		      LoggerFactory.getLogger(UploadFileUtils.class);
	
	public static String uploadFile(String saveDir, String originalName, byte[] fileData)
			throws Exception{
		
		UUID uid = UUID.randomUUID();
		String storedFname = uid.toString() + "_" + originalName;
		String storedPath = calcPath(saveDir);
		File target = new File(saveDir+storedPath,storedFname);
		FileCopyUtils.copy(fileData, target);
		String formatName =
				originalName.substring(originalName.lastIndexOf(".")+1);
		String uploadFileName = null;
		
		if(MediaUtils.getMediaType(formatName)!=null){
			uploadFileName = makeThumbnail(saveDir, storedPath, storedFname);
		}else{
			uploadFileName = makeIcon(saveDir, storedPath, storedFname);
		}
		return uploadFileName;
	}
	
	private static String calcPath(String uploadPath){    
		   Calendar cal = Calendar.getInstance();    
		   String yearPath = File.separator+cal.get(Calendar.YEAR);    
		   String monthPath = yearPath + File.separator + 
		       new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);

		   String datePath = monthPath + File.separator + 
		       new DecimalFormat("00").format(cal.get(Calendar.DATE));
		    
		   makeDir(uploadPath, yearPath,monthPath,datePath);    
		   LOGGER.info(datePath);
		    
		   return datePath;
		}
	
	private static String makeThumbnail(String saveDir, 
			String savePath, String storedFname) throws Exception{
		
		BufferedImage sourceImg = 
				ImageIO.read(new File(saveDir+savePath, storedFname));
		BufferedImage destImg =null;
		
		int imgWidth = sourceImg.getWidth();
		int imgHeight = sourceImg.getHeight();
		if(imgWidth>imgHeight){
			imgWidth = 90;
			imgHeight = (int)(imgWidth*sourceImg.getHeight())/sourceImg.getWidth();
		}else{
			imgHeight = 90;
			imgWidth = (int)(imgHeight*sourceImg.getWidth())/sourceImg.getHeight();
		}
		
		destImg = Scalr.resize(sourceImg, imgWidth,imgHeight, null);
			
		
		String thumbnailName = 
				saveDir + savePath + File.separator +"s_"+ storedFname;   
		File newFile = new File(thumbnailName);
		String formatName = 
				storedFname.substring(storedFname.lastIndexOf(".")+1);  
   
	   ImageIO.write(destImg, formatName.toUpperCase(), newFile);	   
	   return thumbnailName.substring(
			   saveDir.length()).replace(File.separatorChar, '/');
	   
	}
	
	private static  String makeIcon(String saveDir, 
		    String storedPath,String storedFname) throws Exception{	
			    String iconName = saveDir + storedPath + 
			    				File.separator+ storedFname;    
			    return iconName.substring(
			    		saveDir.length()).replace(File.separatorChar, '/');
		    }  
			 
	private static void makeDir(String uploadPath, String... paths){    
	   if(new File(paths[paths.length-1]).exists()){
	     return;
	   }
	    
	   for (String path : paths) {      
	     File dirPath = new File(uploadPath + path);      
	     if(! dirPath.exists() ){
	       dirPath.mkdir();
	     } 
	   }
	}
	
}
