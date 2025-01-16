package com.metafinal.metahome.controller;

import com.metafinal.metahome.domain.AptDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@Slf4j
public class AptController {
//    @RequestMapping
//    public List<AptDTO> getAllApt(String aptName){
//        return getAllApt(aptName);
//    }

    @RequestMapping
    public List<AptDTO> getAptGu(@RequestParam String gu){
        return getAptGu(gu);
    }
}
