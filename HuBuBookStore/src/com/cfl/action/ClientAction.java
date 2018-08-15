package com.cfl.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.cfl.dao.BookDao;
import com.cfl.service.*;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.cfl.domain.Book;
import com.cfl.domain.Category;
import com.cfl.domain.OrderInfo;
import com.cfl.domain.OrderItem;
import com.cfl.domain.Page;
import com.cfl.domain.User;
import com.cfl.dto.OrderInfoDTO;
import com.cfl.dto.UserDTO;
import com.cfl.service.impl.BookServiceImpl;
import com.cfl.service.impl.CategoryServiceImpl;
import com.cfl.service.impl.OrderInfoServiceImpl;
import com.cfl.service.impl.OrderItemServiceImpl;
import com.cfl.service.impl.PageServiceImpl_Book;
import com.cfl.service.impl.PageServiceImpl_OrderInfo;
import com.cfl.service.impl.UserServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component("clientAction")
public class ClientAction extends ActionSupport implements ModelDriven<UserDTO>,SessionAware{

    //book的id属性    可在加入购物车时用
    private String bid;


    //BookService 可用于主页  找出所有的书籍
    private BookService bs ;

    //categorys 可用于主页 返回所有的分类
    private List<Category> categorys;

    //分类id  可用于主页 找出对应分类的书籍
    private String cid;

    //当前页
    private String cp ;

    //CategoryService 可用于主页 找出所有的分类
    private CategoryService cs ;

    //返回操作错误信息
    private String errorInfo;

    //设置相应的路径
    private String goToUrl;

    //OrderItemService
    private OrderItemService oim ;

    //OrderInfoService
    private OrderInfoService ois ;

    //为了加入书籍名 新建OrderInfoDTO传输类
    private List<OrderInfoDTO> orderInfoDTOs ;

    //订单id
    private String orderInfoId ;

    //订单集合  可在订单模块用
    private List<OrderInfo> orderInfos ;

    //分页对象
    private Page page;


    //封装Book分页服务
    private PageService psb ;

    //封装OrderInfo分页服务
    private PageService pso ;

    //可在购物车 订单时用  灵活操作对应的记录
    private String i;

    //request对象  与i连用 灵活操作对应的记录
    HttpServletRequest request ;//= ServletActionContext.getRequest()

    //session对象 记录登录用户
    private Map<String,Object> session;

    //statusId  表示订单状态
    private int statusId;

    //UserService  可在注册，登录时用
    private UserService us ;

    //UserDTO 为了加入passWordAgain 引入UserDTO传输类
    private UserDTO userDTO = new UserDTO();

    /*
     *
     * OrderInfo 为 订单包含 加入购物车的 还有 确定生成订单的   status为 0  为 购物车状态     1 为未结算状态   2 为已结算状态
     * OrderItem 为 只有确定生成的订单   状态 1 与  2
     * */

    //添加订单信息
    public String addOrderInfo(){

        request = ServletActionContext.getRequest();

        //获取对应订单购买的书籍数量
        int bookNum = Integer.parseInt(request.getParameter("bookNum" + i));

        //获取对应订单id
        String oId = request.getParameter("orderId" + i);

        OrderInfo oif = new OrderInfo();

        OrderItem oit = new OrderItem();

        //添加OrderInfo属性
        oif.setId(oId);
        oif.setStatus(1);

        //添加OrderItem属性
        oit.setOrderInfo(oif);
        oit.setNum(bookNum);
        oit.setCreateTime(new Timestamp(System.currentTimeMillis()));

        //修改OrderInfo
        ois.updateOrderInfoStatusById(oif);

        //修改OrderItem
        oim.updateOrderItemByOrderInfoId(oit);

        return SUCCESS;
    }

