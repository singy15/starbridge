package mybatisSample.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import mybatisSample.entity.MUser;

public interface MUserMapper {
    List<MUser> selectAll();

    MUser selectByCd(@Param("cd") String cd);
}
