package ezen.nnb.admin.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import ezen.nnb.admin.service.AdminBankService;



@Controller
public class AdminBankController {
	Logger log=Logger.getLogger(this.getClass());
	//consol창에 뜨게하려고 씀
	@Resource(name="adminBankService")
	private AdminBankService adminBankService;
	
	@RequestMapping(value="/admin/")
	
}
