package com.metafinal.metahome.service;

import com.metafinal.metahome.domain.AptDTO;
import com.metafinal.metahome.mapper.AptMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AptServiceImpl implements AptService {
    private AptMapper aptMapper;

    @Override
    public List<AptDTO> getAllApt(String aptName) {
        return aptMapper.getAllApt(aptName);
    }

    @Override
    public List<AptDTO> getAptGu(String gu) {
        return aptMapper.getAptGu(gu);
    }

}
