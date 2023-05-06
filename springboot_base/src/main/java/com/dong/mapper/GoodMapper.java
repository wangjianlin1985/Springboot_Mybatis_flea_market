package com.dong.mapper;

import com.dong.pojo.Good;
import com.dong.vo.GoodResult;

import java.util.List;

public interface GoodMapper {
    void saveGood(Good good);

    List<Good> selectGoodsBySid(Integer sid);

    Good selectGoodById(Integer id);

    void updateGood(Good good);

    Integer countGoodBySid(Integer sid);

    GoodResult selectDetailGood(Integer id);

    List<GoodResult> selectPage(String name);

    List<GoodResult> selectList( Integer cid);

    int selectGoodByStatus(Integer status);

    List<GoodResult> selectPages(String name);

    void deleteGood(Integer id);

}
