package com.metafinal.metahome.mapper;

import com.metafinal.metahome.domain.AptDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AptMapper {
    // 모든 아파트 정보 가져오는 test 코드
    List<AptDTO> getAllApt(String aptName);

    // 구에 있는 아파트 리스트 조회
    List<AptDTO> getAptGu(@Param("gu") String gu);

}
