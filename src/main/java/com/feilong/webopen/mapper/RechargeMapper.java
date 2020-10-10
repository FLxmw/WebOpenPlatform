package com.feilong.webopen.mapper;

import com.feilong.webopen.entity.Recharge;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/10 15:12
 */
@SuppressWarnings("ALL")
@Repository
public interface RechargeMapper {
    void insertRecharge(Recharge recharge);

    void updateRecharge(Recharge recharge);

    void deleteRechargeByIds(long[] ids);

    List<Recharge> getRechargeList();

    Recharge getRechargeById(Integer id);
}
