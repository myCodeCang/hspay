package com.jsp;

import java.util.List;

import com.jfinal.core.Controller;
import com.jsp.dynamic.service.DynamicService;
import com.vo.Dynamic;

public class indexController extends Controller {
	
	public void index(){
		//redirect("/2017/index.html");
		redirect("/hfht/index.html");
	}
	
	public void newsList(){
		List<Dynamic> dynamicList = Dynamic.dao.find("select d.dynamicid, d.title,d.createtime from dynamic d ORDER BY d.createtime DESC LIMIT 0,20");
		renderJson(dynamicList);
	}

	public void getDynamic(){
		int dynamicid = getParaToInt("dynamicid");
		Dynamic dynamic = DynamicService.service.getDynamic(dynamicid);
		renderJson(dynamic);
	}
	public void help(){
		renderJsp("/WEB-INF/help.jsp");
	}
	
	public void inTerFace(){
		renderJsp("/WEB-INF/interface.jsp");
	}
	
	public void about(){
		renderJsp("/WEB-INF/about.jsp");
	}
	
	public void forgetpassword(){
		renderJsp("/WEB-INF/forgetpassword.jsp");
	}
	public void gateway(){
		renderJsp("/WEB-INF/gateway.jsp");
	}
}
