package com.metafinal.home.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.metafinal.home.PythonRunner;
import com.metafinal.home.PythonRunner2;
import com.metafinal.home.service.HomeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.*;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/home")
public class HomeController {

    private final HomeService homeService;
    private final PythonRunner pythonRunner = new PythonRunner();

//    // 서울에 있는 구 리스트
//    private static final List<String> VALID_ADDRESSES = Arrays.asList(
//            "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구",
//            "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구",
//            "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"
//    );
//
//    // 허용되는 주택 종류 리스트
//    private static final List<String> VALID_HOME_KINDS = Arrays.asList(
//            "아파트", "연립 주택", "다세대주택", "단독주택", "다가구주택", "오피스텔"
//    );

    @GetMapping()
    public String getList(Model m, @RequestParam(required = false, defaultValue = "") String address,
                          @RequestParam(required = false, defaultValue = "") String homeKind,
                          @RequestParam(required = false, defaultValue = "N") String recruit) {
        // 허용 값 정의
        List<String> validAddresses = Arrays.asList("", "강남구", "강동구", "강북구", "강서구", "관악구",
                "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구",
                "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구",
                "은평구", "종로구", "중구", "중랑구");
        List<String> validHomeKinds = Arrays.asList("", "아파트", "연립 주택", "다세대주택", "단독주택", "다가구주택", "오피스텔");

        // 검증 로직
        if (!address.isEmpty() && !validAddresses.contains(address)) {
            m.addAttribute("errorMessage", "Invalid address: " + address);
            return "error.jsp";
        }

        if (!homeKind.isEmpty() && !validHomeKinds.contains(homeKind)) {
            m.addAttribute("errorMessage", "Invalid homeKind: " + homeKind);
            return "error.jsp";
        }

        if (!recruit.equals("Y") && !recruit.equals("N")) {
            m.addAttribute("errorMessage", "Invalid recruit: " + recruit);
            return "error.jsp";
        }

        List<Map<String, Object>> homeList;

        // 조건에 따라 homeList 가져오기
        if ((address == null || address.isEmpty()) && (homeKind == null || homeKind.isEmpty()) && recruit.equals("Y")) {
            homeList = homeService.getAllHomesRecr(recruit);
        }else if((address == null || address.isEmpty()) && (homeKind == null || homeKind.isEmpty())) {
            homeList = homeService.getAllHomes();
        } else if ((homeKind == null || homeKind.isEmpty()) && recruit.equals("Y")) {
            homeList = homeService.getHomeAreaRecr(address, recruit);
        } else if(homeKind == null || homeKind.isEmpty()) {
            homeList = homeService.getHomeArea(address);
        }else if((address == null || address.isEmpty()) && recruit.equals("Y")) {
            homeList = homeService.getHomeKindRecr(homeKind, recruit);
        }else if (address == null || address.isEmpty()) {
            homeList = homeService.getHomeKind(homeKind);
        } else if(recruit.equals("Y")){
            homeList = homeService.getMyHomeRecr(address, homeKind, recruit);
        } else {
            homeList = homeService.getMyHome(address, homeKind);
        }

        List<Map<String, Object>> subwayList = homeService.getSubwayList();
        List<Map<String, Object>> busList = homeService.getBusList();
        List<Map<String, Object>> hospList = homeService.getHospList();
        List<Map<String, Object>> parkList = homeService.getParkList();
        List<Map<String, Object>> elemList = homeService.getElemList();
        List<Map<String, Object>> midList = homeService.getMidList();
        List<Map<String, Object>> highList = homeService.getHighList();


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
        String busListJson = "";
        String hospListJson = "";
        String parkListJson = "";
        String elemListJson = "";
        String midListJson = "";
        String highListJson = "";

        try {
            homeListJson = objectMapper.writeValueAsString(homeList); // homeList를 JSON 문자열로 변환
            filteredListJson = objectMapper.writeValueAsString(filteredList); // filteredList를 JSON 문자열로 변환
            subwayListJson = objectMapper.writeValueAsString(subwayList);
            busListJson = objectMapper.writeValueAsString(busList);
            hospListJson = objectMapper.writeValueAsString(hospList);

            parkListJson = objectMapper.writeValueAsString(parkList);
            elemListJson = objectMapper.writeValueAsString(elemList);
            midListJson = objectMapper.writeValueAsString(midList);
            highListJson = objectMapper.writeValueAsString(highList);
            // filteredList를 JSON 문자열로 변환
        } catch (Exception e) {
            e.printStackTrace();
        }

        // JSP에 JSON 데이터를 전달
        m.addAttribute("address", address);
        m.addAttribute("homeKind", homeKind);
        m.addAttribute("homeListJson", homeListJson);
        m.addAttribute("filteredListJson", filteredListJson);
        m.addAttribute("subwayListJson", subwayListJson);
        m.addAttribute("busListJson", busListJson);
        m.addAttribute("hospListJson", hospListJson);
        m.addAttribute("parkListJson", parkListJson);
        m.addAttribute("elemListJson", elemListJson);
        m.addAttribute("midListJson", midListJson);
        m.addAttribute("highListJson", highListJson);

        return "test";
    }


