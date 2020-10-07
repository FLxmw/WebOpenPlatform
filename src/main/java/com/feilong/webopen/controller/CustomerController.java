package com.feilong.webopen.controller;

import com.feilong.webopen.bean.TableData;
import com.feilong.webopen.entity.Customer;
import com.feilong.webopen.service.CustomerService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
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

    @PostMapping("/addCustomer")
    public String addCustomer(Customer customer){
        customerService.insertCustomer(customer);
        return "success";
    }

    @RequestMapping("/showCustomers")
    public TableData<Customer> showCustomers(int page,int limit){
        TableData tableData=new TableData();
        PageInfo<Customer> customers = customerService.findAllCustomers(page, limit);
        tableData.setCode(0);
        tableData.setMsg("成功!");
        tableData.setCount(customers.getTotal());
        tableData.setData(customers.getList());
        return tableData;
    }
}
