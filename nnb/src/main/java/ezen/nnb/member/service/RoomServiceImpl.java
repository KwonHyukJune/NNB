package ezen.nnb.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import ezen.nnb.common.FileUtils;
import ezen.nnb.member.dao.RoomDAO;

@Service("roomService")
public class RoomServiceImpl implements RoomService {

	@Resource(name = "roomDAO")
	private RoomDAO roomDAO;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Override
	public void insertRoom(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		roomDAO.insertRoomInfo(map);

		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for (int i = 0, size = list.size(); i < size; i++) {
			roomDAO.insertRoomFile(list.get(i));
		}
	}

	@Override
	public Map<String, Object> selectRoomDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		roomDAO.updateHitCnt(map);
		Map<String, Object> resultMap = new HashMap<String, Object>();

		Map<String, Object> tempMap = roomDAO.selectRoomInfoDetail(map);
		resultMap.put("map", tempMap);

		List<Map<String, Object>> list = roomDAO.selectRoomFileList(map);
		resultMap.put("list", list);

		return resultMap;
	}

	@Override
	public void deleteRoom(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		roomDAO.deleteRoom(map);
	}

}
