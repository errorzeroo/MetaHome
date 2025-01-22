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

import java.util.ArrayList;
import java.util.LinkedHashMap;
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
    public String getList(Model m, @RequestParam(required = false, defaultValue = "") String address,
                          @RequestParam(required = false, defaultValue = "") String homeKind) {
        List<Map<String, Object>> homeList;

        // 조건에 따라 homeList 가져오기
        if ((address == null || address.isEmpty()) && (homeKind == null || homeKind.isEmpty())) {
            homeList = homeService.getAllHomes();
        } else if (homeKind == null || homeKind.isEmpty()) {
            homeList = homeService.getHomeArea(address);
        } else if (address == null || address.isEmpty()) {
            homeList = homeService.getHomeKind(homeKind);
        } else {
            homeList = homeService.getMyHome(address, homeKind);
        }

        List<Map<String, Object>> subwayList = homeService.getSubwayList();


        // HOME_IMG 값을 배열로 변환 (homeList 처리)
        for (Map<String, Object> home : homeList) {
            String homeImg = (String) home.get("HOME_IMG");
            if (homeImg != null) {
                // 탭(\t)으로 구분된 URL을 배열로 변환
                String[] imgArray = homeImg.split("\t");
                home.put("HOME_IMG", imgArray); // 배열로 다시 저장
            }
        }

        // 주소 기준으로 중복 제거 (filteredList 생성)
        Map<String, Map<String, Object>> filteredMap = new LinkedHashMap<>();
        for (Map<String, Object> home : homeList) {
            String homeAddress = (String) home.get("HOME_ADDRESS");
            if (!filteredMap.containsKey(homeAddress)) {
                filteredMap.put(homeAddress, home); // 첫 번째 데이터만 유지
            }
        }
        List<Map<String, Object>> filteredList = new ArrayList<>(filteredMap.values());

        // JSON으로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        String homeListJson = "";
        String filteredListJson = "";
        String subwayListJson = "";

        try {
            homeListJson = objectMapper.writeValueAsString(homeList); // homeList를 JSON 문자열로 변환
            filteredListJson = objectMapper.writeValueAsString(filteredList); // filteredList를 JSON 문자열로 변환
            subwayListJson = objectMapper.writeValueAsString(subwayList); // filteredList를 JSON 문자열로 변환
        } catch (Exception e) {
            e.printStackTrace();
        }

        // JSP에 JSON 데이터를 전달
        m.addAttribute("homeListJson", homeListJson);
        m.addAttribute("filteredListJson", filteredListJson);
        m.addAttribute("subwayListJson", subwayListJson);

        log.info("subwayListJson : {}", subwayListJson);
        // 로그 출력
        //log.info("homeList.size() : {}", homeList.size());
        //log.info("filteredList.size() : {}", filteredList.size());
        //log.info("homeListJson : {}", homeListJson);
        //log.info("filteredListJson : {}", filteredListJson);

        return "test";
    }


    @GetMapping("/find")
    public String findSimilarAddresses(
            @RequestParam String columns, // 사용자 입력 컬럼
            @RequestParam String values,   // 사용자 입력 값
            Model model
    ) {
        PythonRunner pythonRunner = new PythonRunner();
        String result = pythonRunner.runPythonScript(columns, values);

        if (result == null) {
            model.addAttribute("error", "Python 실행 중 오류가 발생했습니다.");
            return "error";
        }

        //log.info("python result: {}", result);

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
