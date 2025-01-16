package com.metafinal.metahome.controller;

import com.metafinal.metahome.domain.AptDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@Slf4j
public class AptController {
    @GetMapping // front
    public List<AptDTO> getAllApt(){
        return getAllApt(); // front랑 협의
    }
    // 추가 페이지 작업
}
