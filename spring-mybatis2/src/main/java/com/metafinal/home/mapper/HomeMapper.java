package com.metafinal.home.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface HomeMapper {
    List<Map<String, Object>> getAllHomes(); // 전체 데이터 반환
    List<Map<String, Object>> getHomeList(@Param("address") String address); // 조건에 맞는 데이터 반환
}
