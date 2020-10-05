package com.feilong.webopen.controller;

import com.feilong.webopen.entity.Customer;
import com.feilong.webopen.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/5 23:11
 */
@SuppressWarnings("ALL")
@RestController
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    @RequestMapping("/addCustomer")
    public String addCustomer(Customer customer){
        customerService.insertCustomer(customer);
        return "success";
    }
}
