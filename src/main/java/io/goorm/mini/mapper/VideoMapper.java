package io.goorm.mini.mapper;

import io.goorm.mini.vo.Video;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface VideoMapper {
    List<Video> selectIndex();

}
