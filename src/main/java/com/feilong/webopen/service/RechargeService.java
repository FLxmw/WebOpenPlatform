package com.feilong.webopen.service;

import com.feilong.webopen.entity.Recharge;
import com.github.pagehelper.PageInfo;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/10 15:25
 */
@SuppressWarnings("ALL")
public interface RechargeService {
    void insertRecharge(Recharge recharge);

    void updateRecharge(Recharge recharge);

    void deleteRechargeByIds(long[] ids);

    PageInfo<Recharge> getRechargeListByPage(int page,int limit);
}
