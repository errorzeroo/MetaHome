package com.metafinal.home.controller;


import com.metafinal.home.domain.HomeDTO;
import com.metafinal.home.service.HomeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class HomeController {

    private final HomeService homeService;

    @RequestMapping("/test")
    public String getList(@RequestParam String address) {
        List<HomeDTO> homeList = homeService.getHomeList(address);
        log.info("homeList : ", homeList);
        return "test";
    }
}
