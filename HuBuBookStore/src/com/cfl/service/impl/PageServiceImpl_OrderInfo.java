package com.cfl.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.cfl.dao.BookDao;
import com.cfl.dao.OrderInfoDao;
import com.cfl.domain.Book;
import com.cfl.domain.OrderInfo;
import com.cfl.domain.Page;
import com.cfl.domain.User;
import com.cfl.dto.OrderInfoDTO;
import com.cfl.service.PageService;
import com.cfl.util.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PageServiceImpl_OrderInfo implements PageService {
	
	private BookDao bd;

    private OrderInfoDao odao ;

    public int getRowCount(String user_id) {
        return (int) odao.findTotalRecordCounts(user_id);
    }
 
    public int getRowCountByStatusId(int statusId,String user_id) {
        return (int) odao.findTotalRecordCountsByStatus(statusId, user_id);
    }

    @Override
    public int getPageCount(int pageSize, int rowCount) {
        return (rowCount - 1) / pageSize + 1;
    }

    public List getPageRecords(int pageNow, int pageSize,String user_id) {
        
    	List<OrderInfo> orderInfos = new ArrayList <OrderInfo>();

        List<OrderInfoDTO>odts = new ArrayList<OrderInfoDTO>();
        
        orderInfos= odao.findPageOrderInfos(pageNow, pageSize, user_id);

        OrderInfoDTO odt ;
        
        Book book = null;

        for (int i = 0; i < orderInfos.size(); i++) {

            odt = new OrderInfoDTO();

            odt.setId(orderInfos.get(i).getId());
            odt.setCreateTime(orderInfos.get(i).getCreateTime());
            odt.setNum(orderInfos.get(i).getNum());
            odt.setOrderId(orderInfos.get(i).getOrderId());
            odt.setPrice(orderInfos.get(i).getPrice());
            odt.setStatus(orderInfos.get(i).getStatus());

            book = new Book();
            book = orderInfos.get(i).getBook();

            String bookName = book.getName().toString();
            bookName = CommonUtil.stringFormat(bookName, 16);
            odt.setBookName(bookName);
            odt.setBook(book);

            User user = new User();
            user.setId(user_id);
            odt.setUser(user);

            odts.add(odt);
        }
        
        return odts;
    }

    
    public List getPageRecords(int pageNow, int pageSize, int statusId,String user_id) {
        
    	List<OrderInfo> orderInfos = new ArrayList <OrderInfo>();
        
        orderInfos= odao.findPageOrderInfosByStatus(pageNow, pageSize, statusId, user_id);

        List<OrderInfoDTO>odts = new ArrayList<OrderInfoDTO>();

        OrderInfoDTO odt ;

        Book book = null;

        for (int i = 0; i < orderInfos.size(); i++) {
            
        	odt = new OrderInfoDTO();
            
            odt.setId(orderInfos.get(i).getId());
            odt.setCreateTime(orderInfos.get(i).getCreateTime());
            odt.setNum(orderInfos.get(i).getNum());
            odt.setOrderId(orderInfos.get(i).getOrderId());
            odt.setPrice(orderInfos.get(i).getPrice());
            odt.setStatus(orderInfos.get(i).getStatus());

            book = orderInfos.get(i).getBook();
            String bookName = book.getName().toString();
            bookName = CommonUtil.stringFormat(bookName, 16);
            odt.setBookName(bookName);
            odt.setBook(book);

            User user = new User();
            user.setId(user_id);
            odt.setUser(user);
            
            odts.add(odt);
		}

        return odts;
    }

   
    public Page getPage(int pageNow, int pageSize, String url,String user_id) {
        Page page = new Page();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);
        page.setRowCount(this.getRowCount(user_id));
        page.setPageCount(this.getPageCount(pageSize, this.getRowCount(user_id)));
        page.setRecords(this.getPageRecords(pageNow, pageSize, user_id));
        page.setUrl(url);
        return page;
    }

    @Override
    public int getRowCountByCategoryId(String var1) {
        return 0;
    }

    @Override
    public List getPageRecordsByCategoryId(int pageNow, int pageSize, String categoryId) {
        return null;
    }


    public Page getPage(int pageNow, int pageSize, String url, String user_id,int statusId) {
        Page page = new Page();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);
        page.setRowCount(this.getRowCountByStatusId(statusId, user_id));
        page.setPageCount(this.getPageCount(pageSize, this.getRowCountByStatusId(statusId, user_id)));
        page.setRecords(this.getPageRecords(pageNow, pageSize, statusId, user_id));
        page.setUrl(url);
        return page;
    }

	@Override
	public int getRowCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List getPageRecords(int var1, int var2) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page getPage(int var1, int var2, String var3) {
		// TODO Auto-generated method stub
		return null;
	}

    public OrderInfoDao getOdao() {
        return odao;
    }

    @Autowired
    public void setOdao(OrderInfoDao odao) {
        this.odao = odao;
    }

    public BookDao getBd() {
        return bd;
    }

    @Autowired
    public void setBd(BookDao bd) {
        this.bd = bd;
    }
}
