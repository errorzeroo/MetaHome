package com.metafinal.home.service;

import com.metafinal.home.domain.HomeDTO;
import com.metafinal.home.mapper.HomeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class HomeServiceImpl implements HomeService{

    private final HomeMapper homeMapper;

    @Override
    public List<Map<String, Object>> getHomeList(String address) {
        // address가 null이거나 빈 문자열일 경우 전체 리스트를 가져오도록 처리
        if (address == null || address.trim().isEmpty()){
            return homeMapper.getAllHomes(); // 전체 리스트를 반환하는 메서드 호출
        }
        return homeMapper.getHomeList(address); // 조건에 맞는 데이터 반환
    }
}
