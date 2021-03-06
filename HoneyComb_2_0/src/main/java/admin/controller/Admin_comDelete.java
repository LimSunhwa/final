package admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.db.AdminDao;

@Controller
@RequestMapping("/admin_comDelete")
public class Admin_comDelete {

	private AdminDao dao;

	@Autowired
	public void setDao(AdminDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public void admincomDelete(@RequestParam int com_num, HttpServletRequest request) {
		int admincomdelete = dao.admincomDelete(com_num);
	}

}
