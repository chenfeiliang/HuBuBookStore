<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'login.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" type="text/css" href="css/login_style.css"/>
    <link rel="stylesheet" type="text/css" href="css/login_animate.css"/>

    <script type="text/javascript" src="js/bf_login.js"></script>
    <script type="text/javascript" src="js/bf_login_jquery.min.js"></script>
    <style type="text/css">
        .passLB {
            margin-left: 10px;
        }

        .submitBT {
            width: 50px;
            height: 50px;
            border-radius: 50px;
        }

        .checkIB {
            margin-left: 10px;
        }

    </style>

</head>

<body>


<canvas id="christmasCanvas" style="top: 0px; left: 0px; z-index: 5000; position: fixed; pointer-events: none;"
        width="1285" height="100%"></canvas>

<script type="text/javascript">
    var snow = function () {
        if (1 == 1) {
            $("body").append('<canvas id="christmasCanvas" style="top: 0px; left: 0px; z-index: 5000; position: fixed; pointer-events: none;"></canvas>');
            var b = document.getElementById("christmasCanvas"), a = b.getContext("2d"), d = window.innerWidth,
                c = window.innerHeight;
            b.width = d;
            b.height = c;
            for (var e = [], b = 0; b < 70; b++) {
                e.push({x: Math.random() * d, y: Math.random() * c, r: Math.random() * 4 + 1, d: Math.random() * 70})
            }
            var h = 0;
            window.intervral4Christmas = setInterval(function () {
                a.clearRect(0, 0, d, c);
                a.fillStyle = "rgba(255, 255, 255, 0.6)";
                a.shadowBlur = 5;
                a.shadowColor = "rgba(255, 255, 255, 0.9)";
                a.beginPath();
                for (var b = 0; b < 70; b++) {
                    var f = e[b];
                    a.moveTo(f.x, f.y);
                    a.arc(f.x, f.y, f.r, 0, Math.PI * 2, !0)
                }
                a.fill();
                h += 0.01;
                for (b = 0; b < 70; b++) {
                    if (f = e[b], f.y += Math.cos(h + f.d) + 1 + f.r / 2, f.x += Math.sin(h) * 2, f.x > d + 5 || f.x < -5 || f.y > c) {
                        e[b] = b % 3 > 0 ? {x: Math.random() * d, y: -10, r: f.r, d: f.d} : Math.sin(h) > 0 ? {
                            x: -5,
                            y: Math.random() * c,
                            r: f.r,
                            d: f.d
                        } : {x: d + 5, y: Math.random() * c, r: f.r, d: f.d}
                    }
                }
            }, 70)
        }
    }
    snow();
</script>

<h2 align="center" style="font-size:40px;letter-spacing: 3px;">HuBuBookStore</h2>

<div class="login_frame"></div>

<div class="LoginWindow">
    <div>
        <form action="front/Client_login" method="post">
            <div class="login" style="margin-top:15px;">
                <div style="float:left;">
                    <p>
                        <span id="idLB">用户名:</span>
                        <input id="idTB" type="text" name="userName">
                    </p>

                    <p>
                        <span id="passLB" class="passLB">密 码 :</span>
                        <input id="passwordTB" type="password" name="passWord"/>
                    </p>
                </div>

                <div style="float:left;margin-left:10px;margin-top:15px;">
                    <input type="submit" id="submitBT" class="submitBT" value="登录" OnClick="submitBT_Click"/>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="timeArea">
    <script type="text/javascript">LoadBlogParts();</script>
</div>

<script type="text/javascript">
    function changeCode() {
        document.getElementById('ibtn_yzm').src = document.getElementById('ibtn_yzm').src + '?';
    }

    $(function () {
        $(".btn").click(function () {
            var left = ($(window).width() * (1 - 0.35)) / 2;//box弹出框距离左边的额距离
            var height = ($(window).height() * (1 - 0.5)) / 2;

            $(".box").addClass("animated bounceIn").show().css({left: left, top: top});
            $(".opacity_bg").css("opacity", "0.3").show();
        });


        $(".colse").click(function () {

            var left = ($(window).width() * (1 - 0.35)) / 2;
            var top = ($(window).height() * (1 - 0.5)) / 2;
            $(".box").show().animate({
                width: "-$(window).width()*0.35",
                height: "-$(window).height()*0.5",
                left: "-" + left + "px",
                top: "-" + top + "px"
            }, 1000, function () {
                var width1 = $(window).width() * 0.35;
                var height1 = $(window).height() * 0.5;
                console.log(width1);
                $(this).css({width: width1, height: height1}).hide();
            });

        });
    });
</script>
<div style="text-align:center;">
    <!--<p>来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>-->
</div>
</body>
</html>
