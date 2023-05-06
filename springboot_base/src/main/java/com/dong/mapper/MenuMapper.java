package com.dong.mapper;

import com.dong.pojo.Menu;

import java.util.List;

public interface MenuMapper {

     List<Menu> selectAllMenu();

     List<Menu> selectMenuByRole(Integer id);

    void save(Menu menu);

    Menu selectMenuById(Integer id);

    void deleteMenu(Integer id);

    void updateMenu(Menu menu);
}
