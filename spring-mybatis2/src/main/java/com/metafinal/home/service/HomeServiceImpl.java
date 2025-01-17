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
        // address�� null�̰ų� �� ���ڿ��� ��� ��ü ����Ʈ�� ���������� ó��
        if (address == null || address.trim().isEmpty()){
            return homeMapper.getAllHomes(); // ��ü ����Ʈ�� ��ȯ�ϴ� �޼��� ȣ��
        }
        return homeMapper.getHomeList(address); // ���ǿ� �´� ������ ��ȯ
    }
}
