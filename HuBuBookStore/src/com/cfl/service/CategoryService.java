package com.cfl.service;

import java.util.List;

import com.cfl.domain.Category;

public interface CategoryService {

    public boolean addCategory(Category category);

    public boolean delCategoryById(String id);

    public boolean updateCategory(Category category);

    public Category findCategoryByName(String name);

    public Category findCategoryById(String id);

    public List<Category> findAllCategorys();

    public List<Category> findPageCategorys(int pageNow, int pageSize);

    public int findTotalRecordCounts();

}
