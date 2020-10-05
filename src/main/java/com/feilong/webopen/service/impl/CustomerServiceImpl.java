package com.feilong.webopen.service.impl;

import com.feilong.webopen.entity.Customer;
import com.feilong.webopen.mapper.CustomerMapper;
import com.feilong.webopen.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/5 23:06
 */
@SuppressWarnings("ALL")
@Service("customerService")
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerMapper customerMapper;
    @Override
    public void insertCustomer(Customer customer) {
        customerMapper.insertCustomer(customer);
    }

    @Override
    public void updateCustomer(Customer customer) {
       customerMapper.updateCustomer(customer);
    }

    @Override
    public void deleteCustomerById(int id) {
      customerMapper.deleteCustomerById(id);
    }

    @Override
    public Customer findCustomerById(int id) {
        Customer customer = customerMapper.findCustomerById(id);
        return customer;
    }

    @Override
    public List<Customer> findAllCustomers() {
        List<Customer> customers = customerMapper.findAllCustomers();
        return customers;
    }
}