    //加入购物车
    public String addShopCart(){

        //判断用户是否登录  未登录则直接跳转到登录界面
        Object userId = session.get("userId");

        if(userId==null)
        {
            errorInfo = "尚未登录，请先登录";
            return ERROR;
        }
        else{

            //已经登录  则获取对应用户id
            String uid = String.valueOf(userId);

            /**插入orderInfo表**/
            OrderInfo orderInfo = new OrderInfo();

            //订单号前24为UUID 后8为当前的年月日
            Date date = new Date();
            SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
            String df = format1.format(date);

            String orderId = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 24)+df;

            //数量
            int num = 1;

            //状态
            int status = 0;

            //找出书籍的价格
            Book book = bs.findBookById(bid);

            float price = book.getPrice();

            //设置属性
            orderInfo.setNum(num);

            orderInfo.setOrderId(orderId);

            orderInfo.setPrice(price);

            orderInfo.setStatus(status);

            Timestamp t = new Timestamp(System.currentTimeMillis());

            orderInfo.setCreateTime(t);

            //设置关联
            User user = new User();
            user.setId(uid);
            orderInfo.setUser(user);

            Book b = new Book();
            b.setId(bid);
            orderInfo.setBook(b);

            //加入购物车 状态status为0
            ois.addOrderInfo(orderInfo);

            System.out.println("成功加入OrderInfo   " +"     orderId : " + orderId);

            ///**插入orderItem表**/

            OrderItem orderItem = new OrderItem();

            //设置关联
            orderItem.setBook(book);

            orderItem.setOrderInfo(orderInfo);

            //设置属性

            orderItem.setNum(num);

            orderItem.setPrice(price);

            oim.addOrderItem(orderItem);

            System.out.println("成功加入OrderItem    ");

            // goToUrl = "Client_shopCart";

        }
        return SUCCESS;
    }

    //删除订单
    public String delOrderInfo(){
        ois.delOrderInfoById(orderInfoId);
        System.out.println("del SUCCESS : ");
        return SUCCESS;
    }

    //从购物车清除
    public String delShopCart(){
        ois.delOrderInfoById(orderInfoId);
        return SUCCESS;
    }

    //注销
    public String exit(){
        session.clear();
        goToUrl = "loginInput.jsp";
        return SUCCESS;
    }

    public String getBid() {
        return bid;
    }

    public List<Category> getCategorys() {
        return categorys;
    }

    public String getCid() {
        return cid;
    }

    public String getCp() {
        return cp;
    }

    public String getErrorInfo() {
        return errorInfo;
    }

    public String getGoToUrl() {
        return goToUrl;
    }

    public String getI() {
        return i;
    }

    @Override
    public UserDTO getModel() {
        return userDTO;
    }

    public List<OrderInfoDTO> getOrderInfoDTOs() {
        return orderInfoDTOs;
    }

    public String getOrderInfoId() {
        return orderInfoId;
    }

    public List<OrderInfo> getOrderInfos() {
        return orderInfos;
    }

    public Page getPage() {
        return page;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    public int getStatusId() {
        return statusId;
    }

    public UserDTO getUserDTO() {
        return userDTO;
    }

    //列出所有书籍
    public String list(){

        //当前页
        int pageNow = 1;

        //页大小
        int pageSize = 4;

        //路径
        String url = "front/index?cp=";

        if(cp!=null)
        {
            pageNow = Integer.parseInt(cp);

            if(pageNow<1)
            {
                pageNow = 1;
            }

            if(pageNow>psb.getPageCount(pageSize, psb.getRowCount()))
            {
                pageNow = psb.getPageCount(pageSize, psb.getRowCount());
            }
        }

        //页对象
        page = psb.getPage(pageNow, pageSize, url);

        //返回所有分类
        categorys = cs.findAllCategorys();

        return SUCCESS;
    }

    //登录  使用 implements ModelDriven<UserDTO>  的方法获取数据
    public String login(){
        User user = us.findUserByName(userDTO.getUserName());

        //验证账号
        if(user==null)
        {
            //错误则返回登录页面
            goToUrl = "loginInput.jsp";
            errorInfo = "账号错误";
            System.out.println("账号错误");
            return ERROR;
        }
        else
        {
            //验证密码
            if(user.getPassWord().equals(userDTO.getPassWord()))
            {
                //正确则保存user  的id  和 name

                goToUrl = "index";

                session.put("user", user.getUserName());

                session.put("userId", user.getId());

                return "toAction";
            }
            else
            {
                //错误则返回登录页面
                goToUrl = "loginInput.jsp";
                errorInfo = "密码错误";
                return ERROR;
            }
        }
    }

    //跳转到登录页
    public String loginInput(){
        return INPUT;
    }

    //结算操作
    public String payOrderInfo(){

        request = ServletActionContext.getRequest();

        //获取结算订单id
        String oId = request.getParameter("orderId"+i);

        System.out.println("oId:"+ oId);

        //设置OrderInfo  id  和   Status
        OrderInfo oif = new OrderInfo();

        oif.setId(oId);
        oif.setStatus(2);

        ois.updateOrderInfoStatusById(oif);

        return SUCCESS;
    }

    //注册  使用 implements ModelDriven<UserDTO>  的方法获取数据  注册成功则跳转登录页
    public String register(){
        User user = new User();
        user.setUserName(userDTO.getUserName());
        user.setPassWord(userDTO.getPassWord());
        user.setEmail(userDTO.getEmail());
        user.setCellPhone(userDTO.getCellPhone());
        user.setMobilePhone(userDTO.getMobilePhone());
        user.setAddress(userDTO.getAddress());
        us.addUser(user);
        errorInfo = "注册成功，请登录";
        goToUrl = "loginInput.jsp";
        return SUCCESS;
    }

    //跳转到注册页
    public String registerInput(){
        return INPUT;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }



    public void setCategorys(List<Category> categorys) {
        this.categorys = categorys;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public void setCp(String cp) {
        this.cp = cp;
    }

    public void setErrorInfo(String errorInfo) {
        this.errorInfo = errorInfo;
    }

    public void setGoToUrl(String goToUrl) {
        this.goToUrl = goToUrl;
    }

    public void setI(String i) {
        this.i = i;
    }

    public void setOrderInfoDTOs(List<OrderInfoDTO> orderInfoDTOs) {
        this.orderInfoDTOs = orderInfoDTOs;
    }

    public void setOrderInfoId(String orderInfoId) {
        this.orderInfoId = orderInfoId;
    }

    public void setOrderInfos(List<OrderInfo> orderInfos) {
        this.orderInfos = orderInfos;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = 	session;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public void setUserDTO(UserDTO userDTO) {
        this.userDTO = userDTO;
    }

    //在主页按类型找书籍
    public  String showByCategory(){

        int pageNow = 1;

        int pageSize = 2;

        String url = "front/Client_showByCategory?cid="+cid+"&cp=";

        if(cp!=null)
        {
            pageNow = Integer.parseInt(cp);

            if(pageNow<1)
            {
                pageNow = 1;
            }

            if(pageNow> psb.getPageCount(pageSize, psb.getRowCountByCategoryId(cid))  )
            {
                pageNow = psb.getPageCount(pageSize, psb.getRowCountByCategoryId(cid));
            }
        }

        page = psb.getPage(pageNow, pageSize, url, cid);

        System.out.println("pageRecord:"+page.getRecords().size()+"    getPageCount()"+page.getPageCount());

        categorys = cs.findAllCategorys();

        return SUCCESS;
    }

    //列出该用户所有订单
    public String showOrderInfo(){

        int pageNow = 1;

        int pageSize = 6;

        String url = "front/Client_showOrderInfo?cp=";

        Object userId = session.get("userId");

        if(userId==null)
        {
            errorInfo = "尚未登录，请先登录";
            return ERROR;
        }

        else{

            String user_id = String.valueOf(userId);

            if(cp!=null)
            {
                pageNow = Integer.parseInt(cp);

                if(pageNow<1)
                {
                    pageNow = 1;
                }

                if(pageNow>pso.getPageCount(pageSize, pso.getRowCount(user_id)))
                {
                    pageNow = pso.getPageCount(pageSize, pso.getRowCount(user_id));
                }
            }

            page = pso.getPage(pageNow, pageSize, url, user_id);
        }
        return INPUT;

    }
    //列出所有已经结算的订单
    public String showPaidOrderInfo(){

        int pageNow = 1;

        int pageSize = 6;

        statusId = 2;

        String url = "front/Client_showPaidOrderInfo?cp=";

        Object userId = session.get("userId");

        if(userId==null)
        {
            errorInfo = "尚未登录，请先登录";
            return ERROR;
        }

        else{

            String user_id = String.valueOf(userId);

            if(cp!=null)
            {
                pageNow = Integer.parseInt(cp);

                if(pageNow<1)
                {
                    pageNow = 1;
                }

                if(pageNow>pso.getPageCount(pageSize,pso.getRowCountByStatusId(statusId, user_id)))
                {
                    pageNow = pso.getPageCount(pageSize,pso.getRowCountByStatusId(statusId, user_id));
                }
            }

            page = pso.getPage(pageNow, pageSize, url, user_id, statusId);
        }
        return INPUT;

    }

    //列出加入购物车的物品
    public String showShopCart(){

        int currentPage = 1;

        int pageSize = 6;

        statusId = 0;

        String url = "front/Client_showShopCart?statusId=0&cp=";

        Object userId = session.get("userId");

        if(userId==null)
        {
            errorInfo = "尚未登录，请先登录";
            return ERROR;
        }

        String user_id =String.valueOf(userId) ;

        if(cp!=null)
        {
            currentPage = Integer.parseInt(cp);

            if(currentPage<1)
            {
                currentPage = 1;
            }

            if(currentPage>pso.getPageCount(pageSize, pso.getRowCountByStatusId(0, user_id))){
                currentPage = pso.getPageCount(pageSize,pso.getRowCountByStatusId(0, user_id));
            }
        }

        page =  pso.getPage(currentPage, pageSize, url, user_id, statusId);

        return INPUT;
    }

    //列出所有未结算订单
    public String showUnPaidOrderInfo(){

        int pageNow = 1;

        int pageSize = 6;

        statusId = 1;

        String url = "front/Client_showPaidOrderInfo?cp=";

        Object userId = session.get("userId");

        if(userId==null)
        {
            errorInfo = "尚未登录，请先登录";;
            return ERROR;
        }

        else{

            String user_id = String.valueOf(userId);

            if(cp!=null)
            {
                pageNow = Integer.parseInt(cp);

                if(pageNow<1)
                {
                    pageNow = 1;
                }

                if(pageNow>pso.getPageCount(pageSize,pso.getRowCountByStatusId(statusId, user_id)))
                {
                    pageNow = pso.getPageCount(pageSize,pso.getRowCountByStatusId(statusId, user_id));
                }
            }

            page = pso.getPage(pageNow, pageSize, url, user_id, statusId);
        }
        return INPUT;

    }

    //更改购物车信息
    public String updateShopCart(){
        request = ServletActionContext.getRequest();

        //获取对应物品更改后的数量
        int bookNum =  Integer.parseInt(String.valueOf(request.getParameter("bookNum"+i)));

        System.out.println(bookNum);

        //获取对应订单id
        String oId = request.getParameter("orderId" + i);

        System.out.println(oId);

        //设置 OrderInfo 属性
        OrderInfo oif = new OrderInfo();

        oif.setNum(bookNum);

        oif.setId(oId);

        //更改OrderInfo
        ois.updateOrderInoNumById(oif);

        return SUCCESS;
    }

    public PageService getPsb() {
        return psb;
    }

    @Resource(name = "pageServiceImpl_Book")
    public void setPsb(PageService psb) {
        this.psb = psb;
    }

    public BookService getBs() {
        return bs;
    }

    @Autowired
    public void setBs(BookService bs) {
        this.bs = bs;
    }

    public CategoryService getCs() {
        return cs;
    }

    @Resource(name = "categoryService")
    public void setCs(CategoryService cs) {
        this.cs = cs;
    }


    public OrderItemService getOim() {
        return oim;
    }

    @Autowired
    public void setOim(OrderItemService oim) {
        this.oim = oim;
    }

    public OrderInfoService getOis() {
        return ois;
    }

    @Autowired
    public void setOis(OrderInfoService ois) {
        this.ois = ois;
    }

    public PageService getPso() {
        return pso;
    }

    @Resource(name = "pageServiceImpl_OrderInfo")
    public void setPso(PageService pso) {
        this.pso = pso;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public UserService getUs() {
        return us;
    }

    @Autowired
    public void setUs(UserService us) {
        this.us = us;
    }


}
