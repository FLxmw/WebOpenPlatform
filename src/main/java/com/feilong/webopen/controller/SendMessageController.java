package com.feilong.webopen.controller;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.feilong.webopen.bean.AjaxMessage;
import com.feilong.webopen.utils.MessageUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

import static com.feilong.webopen.utils.MessageUtil.signName;
import static com.feilong.webopen.utils.MessageUtil.templateCode;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/16 21:47
 */
@SuppressWarnings("ALL")
@RestController
@RequestMapping("/send")
public class SendMessageController {

    @RequestMapping("/sendMessage")
    public AjaxMessage sendMessage(String phone, HttpServletRequest req) {
        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", MessageUtil.accessKeyId, MessageUtil.accessKeySecret);
        IAcsClient client = new DefaultAcsClient(profile);
        //保证验证码的唯一性需要及时清理
        req.getSession().removeAttribute("message");
        String message = MessageUtil.setRandomNumber();
        //把验证码保存在session
        req.getSession().setAttribute("message", message);
        CommonRequest request = new CommonRequest();
        request.setMethod(MethodType.POST);
        request.setDomain("dysmsapi.aliyuncs.com");
        request.setVersion("2017-05-25");
        request.setAction("SendSms");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        request.putQueryParameter("PhoneNumbers", phone);
        request.putQueryParameter("SignName", signName);
        request.putQueryParameter("TemplateCode", templateCode);
        request.putQueryParameter("TemplateParam", "{code:" + message + "}");
        try {
            CommonResponse response = client.getCommonResponse(request);
            System.out.println(response.getData());
            return new AjaxMessage(true, "成功！");
        } catch (ServerException e) {
            e.printStackTrace();
        } catch (ClientException e) {
            e.printStackTrace();
        }
        return new AjaxMessage(false, "失败！");
    }
}
