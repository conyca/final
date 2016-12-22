package com.pknu.pro.util;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUpload {
	
	public void commonFileUpload(List<MultipartFile> mfile,int articleNum){
//		FileDto fileDto= null;
//	
//		for(MultipartFile uploadFile:mfile){			
//			if(!uploadFile.isEmpty()) {
//				String storedFname=fileSaveHelper.save(uploadFile);	
//				
//				fileDto = new FileDto();					
//				fileDto.setOrginalFname(uploadFile.getOriginalFilename());
//				fileDto.setStoredFname(storedFname);
//				fileDto.setFileLength(uploadFile.getSize()); 	
//				fileDto.setArticleNum(articleNum); 	
//	
//				bbsDao.insertFile(fileDto);				
//			}	
//		}
	}
	
}
