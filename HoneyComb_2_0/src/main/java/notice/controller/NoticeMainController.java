package notice.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import notice.db.NoticeDao;
import notice.db.NoticeDataBean;

@Controller
@RequestMapping("/main.do")
public class NoticeMainController {

	private NoticeDao dao;

	@Autowired
	public void setDao(NoticeDao dao) {
		this.dao = dao;
	}

	public ModelAndView submit(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam("com_num") int com_num) {

		int pageSize = 5;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = 0;
		endRow = currentPage * pageSize;

		int notice_count = 0;
		int number = 0;

		List articleList = null;

		notice_count = dao.getNoticeCount(com_num);

		if (notice_count > 0) {

			articleList = dao.getNoticeList(com_num, -1, endRow);

		} else {
			articleList = Collections.EMPTY_LIST;
		}

		number = notice_count - (currentPage - 1) * pageSize;
		
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("notice_count", notice_count);
		mav.addObject("articleList", articleList);

		return mav;
	}

}
