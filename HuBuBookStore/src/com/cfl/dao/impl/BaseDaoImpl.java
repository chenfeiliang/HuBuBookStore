package com.cfl.dao.impl;

import org.hibernate.query.Query;
import org.hibernate.Session;

import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.xml.transform.Transformer;
import java.io.Serializable;
import java.util.List;

@Service
public class BaseDaoImpl
{
    private HibernateTemplate hibernateTemplate;

    protected Session getSession(){

        if (hibernateTemplate==null) System.out.println("hibernate is null");
        Session session = hibernateTemplate.getSessionFactory().getCurrentSession();

        return session;
    }

    public Query findByHql(String hql, Object... params) {

        Query query = this.getSession().createQuery(hql);

        if (params != null) {
            for (int i = 0; i < params.length; i++) {
                query.setParameter(i, params[i]);
            }
        }
        return query;
    }

    public <T> boolean update (T t){

        boolean flag = false;

        if (t!=null){
            this.hibernateTemplate.update(t);
            flag = true;
        }
        return flag;
    }

    public <T> boolean delete (T t){

        boolean flag = false;

        if (t!=null){
            this.hibernateTemplate.delete(t);
            flag = true;
        }
        return flag;
    }

    public <T> boolean save (T t){

        boolean flag = false;

        if (t!=null){
            this.hibernateTemplate.save(t);
            flag = true;
        }
        return flag;
    }

    public <T> T findByPk(Class<T> cla , Serializable pk){
        T t =  this.hibernateTemplate.get(cla,pk);
        return t;
    }

    public HibernateTemplate getHibernateTemplate() {
        return hibernateTemplate;
    }

    @Resource
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }
}
