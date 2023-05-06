package com.dong.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 分页返回结果集
 * @param <T>
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageResult<T> {
    private int currentPage=1;

    private int pageSize=10;

    private int totalPage;

    private long total=0;

    private List<T> content;

}
