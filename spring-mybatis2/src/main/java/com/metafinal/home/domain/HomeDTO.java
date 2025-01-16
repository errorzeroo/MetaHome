package com.metafinal.home.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HomeDTO {

    private String address;          // 주소
    private String parkName;         // 공원 이름
    private int parkDist;            // 공원까지 거리
    private String hosName;          // 병원 이름
    private int hosDist;             // 병원까지 거리
    private String subName;          // 지하철역 이름
    private int subDist;             // 지하철역까지 거리
    private String busName;          // 버스정류장 이름
    private int busDist;             // 버스정류장까지 거리
    private String parkingName;      // 주차장 이름
    private int parkingDist;         // 주차장까지 거리
    private String lowName;          // 초등학교 이름
    private int lowDist;             // 초등학교까지 거리
    private String midName;          // 중학교 이름
    private int midDist;             // 중학교까지 거리
    private String hiName;           // 고등학교 이름
    private int hiDist;              // 고등학교까지 거리
    private String cfName;           // 카페 이름
    private int cfDist;              // 카페까지 거리
    private String conveName;        // 편의점 이름
    private int conveDist;           // 편의점까지 거리
    private String artName;          // 미술관 이름
    private int artDist;             // 미술관까지 거리
}
