package com.pknu.pro.board.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

@Named
public class FileSaveHelper {	
//	@Autowired
	@Resource(name="saveDir")
	String saveDir;
	
	public String save(MultipartFile fname){		
		String storedFname=UUID.randomUUID().toString()+"_"+fname.getOriginalFilename();
		try{
			fname.transferTo(new File(saveDir+storedFname));
		}catch(Exception e){}		
	    return storedFname;
	}
}
