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
    List<Map<String, Object>> getBusList();
    List<Map<String, Object>> getHospList();
    List<Map<String, Object>> getParkList();
    List<Map<String, Object>> getElemList();
    List<Map<String, Object>> getMidList();
    List<Map<String, Object>> getHighList();
    List<Map<String, Object>> getParkingList();
    List<Map<String, Object>> findByAddress(String address);
    List<Map<String, Object>> getAllHomesRecr(String recruit);
    List<Map<String, Object>> getHomeAreaRecr(String address, String recruit);
    List<Map<String, Object>> getHomeKindRecr(String homeKind, String recruit);
    List<Map<String, Object>> getMyHomeRecr(String address, String homeKind, String recruit);
    List<Map<String, Object>> findSeoul();
    List<Map<String, Object>> findkind();
    List<Map<String, Object>> findY();
}
