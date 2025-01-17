package com.metafinal.home.controller;


import com.metafinal.home.domain.HomeDTO;
import com.metafinal.home.service.HomeService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collections;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/test")
public class HomeController {

    private final HomeService homeService;

    @GetMapping()
    @ResponseBody
    public List<HomeDTO> getList(@RequestParam(required = false, defaultValue = "") String address) {
        if (address == null || address.isEmpty()) {
            log.info("Address parameter is empty or null");
            return Collections.emptyList(); // 빈 리스트 반환
        }
        log.info("Controller-Address:{}", address);
        List<HomeDTO> homeList = homeService.getHomeList(address);
        log.info("homeList : {}", homeList);
        return homeList;
    }
}
