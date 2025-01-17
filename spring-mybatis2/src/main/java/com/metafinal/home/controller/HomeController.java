package com.metafinal.home.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.metafinal.home.PythonRunner;
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
    private final PythonRunner pythonRunner = new PythonRunner();

    @GetMapping()
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
        return "test";
    }

    @GetMapping("/find")
    public String findSimilarAddresses(
            @RequestParam String columns, // 사용자 입력 컬럼
            @RequestParam String values,   // 사용자 입력 값
            Model model
    ) {
        String result = pythonRunner.runPythonScript(columns, values);

        if (result == null) {
            model.addAttribute("error", "Python 실행 중 오류가 발생했습니다.");
            return "error";
        }

        log.info("python result: {}", result);

        // JSON 데이터를 Java 객체로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            List<Map<String, Object>> addressList = objectMapper.readValue(result, new TypeReference<List<Map<String, Object>>>() {});
            String jsonString = objectMapper.writeValueAsString(addressList); // JSON 문자열로 변환
            model.addAttribute("jsonData", jsonString); // JSP에 JSON 문자열 전달
        } catch (JsonProcessingException e) {
            log.error("JSON 변환 오류", e);
            model.addAttribute("error", "JSON 데이터를 처리하는 중 오류가 발생했습니다.");
            return "error";
        }

        return "test";
    }

}
