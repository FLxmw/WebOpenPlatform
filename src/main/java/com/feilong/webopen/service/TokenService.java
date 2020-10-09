package com.feilong.webopen.service;

import com.feilong.webopen.entity.Token;
import com.github.pagehelper.PageInfo;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/9 21:30
 */
@SuppressWarnings("ALL")
public interface TokenService {
    void insertToken(Token token);

    PageInfo<Token> getTokenByPage(int page,int limit);

    Token findTokenByAccessToken(String accessToken);
}
