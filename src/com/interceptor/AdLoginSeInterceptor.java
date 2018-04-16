package com.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.vo.Employees;

public class AdLoginSeInterceptor implements Interceptor {

	public void intercept(ActionInvocation ai) {
		try {
			Employees emplog = ai.getController().getSessionAttr("adminsession");
			if(emplog!=null){
				ai.invoke();
			}else{
				ai.getController().renderJson("{\"statusCode\":\"301\", \"message\":\"会话超时\"}");
			}
		} catch (Exception e) {
			ai.getController().renderJson("{\"statusCode\":\"301\", \"message\":\"会话超时\"}");
		}
	}

}
