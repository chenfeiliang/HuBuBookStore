package com.cfl.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;


import com.cfl.service.PageService;
import org.apache.struts2.ServletActionContext;
import com.cfl.domain.Book;
import com.cfl.domain.Category;
import com.cfl.domain.Page;
import com.cfl.service.BookService;
import com.cfl.service.CategoryService;
import com.cfl.service.impl.BookServiceImpl;
import com.cfl.service.impl.CategoryServiceImpl;
import com.cfl.service.impl.PageServiceImpl_Book;
import com.opensymphony.xwork2.ActionSupport;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class BookAction extends ActionSupport {

    //Book的属性  可在添加书籍时用
    private String bookId;
    private String name;
    private String author;
    private String price;
    private String imageName;
    private String description;
    private String category_id;

    //分类集合  可在添加书籍用
    private List<Category> categorys;

    //Book 对象  在更改书籍时用
    private Book book;

    //Book的Service
    private BookService bs ;

    //当前页  在分页时用
    private String cp;

    // CategoryService  可用于返回所有分类 可在添加时用
    private CategoryService cs ;

    //分页
    private Page page = new Page();

    //封装分页服务
    private PageService psb ;

    //上传时需要的属性

    //获取文件上传的路径
    private String savePath;
    //封装上传文件属性
    private File upload;
    //封装上传文件的类型
    private String uploadContentType;
    //封装上传文件名称
    private String uploadFileName;
    public BookAction() {

    }

    public String add() throws Exception {

        System.out.println("开始添加");
        byte[] buffer=new byte[1024];

        //读取文件
        FileInputStream fis=new FileInputStream(this.upload);
        //保存文件
        FileOutputStream fos=new FileOutputStream(getSavePath()+"\\"+this.getUploadFileName());
        int length=fis.read(buffer);
        while(length>0){
            //每次写入length长度的内容
            fos.write(buffer,0,length);
            length=fis.read(buffer);
        }
        fis.close();
        fos.flush();
        fos.close();

        //设置book属性
        Book book = new Book();
        book.setAuthor(author);
        Category category = new Category();
        category.setId(category_id);
        book.setCategory(category);
        book.setDescription(description);
        book.setImageName("files/"+this.getUploadFileName());
        book.setName(name);
        book.setPrice(Float.parseFloat(price));

        //添加
        bs.addBook(book);
        return SUCCESS;
    }

    //找出所有分类，跳转添加页面
    public String addInput() {
        categorys = cs.findAllCategorys();
        return INPUT;
    }

    //删除书籍
    public String delete() {
        if (bs.delBookById(bookId))
            System.out.println("删除成功");
        else
            System.out.println("删除失败");
        return SUCCESS;
    }

    public String getAuthor() {
        return author;
    }
    public Book getBook() {
        return book;
    }

    public String getBookId() {
        return bookId;
    }

    public String getCategory_id() {
        return category_id;
    }

    public List<Category> getCategorys() {
        return categorys;
    }

    public String getCp() {
        return cp;
    }

    public String getDescription() {
        return description;
    }

    public String getImageName() {
        return imageName;
    }

    public String getName() {
        return name;
    }

    public Page getPage() {
        return page;
    }

    public String getPrice() {
        return price;
    }

    //获取文件上传的保存路径 通过读取存放目录获得保存路径
    public String getSavePath() {
        return ServletActionContext.getServletContext().getRealPath(savePath);
    }

    public File getUpload() {
        return upload;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    //列出所有书籍
    public String list() {

        //当前页
        int currentPage = 1;

        //每页大小
        int pageSize = 4;

        //每页的路径
        String url = "admin/Book_list?cp=";

        if (cp != null) {
            currentPage = Integer.parseInt(cp);

            if (currentPage < 1) {
                currentPage = 1;
            }

            if (currentPage > psb.getPageCount(pageSize, psb.getRowCount())) {
                currentPage = psb.getPageCount(pageSize, psb.getRowCount());
            }
        }

        //返回一个页对象
        page = this.psb.getPage(currentPage, pageSize, url);

        return INPUT;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }


    public void setCategory_id(String category_id) {
        this.category_id = category_id;
    }

    public void setCategorys(List<Category> categorys) {
        this.categorys = categorys;
    }

    public void setCp(String cp) {
        this.cp = cp;
    }


    public void setDescription(String description) {
        this.description = description;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }


    public void setUpload(File upload) {
        this.upload = upload;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    //更改书籍
    public String update() throws IOException {
        //设置book属性
        Book book = new Book();
        String id = bookId;
        book.setAuthor(author);
        Category category = new Category();
        category.setId(category_id);
        book.setCategory(category);
        /*book.setCategory_id(category_id);*/
        book.setDescription(description);
        book.setId(id);
        book.setName(name);
        book.setPrice(Float.parseFloat(price));

        //如果重新上传图片 则读取并保存
        if(this.upload!=null){
            byte[] buffer=new byte[1024];
            //读取文件
            FileInputStream fis=new FileInputStream(this.upload);
            //保存文件
            FileOutputStream fos=new FileOutputStream(getSavePath()+"\\"+this.getUploadFileName());
            int length=fis.read(buffer);
            while(length>0){
                //每次写入length长度的内容
                fos.write(buffer,0,length);
                length=fis.read(buffer);
            }
            fis.close();
            fos.flush();
            fos.close();
            book.setImageName("files/"+this.getUploadFileName());
        }
        //如果没有上传，则设置为为原来的路径
        else{
            book.setImageName(imageName);
        }



        //更改书籍
        bs.updateBook(book);

        return SUCCESS;
    }

    //获取该id对应的书籍信息，跳转到更改页面
    public String updateInput() {
        book = bs.findBookById(bookId);
        categorys = cs.findAllCategorys();
        return INPUT;
    }


    public PageService getPsb() {
        return psb;
    }

    @Resource(name="pageServiceImpl_Book")
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

    @Autowired
    public void setCs(CategoryService cs) {
        this.cs = cs;
    }
}