    @GetMapping("/find")
    public String findSimilarAddresses(
            @RequestParam String address, // 사용자 입력 주소
            @RequestParam String homeKind, // 사용자 입력 주택유형
            @RequestParam String columns, // 사용자 입력 컬럼
            @RequestParam String values,   // 사용자 입력 값
            Model model
    ) {
        PythonRunner pythonRunner = new PythonRunner();
        String result = pythonRunner.runPythonScript(address, homeKind, columns, values);

        if (result == null) {
            model.addAttribute("error", "Python 실행 중 오류가 발생했습니다.");
            return "error";
        }


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


    @GetMapping("/chart")
    @ResponseBody // JSON 데이터를 직접 반환
    public String findSimilarAddresses2(
            @RequestParam(required = false, defaultValue = "") String address, // 사용자 입력 주소
            @RequestParam(required = false, defaultValue = "") String homeKind, // 사용자 입력 주택유형
            @RequestParam(required = false, defaultValue = "bus,subway,park,parking,hospitalcount,middle,element,high") String columns, // 사용자 입력 컬럼
            @RequestParam(required = false, defaultValue = "0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00") String values
    ) {
        PythonRunner pythonRunner = new PythonRunner();
        String result = pythonRunner.runPythonScript(address, homeKind, columns, values);

        if (result == null) {
            return "{\"error\": \"Python 실행 중 오류가 발생했습니다.\"}";
        }

        // JSON 데이터를 Java 객체로 변환 후 다시 JSON 문자열로 처리
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            List<Map<String, Object>> addressList = objectMapper.readValue(result, new TypeReference<List<Map<String, Object>>>() {});
            return objectMapper.writeValueAsString(addressList); // JSON 데이터를 반환
        } catch (JsonProcessingException e) {
            log.error("JSON 변환 오류", e);
            return "{\"error\": \"JSON 데이터를 처리하는 중 오류가 발생했습니다.\"}";
        }
    }

    @GetMapping("/five")
    @ResponseBody // JSON 데이터를 직접 반환
    public String fiveSimilarAddresses2(
            @RequestParam(required = false, defaultValue = "No") String address, // 사용자 입력 주소
            @RequestParam(required = false, defaultValue = "No") String homeKind, // 사용자 입력 주택유형
            @RequestParam(required = false, defaultValue = "bus,subway,park,parking,hospitalcount,middle,element,high") String columns, // 사용자 입력 컬럼
            @RequestParam(required = false, defaultValue = "0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00") String values   // 사용자 입력 값
    ) {
        log.info("address/five: {}", address);
        log.info("homeKind/five: {}", homeKind);
        log.info("columns/five: {}", columns);
        log.info("values/five: {}", values);
        PythonRunner2 pythonRunner2 = new PythonRunner2();
        String result = pythonRunner2.runPythonScript(address, homeKind, columns, values);

        if (result == null) {
            return "{\"error\": \"Python 실행 중 오류가 발생했습니다.\"}";
        }

        // JSON 데이터를 Java 객체로 변환 후 다시 JSON 문자열로 처리
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            List<Map<String, Object>> addressList = objectMapper.readValue(result, new TypeReference<List<Map<String, Object>>>() {});
            return objectMapper.writeValueAsString(addressList); // JSON 데이터를 반환
        } catch (JsonProcessingException e) {
            log.error("JSON 변환 오류", e);
            return "{\"error\": \"JSON 데이터를 처리하는 중 오류가 발생했습니다.\"}";
        }
    }

    @PostMapping("/recom")
    @ResponseBody
    public Map<String, Object> processRecommendations(@RequestBody List<Map<String, Object>> requestData) {
        // 컨트롤러 로직
        List<Map<String, Object>> homeList = new ArrayList<>();

        // JSON 데이터에서 각 address 값을 순회
        for (Map<String, Object> item : requestData) {
            String address = (String) item.get("address");

            // address로 DB에서 데이터 조회
            List<Map<String, Object>> homes = homeService.findByAddress(address);

            // 조회된 데이터를 homeList에 추가
            homeList.addAll(homes);
        }
        log.info("Home data for address {}: {}", homeList.size());

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

        // 결과를 JSON 형태로 반환
        Map<String, Object> response = new HashMap<>();
        response.put("homeList", homeList);         // 전체 데이터
        response.put("filteredList", filteredList); // 중복 제거 데이터

        return response;
    }



}
