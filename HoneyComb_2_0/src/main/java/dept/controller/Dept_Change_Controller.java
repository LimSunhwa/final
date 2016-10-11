package dept.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import company.controller.CompanyMainView_Controller;
import dept.db.DeptDAO;

@Controller
public class Dept_Change_Controller {

	private DeptDAO dao;

	public void setDao(DeptDAO dao) {
		this.dao = dao;
	}

	@RequestMapping("change")
	public ModelAndView dept_Change_View(@RequestParam("mem_num") int mem_num, @RequestParam("code") int code) {
		
		ModelAndView mav = new ModelAndView("dept_pos_change_view");

		CompanyMainView_Controller cm = new CompanyMainView_Controller();

		if (code == 1) {
			Map<Integer, String> dept = cm.deptMap();
			mav.addObject("dept_map", dept);

			
		} else if (code == 2) {
			Map<Integer, String> pos = cm.posMap();
			mav.addObject("pos_map", pos);
		}

		mav.addObject("mem_num", mem_num);

		return mav;
	}
	
	@RequestMapping("dept_change_pro")
	public String dept_change_pro() {
		
		
		
		return "dept_close";
	}
	
	@RequestMapping("pos_change_pro")
	public String pos_change_pro() {
		
		return "dept_close";
	}

}
