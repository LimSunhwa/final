package promgr.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import promgr.db.PromgrDao;
import promgr.db.PromgrDataBean;

@Controller
@RequestMapping("/main.do")
public class PromgrMainController {

	private PromgrDao dao;

	@Autowired
	public void setDao(PromgrDao dao) {
		this.dao = dao;
	}

	public ModelAndView submit(HttpServletRequest request) {

		int rowSize = 5;
		int promgr_count = 0;
		int com_num = (int) request.getSession().getAttribute("com_num");
		int mem_num = (int) request.getSession().getAttribute("mem_num");

		List<PromgrDataBean> articleList = null;
		promgr_count = dao.getPromgrCount(com_num, mem_num); // row 갯수 호출

		if (promgr_count > 0) {

			articleList = dao.getPromgrList(com_num, mem_num, -1, rowSize);

		} else {
			articleList = Collections.emptyList();
		}
		
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("promgr_count", promgr_count);
		mav.addObject("articleList", articleList);

		return mav;
	}

}
