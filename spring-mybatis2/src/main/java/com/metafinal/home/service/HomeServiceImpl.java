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

    @Override
    public List<Map<String, Object>> getSubwayList() {
        return homeMapper.getSubwayList();
    }
    public List<Map<String, Object>> getBusList() {
        return homeMapper.getBusList();
    }
    public List<Map<String, Object>> getHospList() {
        return homeMapper.getHospList();
    }
    public List<Map<String, Object>> getParkList() {
        return homeMapper.getParkList();
    }
    public List<Map<String, Object>> getElemList() {
        return homeMapper.getElemList();
    }
    public List<Map<String, Object>> getMidList() {
        return homeMapper.getMidList();
    }
    public List<Map<String, Object>> getHighList() {
        return homeMapper.getHighList();
    }

    @Override
    public List<Map<String, Object>> findByAddress(String address) {
        return homeMapper.findByAddress(address);
    }

    @Override
    public List<Map<String, Object>> getAllHomesRecr(String recruit) {
        return homeMapper.getAllHomesRecr(recruit);
    }

    @Override
    public List<Map<String, Object>> getHomeAreaRecr(String address, String recruit) {
        return homeMapper.getHomeAreaRecr(address, recruit);
    }

    @Override
    public List<Map<String, Object>> getHomeKindRecr(String homeKind, String recruit) {
        return homeMapper.getHomeKindRecr(homeKind, recruit);
    }

    @Override
    public List<Map<String, Object>> getMyHomeRecr(String address, String homeKind, String recruit) {
        return homeMapper.getMyHomeRecr(address, homeKind, recruit);
    }


}
