package com.feilong.webopen.service;

import com.feilong.webopen.entity.Customer;
import com.github.pagehelper.PageInfo;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/5 23:05
 */
@SuppressWarnings("ALL")
public interface CustomerService {
    void insertCustomer(Customer customer);

    void updateCustomer(Customer customer);

    void deleteCustomerById(int id);

    Customer findCustomerById(int id);

    PageInfo<Customer> findAllCustomers(Customer customer, int page, int limit);

    PageInfo<Customer> selectCustomerSearch(Customer customer, int page, int limit);
}
