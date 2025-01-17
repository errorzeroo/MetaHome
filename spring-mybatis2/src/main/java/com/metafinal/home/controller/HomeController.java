package com.metafinal.home.controller;


import com.metafinal.home.domain.HomeDTO;
import com.metafinal.home.service.HomeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public List<Map<String, Object>> getList(@RequestParam(required = false, defaultValue = "") String address) {
        List<Map<String, Object>> homeList = homeService.getHomeList(address);
        log.info("homeList : {}", homeList);
        return homeList;
    }
}
