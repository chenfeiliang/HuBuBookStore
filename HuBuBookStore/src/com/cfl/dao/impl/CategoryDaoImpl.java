
package com.cfl.dao.impl;

import java.util.List;

import com.cfl.dao.CategoryDao;
import com.cfl.domain.Category;
import org.springframework.stereotype.Service;

@Service
public class CategoryDaoImpl extends BaseDaoImpl implements CategoryDao  {

    @Override
    public boolean addCategory(Category category) {
        boolean flag = save(category);
        return flag;
    }

    @Override
    public boolean delCategoryById(String id) {

        Category c = getHibernateTemplate().load(Category.class,id);

        if(c!=null){
            return delete(c);
        }

        return false;
    }

    @Override
    public boolean updateCategory(Category category) {
        Category c = getHibernateTemplate().load(Category.class,category.getId());

        if(c!=null){
            if(c.getName()!=null) c.setName(category.getName());
            if(c.getDescription()!=null) c.setDescription(category.getDescription());
            return update(c);
        }

        return false;
    }

    @Override
    public Category findCategoryById(String id) {
        Category category = (Category) findByHql("from Category as c where c.id = ?",id).uniqueResult();
        if(category!=null){
            return category;
        }
        return null;
    }

    @Override
    public List<Category> findAllCategorys() {
        List list = findByHql("from Category").list();

        return list;

    }

    @Override
    public List<Category> findPageCategorys(int pageNow, int pageSize) {
        List<Category> list = findByHql("from Category").setFirstResult((pageNow - 1) * pageSize).setMaxResults(pageSize).list();

        return list;

    }

    @Override
    public int findTotalRecordCounts() {
        long count = (Long) findByHql("select count(c) from Category as c").uniqueResult();
        return (int)count;
    }
}

