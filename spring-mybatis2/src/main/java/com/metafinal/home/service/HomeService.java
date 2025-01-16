package com.metafinal.home.service;

import com.metafinal.home.domain.HomeDTO;

import java.util.List;

public interface HomeService {

    List<HomeDTO> getHomeList(String address);

}
