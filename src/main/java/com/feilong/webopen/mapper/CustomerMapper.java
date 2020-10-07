package com.feilong.webopen.mapper;

import com.feilong.webopen.entity.Customer;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/5 22:51
 */
@SuppressWarnings("ALL")
public interface CustomerMapper {

    void insertCustomer(Customer customer);

    void updateCustomer(Customer customer);

    void deleteCustomerById(int id);

    Customer findCustomerById(int id);

    List<Customer> findAllCustomers();

    List<Customer> findCustomersBySearch(Customer customer);
}
