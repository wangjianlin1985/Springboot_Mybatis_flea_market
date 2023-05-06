package com.dong.service;

import com.dong.mapper.RoleMapper;
import com.dong.pojo.Menu;
import com.dong.pojo.Role;
import com.dong.vo.PageResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RoleService {
    @Autowired
    private RoleMapper roleMapper;

    public List<Menu> selectMenuByRole(Integer id) {
        return roleMapper.selectMenuByRole(id);
    }

    public PageResult<Role> selectPage(PageResult pageResult) {
        PageHelper.startPage(pageResult.getCurrentPage(), pageResult.getPageSize());
        List<Role> roles = roleMapper.selectAllRole();
        PageInfo pageInfo = new PageInfo(roles);
        return new PageResult<Role>(pageInfo.getPageNum(), pageInfo.getPageSize(), pageInfo.getPages(), pageInfo.getTotal(), roles);
    }

    public List<Role> selectAllRole() {
        return roleMapper.selectAllRole();
    }

    public Role selectRoleById(Integer id){
        return roleMapper.selectRoleById(id);
    }

    public List<Integer> selectMenuIdById(Integer id){
        return roleMapper.selectMenuIdById(id);
    }

    @Transactional
    public void saveRole(Role role,List<Integer> menuIdList) {
        roleMapper.saveRole(role);
        for(Integer menuId:menuIdList){
            roleMapper.saveRoleAndMenuId(role.getId(), menuId);
        }
    }

    @Transactional
    public void updateRole(Role role,List<Integer> menuIdList) {
        roleMapper.updateRole(role);
        roleMapper.deleteMenuId(role.getId());
        for(Integer menuId:menuIdList){
            roleMapper.saveRoleAndMenuId(role.getId(), menuId);
        }

    }

    @Transactional
    public void deleteRole(Integer id) {
        roleMapper.deleteMenuId(id);
        roleMapper.deleteRole(id);
    }


}
