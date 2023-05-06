package com.dong.mapper;

import com.dong.pojo.Menu;
import com.dong.pojo.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {

    List<Menu> selectMenuByRole(Integer id);

    List<Role> selectAllRole();

    Role selectRoleById(Integer id);

    List<Integer> selectMenuIdById(Integer id);

    void saveRoleAndMenuId(@Param("id") Integer id,@Param("menuId") Integer menuId);

    void saveRole(Role role);

    void updateRole(Role role);

    void deleteRole(Integer id);

    void deleteMenuId(Integer id);

}
