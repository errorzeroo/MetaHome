package com.metafinal.home.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface HomeMapper {
    List<Map<String, Object>> getAllHomes(); // ��ü ������ ��ȯ
    List<Map<String, Object>> getHomeArea(@Param("address") String address); // ���ǿ� �´� ������ ��ȯ
    List<Map<String, Object>> getHomeKind(@Param("homeKind") String homeKind);
    List<Map<String, Object>> getMyHome(@Param("address") String address, @Param("homeKind") String homeKind);
    List<Map<String, Object>> getSubwayList();
}
