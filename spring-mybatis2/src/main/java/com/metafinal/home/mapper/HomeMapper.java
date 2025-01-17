package com.metafinal.home.mapper;


import com.metafinal.home.domain.HomeDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface HomeMapper {
    List<Map<String, Object>> getAllHomes(); // ��ü ������ ��ȯ
    List<Map<String, Object>> getHomeList(@Param("address") String address); // ���ǿ� �´� ������ ��ȯ
}
