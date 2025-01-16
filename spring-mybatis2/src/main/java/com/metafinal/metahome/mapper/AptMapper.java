package com.metafinal.metahome.mapper;

import com.metafinal.metahome.domain.AptDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AptMapper {
    List<AptDTO> getAllApt(AptDTO apt);

}
