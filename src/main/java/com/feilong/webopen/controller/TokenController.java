package com.feilong.webopen.controller;

import com.feilong.webopen.bean.TableData;
import com.feilong.webopen.entity.Token;
import com.feilong.webopen.service.TokenService;
import com.github.pagehelper.PageInfo;
import com.sun.corba.se.impl.oa.toa.TOA;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/9 22:19
 */
@SuppressWarnings("ALL")
@RestController
@RequestMapping("/token")
public class TokenController {
    @Autowired
    private TokenService tokenService;
    @RequestMapping("/showTable")
    public TableData<Token> getTokenList(int page,int limit){
        PageInfo<Token> tokenPageInfo = tokenService.getTokenByPage(page, limit);
        return new TableData<Token>(tokenPageInfo.getTotal(),tokenPageInfo.getList());
    }

    @RequestMapping("/search")
    public Token searchToken(String accessToken){
        System.out.println(2222);
        System.out.println(accessToken);
        Token token = tokenService.findTokenByAccessToken(accessToken);
        return token;
    }
}
