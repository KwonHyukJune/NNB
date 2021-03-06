package ezen.nnb.common;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	
	/*
	 * private static final String filePath = "C:\\dev\\file\\";//파일이 저장될 위치를 지정.
	 */	
	public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames(); //파일들의 이름을 받아서 iterator에 집어넣는다.
    	String filePath = request.getSession().getServletContext().getRealPath("/roomImages/");
    	
    	MultipartFile multipartFile = null;
    	String originalFileName = null;
    	String originalFileExtension = null;
    	String storedFileName = null;
    	
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>(); 
    	//클라이언트에서 전송된 파일 정보를 담아서 반환을 해줄 list (다중파일전송을 위해서 list)
        Map<String, Object> listMap = null; 
		String roomIdx = (String)map.get("idx");
        String MEM_ID = (String)request.getSession().getAttribute("MEM_ID");
        //만약 폴더가 없으면 폴더를 생성하기로한다.
        File file = new File(filePath);
        if(file.exists() == false){
        	file.mkdirs();
        }
        
        while(iterator.hasNext()){ // 파일이름들이 저장된 것을 하나씩 꺼낸다.
        	multipartFile = multipartHttpServletRequest.getFile(iterator.next()); //파일 정보를 담는다.
        	if(multipartFile.isEmpty() == false){ //이게 있으면~ 
        		originalFileName = multipartFile.getOriginalFilename();//오리지날 파일 이름을 저장.
        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));//확장자를 분리해서 확장자를 저장한다.
        		storedFileName = CommonUtils.getRandomString() + originalFileExtension; //램덤 변수를 생성해서 저장 이름을 만든다.
        		
        		file = new File(filePath + storedFileName); //만들 파일에다가 파일경로+ 저장 이름을 넣어줘서 저장한다.
        		multipartFile.transferTo(file); //방금 만들 파일을 저장경로에 저장한다.
        		
        		listMap = new HashMap<String,Object>(); //해쉬맵 객체생성
        		listMap.put("ROOM_NUM",roomIdx);
        		listMap.put("CREA_ID",MEM_ID);
        		listMap.put("ORG_NAME", originalFileName); //오리지날 이름을 맵에 넣는다.
        		listMap.put("STD_NAME", storedFileName); //저장이름을 맵에 넣는다.
        		listMap.put("FILE_SIZE", multipartFile.getSize()); //파일사이즈를 맵에 넣는다.
        		list.add(listMap); //방금 만든 맵을 리스트에 넣는다.
        	}
        }
		return list; //리스트를 리턴한다.
	}

	public List<Map<String, Object>> parseUpdateFileInfo(Map<String, Object> map, HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    	String filePath = request.getSession().getServletContext().getRealPath("/roomImages/");

    	MultipartFile multipartFile = null;
    	String originalFileName = null;
    	String originalFileExtension = null;
    	String storedFileName = null;
    	
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null; 
		String roomIdx = (String)map.get("idx");
        String MEM_ID = (String)request.getSession().getAttribute("MEM_ID");        
        
        String room_Num = (String)map.get("ROOM_NUM");
        String requestName = null;
        String idx = null;
        
        
        while(iterator.hasNext()){
        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
        	if(multipartFile.isEmpty() == false){ //이게 비어있지 않으면~~
        		originalFileName = multipartFile.getOriginalFilename();
        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        		storedFileName = CommonUtils.getRandomString() + originalFileExtension;
        		
        		multipartFile.transferTo(new File(filePath + storedFileName));
        		
        		listMap = new HashMap<String,Object>();
        		listMap.put("IS_NEW", "Y");
        		listMap.put("CREA_ID",MEM_ID);
        		listMap.put("ROOM_NUM", room_Num);
        		listMap.put("ORG_NAME", originalFileName);
        		listMap.put("STD_NAME", storedFileName);
        		listMap.put("FILE_SIZE", multipartFile.getSize());
        		list.add(listMap);
        	}
        	else{
        		//기존에 저장했던 파일이 있었는 지 확인하는 else 문
        		requestName = multipartFile.getName();
            	idx = "FILE_NUM_"+requestName.substring(requestName.indexOf("_")+1);
            	if(map.containsKey(idx) == true && map.get(idx) != null){
            		listMap = new HashMap<String,Object>();
            		listMap.put("IS_NEW", "N");
            		listMap.put("FILE_NUM", map.get(idx));
            		list.add(listMap);
            	}
        	}
        }
		return list;
	}
}
