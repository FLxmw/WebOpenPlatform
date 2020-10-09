package com.feilong.webopen.mapper;

import com.feilong.webopen.entity.Token;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/9 21:25
 */
@SuppressWarnings("ALL")
public interface TokenMapper {
    void insertToken(Token token);

    Token findTokenByToken(@Param("accessToken") String accessToken);

    List<Token> findTokenList();
}
