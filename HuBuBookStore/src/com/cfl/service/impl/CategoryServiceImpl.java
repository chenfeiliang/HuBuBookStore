package com.cfl.service.impl;

import java.util.List;

import com.cfl.dao.BookDao;
import com.cfl.dao.CategoryDao;
import com.cfl.dao.impl.BookDaoImpl;
import com.cfl.domain.Category;
import com.cfl.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
    private CategoryDao cd ;

    private BookDao bd = new BookDaoImpl();

    @Override
    public boolean addCategory(Category category) {
        // TODO Auto-generated method stub
        return cd.addCategory(category);
    }

    @Override
    public boolean delCategoryById(String id) {
        bd.delBookByCategoryId(id);
        return cd.delCategoryById(id);
    }

    @Override
    public boolean updateCategory(Category category) {
        return cd.updateCategory(category);

    }

    @Override
    public Category findCategoryByName(String name) {
        // TODO Auto-generated method stub
        return null;
    }


    @Override
    public List<Category> findAllCategorys() {
        // TODO Auto-generated method stub
        return cd.findAllCategorys();
    }

    @Override
    public List<Category> findPageCategorys(int pageNow, int pageSize) {
        // TODO Auto-generated method stub
        return cd.findPageCategorys(pageNow, pageSize);
    }

    @Override
    public int findTotalRecordCounts() {
        // TODO Auto-generated method stub
        return cd.findTotalRecordCounts();
    }

    @Override
    public Category findCategoryById(String id) {
        // TODO Auto-generated method stub
        return cd.findCategoryById(id);
    }

    public CategoryDao getCd() {
        return cd;
    }

    @Autowired
    public void setCd(CategoryDao cd) {
        this.cd = cd;
    }
}
