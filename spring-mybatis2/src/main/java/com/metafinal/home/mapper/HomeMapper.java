package com.metafinal.home.mapper;


import com.metafinal.home.domain.HomeDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HomeMapper {

    List<HomeDTO> getHomeList(String address);
}
