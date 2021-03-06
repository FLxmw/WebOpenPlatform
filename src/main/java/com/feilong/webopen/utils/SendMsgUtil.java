package com.feilong.webopen.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/16 13:58
 */
@SuppressWarnings("ALL")
public class SendMsgUtil {
    /**
     * 发送短信消息
     * 方法说明
     * @Discription:扩展说明
     * @param phones
     * @param content
     * @return
     * @return String
     */

    public static String sendMsg(String phones,String content) {
        try {
            content = java.net.URLEncoder.encode(content,"UTF-8");
            System.out.println(content);
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        //短信接口URL提交地址
        String url = "https://api.dingdongcloud.com/v1/sms/sendyzm?apikey=b46c4961aa875f626b7924aace0d53f7&mobile="+phones+"&content="+content;

        Map<String, String> params = new HashMap<String, String>();

        params.put("zh", "账号");
        params.put("mm", "密码");
        params.put("dxlbid", "短信类别编号");
        params.put("extno", "扩展编号");

        //手机号码，多个号码使用英文逗号进行分割
        params.put("hm", phones);
        //将短信内容进行URLEncoder编码
        params.put("nr", URLEncoder.encode(content));

        return HttpRequestUtil.getRequest(url, params);
    }

    /**
     * 随机生成6位随机验证码
     * 方法说明
     * @Discription:扩展说明
     * @return
     * @return String
     */
    public static String createRandomVcode(){
        //验证码
        String vcode = "";
        for (int i = 0; i < 6; i++) {
            vcode = vcode + (int)(Math.random() * 9);
        }
        return vcode;
    }
    /**
     * 测试
     * 方法说明
     * @Discription:扩展说明
     * @param args
     * @return void
     */
    public static void main(String[] args) {
//  System.out.println(SendMsgUtil.createRandomVcode());
//  System.out.println("&ecb=12".substring(1));
        System.out.println(sendMsg("17864299050", "yanzgangnma:" + SendMsgUtil.createRandomVcode() + "33333"));
    }
}
