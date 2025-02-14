package com.metafinal.home.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.metafinal.home.PythonRunner;
import com.metafinal.home.PythonRunner2;
import com.metafinal.home.service.HomeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/home")
public class HomeController {

    private final HomeService homeService;
    private final PythonRunner pythonRunner = new PythonRunner();


    @GetMapping()
    public String getList(Model m, @RequestParam(required = false, defaultValue = "강남구") String address,
                          @RequestParam(required = false, defaultValue = "") String homeKind,
                          @RequestParam(required = false, defaultValue = "N") String recruit) {

        List<Map<String, Object>> validAddresses = homeService.findSeoul();
        List<Map<String, Object>> valhomekind = homeService.findkind();
        // validAddresses에서 "GU" 값만 추출
        List<String> validAddressesOnly = new ArrayList<>();
        for (Map<String, Object> map : validAddresses) {
            if (map != null && map.containsKey("GU")) {
                validAddressesOnly.add((String) map.get("GU")); // "GU" 값 추가
            }
        }

        List<String> valhomekindOnly = new ArrayList<>();
        for (Map<String, Object> map : valhomekind) {
            if (map != null && map.containsKey("H_KIND")) {
                valhomekindOnly.add((String) map.get("H_KIND")); // "GU" 값 추가
            }
        }


        // 검증 로직
        if (!address.isEmpty() && !validAddressesOnly.contains(address)) {
            m.addAttribute("errorMessage", "잘못된 주소 값: " + address);
            return "error";
        }

        if (!homeKind.isEmpty() && !valhomekindOnly.contains(homeKind)) {
            m.addAttribute("errorMessage", "잘못된 주택 유형 값: " + homeKind);
            return "error";
        }

        if (!recruit.equals("Y") && !recruit.equals("N")) {
            m.addAttribute("errorMessage", "잘못된 값: " + recruit);
            return "error";
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
        List<Map<String, Object>> parkingList = homeService.getParkingList();



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
        String parkingListJson = "";

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
            parkingListJson = objectMapper.writeValueAsString(parkingList);
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
        m.addAttribute("parkingListJson", parkingListJson);

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
            model.addAttribute("errorMessage", "Python 실행 중 오류가 발생했습니다.");
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
            model.addAttribute("errorMessage", "JSON 데이터를 처리하는 중 오류가 발생했습니다.");
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
