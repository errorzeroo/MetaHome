package com.metafinal.home.controller;


import com.metafinal.home.domain.HomeDTO;
import com.metafinal.home.service.HomeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/home")
public class HomeController {

    private final HomeService homeService;

    @GetMapping()
    @ResponseBody
    public String getList(Model m, @RequestParam(required = false, defaultValue = "") String address) {
        List<Map<String, Object>> homeList;
//        List<HomeDTO> homeList;
        if (address == null || address.isEmpty()){
            homeList = homeService.getHomeList(null);
        } else {
            homeList = homeService.getHomeList(address);
        }
        log.info("homeList : {}", homeList);
        m.addAttribute("homes", homeList);
//        System.out.println("Home List: " + homeList);
        return "test"; // "test", 그리고 getHomeList 데이터 타입을 String List<Map<String, Object>>
    }
}
