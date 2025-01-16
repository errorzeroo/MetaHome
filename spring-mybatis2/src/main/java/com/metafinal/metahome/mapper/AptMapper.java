package com.metafinal.metahome.mapper;

import com.metafinal.metahome.domain.AptDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AptMapper {
    // ��� ����Ʈ ���� �������� test �ڵ�
    List<AptDTO> getAllApt(String aptName);

    // ���� �ִ� ����Ʈ ����Ʈ ��ȸ
    List<AptDTO> getAptGu(@Param("gu") String gu);

}
