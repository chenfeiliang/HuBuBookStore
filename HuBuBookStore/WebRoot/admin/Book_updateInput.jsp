<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'addBook.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" type="text/css" href="css/categoryInfo.css">


    <style type="text/css">

        #preview {
            width: 260px;
            height: 200px;
            border: 1px solid #000;
            overflow: hidden;
        }

        #imghead {
            filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
        }

    </style>

</head>

<body>
<div>
    <div id="c_center">
        <form action="admin/upload_Book_update" method="post" enctype="multipart/form-data">
            <div class="login">
            	<input type="hidden"  class="userName TB" name="bookId" value = "<s:property value="book.id"/>" />
                <input type="text" class="userName TB" name="name" placeholder="书名" value = "<s:property value="book.name"/>" />
                <br>
                <input type="text" class="TB" name="author" placeholder="作者" value = "<s:property value="book.author"/>" >
                <br>
                <input type="text" class="TB" name="price" placeholder="价格" value = "<s:property value="book.price"/>" >
                <br>
                <div id="preview">
                    <img id="imghead" width=160 height=160 border=0
                         src='<s:property value="book.imageName"/>'>
                </div>
				<input type="hidden" name = "imageName" value="<s:property value="book.imageName"/>"/>
                <input type="file" onchange="previewImage(this)" id="picPath" name="upload" />
                <br>
                <textarea rows="3" cols="36" name='description'><s:property value="book.description"/></textarea>
                <br>	
                <select name='category_id'>
                    <option value=''>请选择分类</option>
                  
                    <s:iterator var="c" value="categorys">
                    	
                        <s:if test="#c.id==book.category_id">
                                 <option  value='<s:property value="#c.id"/>'    selected>   <s:property value="#c.name"/>    </option>             
                        </s:if>
                        <s:else>
                                 <option value='<s:property value="#c.id"/>'><s:property value="#c.name"/></option>
                        </s:else>

                    </s:iterator>
                </select>
                <br>
                <br> <br> <br> <br>
                <input type='reset' value='重置'/><input type='submit' value='更改'/>
            </div>
        </form>
        


    </div>


</div>

<script type="text/javascript">
    function checkPic() {
        var picPath = document.getElementById("picPath").value;
        var type = picPath.substring(picPath.lastIndexOf(".") + 1, picPath.length).toLowerCase();
        if (type != "jpg" && type != "bmp" && type != "gif" && type != "png") {
            alert("请上传正确的图片格式");
            return false;
        }
        return true;
    }

    //图片上传预览    IE是用了滤镜。
    function previewImage(file) {
        if (checkPic()) {
            var MAXWIDTH = 260;
            var MAXHEIGHT = 180;
            var div = document.getElementById('preview');
            if (file.files && file.files[0]) {
                div.innerHTML = '<img id=imghead>';
                var img = document.getElementById('imghead');
                img.onload = function () {
                    var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                    img.width = rect.width;
                    img.height = rect.height;
                    //                 img.style.marginLeft = rect.left+'px';
                    img.style.marginTop = rect.top + 'px';
                }
                var reader = new FileReader();
                reader.onload = function (evt) {
                    img.src = evt.target.result;
                }
                reader.readAsDataURL(file.files[0]);
            }
            else //兼容IE
            {
                var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
                file.select();
                var src = document.selection.createRange().text;
                div.innerHTML = '<img id=imghead>';
                var img = document.getElementById('imghead');
                img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
                div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
            }
        }
    }

    function clacImgZoomParam(maxWidth, maxHeight, width, height) {
        var param = {top: 0, left: 0, width: width, height: height};
        if (width > maxWidth || height > maxHeight) {
            rateWidth = width / maxWidth;
            rateHeight = height / maxHeight;

            if (rateWidth > rateHeight) {
                param.width = maxWidth;
                param.height = Math.round(height / rateWidth);
            } else {
                param.width = Math.round(width / rateHeight);
                param.height = maxHeight;
            }
        }

        param.left = Math.round((maxWidth - param.width) / 2);
        param.top = Math.round((maxHeight - param.height) / 2);
        return param;
    }
</script>

</body>
</html>
