package com.pknu.pro.board.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pknu.pro.board.dao.GalleryDao;
import com.pknu.pro.board.dto.BoardDto;
import com.pknu.pro.board.dto.FileDto;
import com.pknu.pro.board.dto.UpdateDto;
import com.pknu.pro.board.util.MediaUtils;
import com.pknu.pro.board.util.UploadFileUtils;
import com.pknu.pro.util.Page;

@Service
public class GalleryServiceImpl implements GalleryService {

	@Autowired
	GalleryDao galleryDao;
	@Autowired
	Page page;
	
	BoardDto boardDto;
	List<BoardDto> boardList;
	List<FileDto> fileList;
	
	@Resource(name="saveDir")
	String saveDir;
	
	@Override
	public String list(String pageNum, HttpServletRequest request, Model model) {
		
		if(pageNum==null||pageNum.equals("")){
			pageNum="1";
		}
		int totalCount=0;		
		int pageSize=10;
	    int pageBlock=10;
	    totalCount = galleryDao.getBoardCount(2);
	    page.paging(Integer.parseInt(pageNum),totalCount,pageSize, pageBlock,"list.do");
	    Map<String, Object> hm = new HashMap<>();
	    hm.put("startRow", page.getStartRow());
	    hm.put("endRow", page.getEndRow());
	    hm.put("kind", 2);
	    boardList=galleryDao.getBoards(hm);
	    model.addAttribute("list", boardList);
		model.addAttribute("pageCode", page.getSb().toString());
		model.addAttribute("pageNum", pageNum);
	    
		return "community/gallery/list";
	}

	@Override
	public String writeForm(Model model, String pageNum) {
		model.addAttribute("pageNum", pageNum);
		return "community/gallery/write";
	}

	@Override
	public String write(HttpSession session, Model model, String pageNum, BoardDto boardDto, MultipartHttpServletRequest mRequest , String ir1) {
		int boardNum=0;
		System.out.println("write");
		boardDto.setKind(2);
		boardDto.setWriter((String)session.getAttribute("id"));
		char c = '"';
		ir1 = ir1.replace("<img src="+c+"../", "<img src="+c+"/final/resources/");
		boardDto.setContent(ir1);
		int maxNo =0;
		if(galleryDao.getBoardMaxNo(boardDto.getKind()) == null ){
			maxNo=1;
		}else{
			maxNo = galleryDao.getBoardMaxNo(boardDto.getKind())+1;
		}
		boardDto.setBoardNo(maxNo);
		System.out.println(saveDir);
		
		
		// 파일 처리
		List<String> fileList = new ArrayList<String>();
		List<MultipartFile> mFile = mRequest.getFiles("fname");
		System.out.println("좀 : " + mFile.size());
		try{
			for(MultipartFile file : mFile){
				System.out.println("file.getOriginalFilename() : " + file.getOriginalFilename());
				fileList.add(UploadFileUtils.uploadFile(saveDir, file.getOriginalFilename(), file.getBytes()));
			}
			boardDto.setFileNames(fileList);
		}catch (Exception e) {
			e.printStackTrace();
			// 메시지 작업
		}
		
		// 글 등록
		if(mFile.get(0).isEmpty()){
			System.out.println("isEmpty true");
			//파일 업로드 없음
			galleryDao.write(boardDto);
			Map<String, Integer> hm2 = new HashMap<>();
			hm2.put("kind", 2);
			hm2.put("boardNo", maxNo);
			boardNum = galleryDao.getCurrentBoardNum(hm2);
		}else{	
			System.out.println("isEmpty false");
			//파일 업로드 있음
			boardNum = galleryDao.getNextBoardNum();
			System.out.println(boardNum+"글등록");
			boardDto.setBoardNum(boardNum);
			boardDto.setFileStatus(1);
			galleryDao.write(boardDto);
			commonFileUpload(boardDto.getFileNames(), boardNum);
			//현제 DB에 섬네일이 올라가게 되있음
			//content시 a.replaceFirst("s_", "") 해줄것!
		}
//		return "redirect:content.do?pageNum="+pageNum+"&boardNum="+boardNum;
		 return "redirect:list.do?pageNum="+pageNum;
	}
	
	public void commonFileUpload(List<String> fileList,int boardNum){
		FileDto fileDto= null;
		for(String file:fileList){	
		
		fileDto = new FileDto();					
		fileDto.setStoredFname(file);
		 
		fileDto.setFilelength(new File(saveDir+file).length()); 	
		fileDto.setBoardNum(boardNum); 	
		galleryDao.insertFile(fileDto);				
		
		}
	}

	@Override
	public ResponseEntity<byte[]> displayFile(String fileName) {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(saveDir + fileName);
			
			if(mType!=null){
				headers.setContentType(mType);
			}else{
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//				String fileName2 = URLEncoder.encode(fileName,"utf-8").replace("+", "%20").replace("%28", "(").replace("%29",")");
				String fileName2 = URLEncoder.encode(fileName,"utf-8").replace("+", "%20");
				System.out.println(fileName2);
				headers.add("Content-Disposition", "attachment; fileName=\""+ fileName2+"\"");
			}
			entity = new ResponseEntity<byte[]>( 
						IOUtils.toByteArray(in),
						headers,
						HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			
			try {
				if(in != null)in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		System.out.println(entity);
		return entity;
	}

	@Override
	public String content(Model model, String pageNum, String boardNum) {
		
		Map<String, Integer> hm = new HashMap<>();
		hm.put("kind", 2);
		hm.put("boardNum", Integer.parseInt(boardNum));
		boardDto = galleryDao.getBoard(hm);
		fileList = galleryDao.getFileList(Integer.parseInt(boardNum));
		for(FileDto fd : fileList){
			fd.setStoredFname(fd.getStoredFname().replaceFirst("s_", ""));
			System.out.println(fd.getStoredFname());
		}
		model.addAttribute("board", boardDto);
		model.addAttribute("file", fileList);
		model.addAttribute("pageNum", pageNum);
		
		return "community/gallery/content";
	}

	@Override
	public String delete(Model model, String pageNum, String boardNum) {
		galleryDao.delete(Integer.parseInt(boardNum));
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("message", "삭제되었습니다.");
		model.addAttribute("url", "list.do?pageNum="+pageNum);
		return "etc/message";
	}

	@Override
	public String updateForm(Model model, String pageNum, String boardNum) {
		Map<String, Integer> hm = new HashMap<>();
		hm.put("kind", 2);
		hm.put("boardNum", Integer.parseInt(boardNum));
		boardDto = galleryDao.getBoard(hm);
		fileList = galleryDao.getFileList(Integer.parseInt(boardNum));
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("boardNum",boardNum);
		model.addAttribute("board", boardDto);
		model.addAttribute("file", fileList);
		return "community/gallery/update";
	}

	@Override
	public String update(HttpSession session, Model model, String pageNum, BoardDto boardDto,
			MultipartHttpServletRequest mRequest, String ir1, UpdateDto updateDto) {
		char c = '"';
		ir1 = ir1.replace("<img src="+c+"../", "<img src="+c+"/final/resources/");
		boardDto.setContent(ir1);
		
		
		
		
		return "";
	}
	
	
	
}
