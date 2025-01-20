package com.metafinal.home.service;

import com.metafinal.home.mapper.HomeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class HomeServiceImpl implements HomeService{

    private final HomeMapper homeMapper;

    @Override
    public List<Map<String, Object>> getHomeArea(String address) {
        return homeMapper.getHomeArea(address); // ���ǿ� �´� ������ ��ȯ
    }

    @Override
    public List<Map<String, Object>> getAllHomes() {
        return homeMapper.getAllHomes();
    }

    @Override
    public List<Map<String, Object>> getHomeKind(String homeKind) {
        return homeMapper.getHomeKind(homeKind);
    }

    @Override
    public List<Map<String, Object>> getMyHome(String address, String homeKind) {
        return homeMapper.getMyHome(address, homeKind);
    }


}
