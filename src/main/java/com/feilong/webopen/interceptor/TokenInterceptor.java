package com.feilong.webopen.interceptor;

import com.feilong.webopen.utils.JwtUtil;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/9 20:22
 */
@SuppressWarnings("ALL")
public class TokenInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        response.setCharacterEncoding("utf-8");
        request.getLocalName();
        String token = request.getHeader("access_token");
        System.out.println(token);
        //token不存在
        if (token != null) {
            //验证token是否正确
            boolean result = JwtUtil.verify(token);
            if (result) {
                return true;
            }
        }
        response.sendRedirect(request.getContextPath() + "/static/login/login.jsp");
//        ApiResponse apiResponse = ApiResponseUtil.getApiResponse(ApiResponseEnum.AUTH_ERROR);
//        responseMessage(response,response.getWriter(),apiResponse);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }

    /**
     * 返回信息给客户端
     *
     * @param response
     * @param out
     * @param apiResponse
     */
//    private void responseMessage(HttpServletResponse response, PrintWriter out, ApiResponse apiResponse) {
//        response.setContentType("application/json; charset=utf-8");
//        out.print(JSONObject.toJSONString(apiResponse));
//        out.flush();
//        out.close();
//    }
}
