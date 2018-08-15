package com.cfl.action;

import java.util.UUID;

import com.cfl.domain.Page;
import com.cfl.domain.User;
import com.cfl.dto.UserDTO;
import com.cfl.service.PageService;
import com.cfl.service.UserService;
import com.cfl.service.impl.PageServiceImpl_User;
import com.cfl.service.impl.UserServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

@Repository
public class UserAction extends ActionSupport implements ModelDriven<User> {

	private String cp;
	
    Page page;
    
    private PageService psu ;

	private UserService us ;

	private User user;
	
	private UserDTO userDTO = new UserDTO();

	//添加用户 使用implements ModelDriven<User> 的方法获取数据
    public String add() {
        User user = new User();
        user.setUserName(userDTO.getUserName());
        user.setPassWord(userDTO.getPassWord());
        user.setEmail(userDTO.getEmail());
        user.setCellPhone(userDTO.getCellPhone());
        user.setMobilePhone(userDTO.getMobilePhone());
        user.setAddress(userDTO.getAddress());
        us.addUser(user);
        return SUCCESS;
    }

    //跳转添加用户界面
    public String addInput() {
        return INPUT;
    }
    
    //删除用户
    public String delete() {
		us.delUserById(userDTO.getId());
        return SUCCESS;
    }

	public String getCp() {
        return cp;
    }

	@Override
	public User getModel() {
		return userDTO;
	}
    
    public Page getPage() {
        return page;
    }
    

    public User getUser() {
		return user;
	}

    //列出所有用户
    public String list() {
    	//当前页面
    	int currentPage = 1;

    	//页面大小
        int pageSize = 4;
        
        //路径
        String url = "admin/User_list?cp=";
        
        if(cp!=null)
        {
        	currentPage = Integer.parseInt(cp);
        	
        	if(currentPage<1)
        	{
        	   currentPage = 1;	
        	}
        	
        	if(currentPage>psu.getPageCount(pageSize, psu.getRowCount())){
        	   currentPage = psu.getPageCount(pageSize,psu.getRowCount());
        	}    	 
        }
      
        //页对象
        page =  psu.getPage(currentPage, pageSize, url);
       
        return INPUT;
    }



    public void setCp(String cp) {
        this.cp = cp;
    }



    public void setPage(Page page) {
        this.page = page;
    }

    public void setUser(User user) {
		this.user = user;
	}

    //更改用户
    public String update() {
        User user = new User();
        user.setId(userDTO.getId());
        user.setUserName(userDTO.getUserName());
        user.setPassWord(userDTO.getPassWord());
        user.setEmail(userDTO.getEmail());
        user.setCellPhone(userDTO.getCellPhone());
        user.setMobilePhone(userDTO.getMobilePhone());
        user.setAddress(userDTO.getAddress());
		us.updateUser(user);
        return SUCCESS;
    }

    //跳转更改用户页面
	public String updateInput() {
    	user = us.findUserById(userDTO.getId());
        return INPUT;
    }

    public PageService getPsu() {
        return psu;
    }

    @Resource(name = "pageServiceImpl_User")
    public void setPsu(PageService psu) {
        this.psu = psu;
    }

    public UserService getUs() {
        return us;
    }

    @Autowired
    public void setUs(UserService us) {
        this.us = us;
    }
}

