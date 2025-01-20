package com.metafinal.home.service;

import java.util.List;
import java.util.Map;

public interface HomeService {

    List<Map<String, Object>> getHomeArea(String address);
    List<Map<String, Object>> getAllHomes();
    List<Map<String, Object>> getHomeKind(String homeKind);
    List<Map<String, Object>> getMyHome(String address, String homeKind);

}
