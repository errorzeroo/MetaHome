package com.metafinal.home.service;

import com.metafinal.home.domain.HomeDTO;
import com.metafinal.home.mapper.HomeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class HomeServiceImpl implements HomeService{

    private final HomeMapper homeMapper;

    @Override
    public List<HomeDTO> getHomeList(String address) {
        return homeMapper.getHomeList(address);
    }
}
