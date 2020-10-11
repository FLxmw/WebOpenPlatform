package com.feilong.webopen.controller;

import com.feilong.webopen.entity.Navs;
import com.feilong.webopen.entity.NavsBeans;
import com.feilong.webopen.entity.NavsParent;
import com.feilong.webopen.service.NavsParentService;
import com.feilong.webopen.service.NavsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/10 20:00
 */
@SuppressWarnings("ALL")
@RestController
@RequestMapping("/navs")
public class NavsController {
    @Autowired
    private NavsService navsService;
    @Autowired
    private NavsParentService navsParentService;

    @RequestMapping("/getNavs")
    public Map<String, List<Navs>> getNavsList() {
        Map<String, List<Navs>> navsMap = new HashMap<>();
        List<NavsParent> parentList = null;
        List<Navs> navsList = null;
        Map<Integer, String> map = new HashMap<>();
        try {
            parentList = navsParentService.getNavsParentList();
            List<Navs> navs = navsService.getAllNavs();
            for (NavsParent navsParent : parentList) {
                for (Navs nav : navs) {
                    if (nav.getPid() == navsParent.getId()) {
                        navsList = navsService.getNavsList(nav.getPid());
                        navsMap.put(navsParent.getMenu(), navsList);
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return navsMap;
    }
}
