package com.dong.service;

import com.dong.mapper.MenuMapper;
import com.dong.pojo.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuService {
    @Autowired
    private MenuMapper menuMapper;

    public List<Menu> selectAllMenu(){
        return  menuMapper.selectAllMenu();
    }

    public void save(Menu menu) {
        menuMapper.save(menu);
    }

    public Menu selectMenuById(Integer id){
        return menuMapper.selectMenuById(id);
    }

    public void deleteMenu(Integer id) {
        menuMapper.deleteMenu(id);
    }

    public void update(Menu menu) {
        menuMapper.updateMenu(menu);
    }

    public  List<Menu> selectMenuByRole(Integer id){
        return menuMapper.selectMenuByRole(id);
    }
}
