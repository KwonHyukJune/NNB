package ezen.nnb.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.common.CommandMap;


@Controller
public class MainController {
	
		Logger log = Logger.getLogger(this.getClass());

		@RequestMapping(value="/main")
	    public ModelAndView main(CommandMap commandMap) throws Exception{
	    	ModelAndView mv = new ModelAndView("/member/main");
	    	return mv;
	    }
}
		
		