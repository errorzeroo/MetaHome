package com.metafinal.home.service;

import com.metafinal.home.domain.HomeDTO;

import java.util.List;
import java.util.Map;

public interface HomeService {

    List<Map<String, Object>> getHomeList(String address);

}
