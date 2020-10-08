package com.feilong.webopen.controller;

import com.feilong.webopen.bean.AjaxMessage;
import com.feilong.webopen.bean.TableData;
import com.feilong.webopen.entity.Customer;
import com.feilong.webopen.service.CustomerService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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
    public AjaxMessage addCustomer(@RequestBody Customer customer){
        System.out.println(customer);
        try {
            customerService.insertCustomer(customer);
            return new AjaxMessage(true,"添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new AjaxMessage(false,"添加失败！");
    }

    @RequestMapping("/updateCustomer")
    public AjaxMessage updateCustomer(@RequestBody Customer customer){
        System.out.println(customer);
        try {
            customerService.updateCustomer(customer);
            return new AjaxMessage(true,"修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new AjaxMessage(false,"修改失败！");
    }
    @RequestMapping("/deleteCustomer")
    public AjaxMessage deleteCustomer(int id){
        System.out.println(id);
        try {
            customerService.deleteCustomerById(id);
            return new AjaxMessage(true,"删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new AjaxMessage(false,"删除失败！");
    }

    @RequestMapping("/showTable")
    public TableData<Customer> showCustomers(Customer customer,int page,int limit){
        System.out.println(2222);
        TableData tableData=new TableData();
        PageInfo<Customer> customers = customerService.findAllCustomers(customer,page, limit);
        tableData.setCode(0);
        tableData.setMsg("成功!");
        tableData.setCount(customers.getTotal());
        tableData.setData(customers.getList());
        return tableData;
    }


}
