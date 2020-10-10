package com.feilong.webopen.service.impl;

import com.feilong.webopen.entity.Recharge;
import com.feilong.webopen.mapper.RechargeMapper;
import com.feilong.webopen.service.RechargeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/10 15:26
 */
@SuppressWarnings("ALL")
@Service
public class RechargeServiceImpl implements RechargeService {
    @Autowired
    private RechargeMapper rechargeMapper;

    @Override
    public void insertRecharge(Recharge recharge) {
        rechargeMapper.insertRecharge(recharge);
    }

    @Override
    public void updateRecharge(Recharge recharge) {
        rechargeMapper.updateRecharge(recharge);
    }

    @Override
    public void deleteRechargeByIds(long[] ids) {
        if (ids != null && ids.length > 0) {
          rechargeMapper.deleteRechargeByIds(ids);
        }
    }

    @Override
    public PageInfo<Recharge> getRechargeListByPage(int page, int limit) {
        PageHelper.startPage(page, limit);
        List<Recharge> rechargeList = rechargeMapper.getRechargeList();
        return new PageInfo<Recharge>(rechargeList);
    }
}
