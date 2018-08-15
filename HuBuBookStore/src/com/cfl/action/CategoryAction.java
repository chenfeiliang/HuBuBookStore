package com.cfl.action;

import java.util.UUID;

import com.cfl.domain.Category;
import com.cfl.domain.Page;
import com.cfl.service.CategoryService;
import com.cfl.service.PageService;
import com.cfl.service.impl.CategoryServiceImpl;
import com.cfl.service.impl.PageServiceImpl_Category;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class CategoryAction extends ActionSupport {

	//Category对象 在更改时用
	private Category category;
	
	//当前页 分页时用
	private String cp;

	//CategoryService
	private CategoryService cs ;

	//Category的属性
	private String description;

	private String id ;

	private String name;
	
	//分页对象
    Page page;

    //封装分页服务
    private PageService psc ;

    //添加分页
    public String add() {
    	
    	//设置Category属性
		Category category = new Category();

		category.setName(name);
		category.setDescription(description);
		
		//添加分类
		cs.addCategory(category);
        return SUCCESS;
    }

    //跳转到添加页面
    public String addInput() {
        return INPUT;
    }

    //删除分类
    public String delete() {
		cs.delCategoryById(id);
        return SUCCESS;
    }

	public Category getCategory() {
		return category;
	}

	public String getCp() {
        return cp;
    }

	public String getDescription() {
		return description;
	}

	public String getId() {
		return id;
	}
    
    public String getName() {
		return name;
	}
    
    public Page getPage() {
        return page;
    }

    //列出所有分类
    public String list() {
    	
    	//当前分页
    	int currentPage = 1;

    	//分页大小
        int pageSize = 4;
        
        //分页的路径
        String url = "admin/Category_list?cp=";
        
        if(cp!=null)
        {
        	currentPage = Integer.parseInt(cp);
        	
        	if(currentPage<1)
        	{
        	   currentPage = 1;	
        	}
        	
        	if(currentPage>psc.getPageCount(pageSize, psc.getRowCount())){
        	   currentPage = psc.getPageCount(pageSize,psc.getRowCount());
        	}    	 
        }
        
        //分页对象
       page =  psc.getPage(currentPage, pageSize, url);
       
        return INPUT;
    }

    public void setCategory(Category category) {
		this.category = category;
	}

    public void setCp(String cp) {
        this.cp = cp;
    }


    public void setDescription(String description) {
		this.description = description;
	}

    public void setId(String id) {
		this.id = id;
	}

    public void setName(String name) {
		this.name = name;
	}

    public void setPage(Page page) {
        this.page = page;
    }

    //更改操作
    public String update() {
		Category category = new Category();
		System.out.println("update : " + id + " " + name);
		category.setId(id);
		category.setName(name);
		category.setDescription(description);
		cs.updateCategory(category);
        return SUCCESS;
    }

    //找出对应id的分类信息  跳转更改页面
    public String updateInput() {
    	category = cs.findCategoryById(id);
        return INPUT ;
    }

    public CategoryService getCs() {
        return cs;
    }

    @Autowired
    public void setCs(CategoryService cs) {
        this.cs = cs;
    }

    public PageService getPsc() {
        return psc;
    }

    @Resource(name = "pageServiceImpl_Category")
    public void setPsc(PageService psc) {
        this.psc = psc;
    }
}

