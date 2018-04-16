package com.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.vo.Employees;

public class AdLoginInterceptor implements Interceptor {

	@Override
	public void intercept(ActionInvocation ai) {
		try {
			Employees emplog = ai.getController().getSessionAttr("adminsession");
			if(emplog!=null){
				ai.invoke();
			}else{
				ai.getController().renderJsp("/WEB-INF/admin/login.jsp");
			}
		} catch (Exception e) {
			ai.getController().renderJsp("/WEB-INF/admin/login.jsp");
		}
	}
}
