package com.feilong.webopen.controller;

import com.feilong.webopen.bean.AjaxMessage;
import com.feilong.webopen.bean.TableData;
import com.feilong.webopen.entity.Customer;
import com.feilong.webopen.service.CustomerService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/addCustomer")
    public AjaxMessage addCustomer(Customer customer) {
        System.out.println(customer);
        try {
            customerService.insertCustomer(customer);
            return new AjaxMessage(true, "添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new AjaxMessage(false, "添加失败！");
    }

    @PostMapping("/updateCustomer")
    public AjaxMessage updateCustomer(Customer customer) {
        System.out.println(customer);
        try {
            customerService.updateCustomer(customer);
            return new AjaxMessage(true, "修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new AjaxMessage(false, "修改失败！");
    }

    @RequestMapping("/deleteCustomer")
    public AjaxMessage deleteCustomer(long[] ids) {
        System.out.println(ids);
        try {
            customerService.deleteCustomerById(ids);
            return new AjaxMessage(true, "删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new AjaxMessage(false, "删除失败！");
    }



    @RequestMapping("/showTable")
    public TableData<Customer> searchCustomers(int page, int limit, Customer customer) {
        System.out.println(2222);
        TableData tableData = new TableData();
        PageInfo<Customer> customers = null;
        try {
            customers = customerService.selectCustomerSearch(page, limit,customer);
        } catch (Exception e) {
            e.printStackTrace();
        }
        tableData.setCode(0);
        tableData.setMsg("成功!");
        tableData.setCount(customers.getTotal());
        tableData.setData(customers.getList());
        return tableData;
    }


}
