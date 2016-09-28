package login.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/Comcheck.do")
public class CompanyCheckController {

	private LoginDAO logindao;

	public LoginDAO getLogindao() {
		return logindao;
	}

	public void setLogindao(LoginDAO logindao) {
		this.logindao = logindao;
	}
	
	
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String Comcheck(HttpServletRequest request){
		String email  =(String) request.getSession().getAttribute("email");
		int com_num = (int)request.getSession().getAttribute("com_num");
	
		System.out.println("email::::"+email);
		System.out.println("com_num:::::"+com_num);
			
		if(email.equals("admin@admin.com")){
			return "../../admin/admin_main_page";
		}
		
		else{
			if(com_num == 0 ){
				return "../company/mainForm";
			}else if(com_num<0){
			
				return "/temp_accept_page/wait_accept_company";
				
			}
			
			}
		
		
		
		
		/*request.getSession().setAttribute("mem_num", Logindata.getMem_num());
		request.getSession().setAttribute("com_num", Logindata.getCom_num());
		request.getSession().setAttribute("com_dept_num", Logindata.getCom_dept_num());
		request.getSession().setAttribute("com_pos_num", Logindata.getCom_pos_num());
		request.getSession().setAttribute("name", Logindata.getName());
		request.getSession().setAttribute("phone_num", Logindata.getPhone_num());
		request.getSession().setAttribute("com_name", Logindata.getCom_name());
		request.getSession().setAttribute("com_dept_name", Logindata.getCom_dept_name());
		request.getSession().setAttribute("com_pos_name", Logindata.getCom_pos_name());*/
		
		
		return "../comCheck";
	}
	
	
	
}