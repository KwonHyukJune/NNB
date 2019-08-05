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

@Component("bankFile")
public class BankFile {
	
	private static final String filePath = "C:\\dev\\file\\";//파일이 저장될 위치를 지정.
	
	public Map<String,Object> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames(); //파일들의 이름을 받아서 iterator에 집어넣는다.
    	
    	MultipartFile multipartFile = null;
    	String originalFileName = null;
    	String originalFileExtension = null;
    	String storedFileName = null;
    	
    	//클라이언트에서 전송된 파일 정보를 담아서 반환을 해줄 list (다중파일전송을 위해서 list)
        
        //만약 폴더가 없으면 폴더를 생성하기로한다.
        File file = new File(filePath);
        if(file.exists() == false){
        	file.mkdirs();
        }
        int i = 1;
        while(iterator.hasNext()){ // 파일이름들이 저장된 것을 하나씩 꺼낸다.
        	multipartFile = multipartHttpServletRequest.getFile(iterator.next()); //파일 정보를 담는다.
        	if(multipartFile.isEmpty() == false){ //이게 있으면~ 
        		originalFileName = multipartFile.getOriginalFilename();//오리지날 파일 이름을 저장.
				
				if(originalFileName==null) {
					originalFileName=""; 
					storedFileName="";
				}else {
					originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));//확장자를 분리해서 확장자를 저장한다.
					storedFileName = CommonUtils.getRandomString() + originalFileExtension; //램덤 변수를 생성해서 저장 이름을 만든다.
				}
        		
        		file = new File(filePath + storedFileName); //만들 파일에다가 파일경로+ 저장 이름을 넣어줘서 저장한다.
        		multipartFile.transferTo(file); //방금 만들 파일을 저장경로에 저장한다.
        		
        		map.put("ORIGINAL_FILE_NAME"+i, originalFileName); //오리지날 이름을 맵에 넣는다.
        		map.put("STORED_FILE_NAME"+i, storedFileName); //저장이름을 맵에 넣는다.
        		System.out.println("dd:"+i);
        	}
        	i++;
        }
		return map; //리스트를 리턴한다.
	}

	public List<Map<String, Object>> parseUpdateFileInfo(Map<String, Object> map, HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    	
    	MultipartFile multipartFile = null;
    	String originalFileName = null;
    	String originalFileExtension = null;
    	String storedFileName = null;
    	
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null; 
        
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
        		listMap.put("ROOM_NUM", room_Num);
        		listMap.put("ORIGINAL_FILE_NAME", originalFileName);
        		listMap.put("STORED_FILE_NAME", storedFileName);
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
