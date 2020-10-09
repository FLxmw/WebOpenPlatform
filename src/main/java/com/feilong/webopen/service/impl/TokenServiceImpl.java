package com.feilong.webopen.service.impl;

import com.feilong.webopen.entity.Token;
import com.feilong.webopen.mapper.AdminMapper;
import com.feilong.webopen.mapper.TokenMapper;
import com.feilong.webopen.service.TokenService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/9 21:30
 */
@SuppressWarnings("ALL")
@Service
public class TokenServiceImpl implements TokenService {
    @Autowired
    private TokenMapper tokenMapper;
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public void insertToken(Token token) {
        tokenMapper.insertToken(token);
    }

    @Override
    public PageInfo<Token> getTokenByPage(int page, int limit) {
        PageHelper.startPage(page, limit);
        List<Token> tokenList = tokenMapper.findTokenList();
        return new PageInfo<Token>(tokenList);
    }

    @Override
    public Token findTokenByAccessToken(String accessToken) {
        return  tokenMapper.findTokenByToken(accessToken);
    }

}
