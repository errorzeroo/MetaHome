package com.metafinal.metahome.service;

import com.metafinal.metahome.domain.AptDTO;

import java.util.List;

public interface AptService {
    // apt all info list
    List<AptDTO> getAllApt(String aptName);
    List<AptDTO> getAptGu(String gu);
}
