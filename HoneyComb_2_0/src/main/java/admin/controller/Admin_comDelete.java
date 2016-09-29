package admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.db.AdminDao;
import admin.db.AdminInfo;

@Controller
@RequestMapping("/admin_comDelete")
public class Admin_comDelete {

	private AdminDao dao;

	@Autowired
	public void setDao(AdminDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public int admincomDelete(@RequestParam int com_num, HttpServletRequest request) {
		int admincomdelete = 0;
		admincomdelete = dao.admincomDelete(com_num);
		return admincomdelete;
	}

}
