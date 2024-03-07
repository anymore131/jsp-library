<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/3/4
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .first-form{
        width: 75vw;
        height: 85vh;
        background-color: #fff5;
        box-shadow: 0 8px 16px #0005;
        border-radius: 16px;
        overflow: hidden;
    }
    .first-form-imgbox{
        box-shadow: 0 8px 16px #0005;
        width: 30vw;
        margin: 2.5vh 22.5vw;
        aspect-ratio: 16 / 9;
        position: relative;
        text-align: center;
    }
    .first-form-img-box{
        list-style: none;
    }
    .first-form-img-side{
        width: 30vw;
        aspect-ratio: 16 / 9;
        margin: 0 auto;
    }
    .first-form-img1{
        display: block;
    }
    .first-form-img2,.first-form-img3,.first-form-img4,.first-form-img5{
        display: none;
    }
    #first-form-prev{
        width: 4vw;
        height: 4vw;
        position: absolute;
        top: 7vw;
        left: 0;
        z-index: 1000;
        opacity: 0.2;
    }
    #first-form-next{
        width: 4vw;
        height: 4vw;
        position: absolute;
        top: 7vw;
        right: 0;
        z-index: 1000;
        opacity: 0.2;
    }
    .first-form-img{
        width: 4vw;
        height: 4vw;
    }
    #first-form-prev:hover,#first-form-next:hover{
        opacity: 0.7;
    }
    .first-form-left{
        margin: 2.5vh 2.5vw;
        width: 30vw;
        height: 44vh;
        float: left;
        box-shadow: 0 8px 16px #0005;
    }
    .first-form-left h4{
        margin-top: 1vh;
        padding-left: 1vw;
        line-height: 2vh;
        padding-bottom: 2vh;
        color: #2c2c2c;
    }
    .first-form-table{
        width: 100%;
    }
    .first-form-table , .first-form-table td{
        border-collapse: collapse;
        padding: 2vh 2vw;
        text-align: left;
    }
    .first-form-table td{
        line-height: 1vh;
    }
    .first-form-right{
        margin: 2.5vh 2.5vw;
        width: 30vw;
        height: 44vh;
        float: right;
        box-shadow: 0 8px 16px #0005;
    }
    .first-form-right h4{
        margin-top: 1vh;
        line-height: 2vh;
        padding-left: 1vw;
        padding-bottom: 2vh;
        color: #2c2c2c;
    }
    .first-form-right-sen{
        width: 30vw;
        height: 34vh;
        overflow:hidden;
        position:relative;
        display:table-cell;
        text-align:center;
        vertical-align:middle;
    }
    .first-form-right-sen p{
        margin: 0 5vw;
    }
</style>
<body>
<div class="first-form">
    <div class="first-form-imgbox">
        <div id="first-form-prev"><img class="first-form-img" src="img/left.png" alt=""></div>
        <div id="first-form-next"><img class="first-form-img" src="img/right.png" alt=""></div>
        <ul class="first-form-img-box">
            <li><img src="img/1.jpg" alt="" class="first-form-img1 first-form-img-side"></li>
            <li><img src="img/2.jpg" alt="" class="first-form-img2 first-form-img-side"></li>
            <li><img src="img/1.jpg" alt="" class="first-form-img3 first-form-img-side"></li>
            <li><img src="img/2.jpg" alt="" class="first-form-img4 first-form-img-side"></li>
            <li><img src="img/1.jpg" alt="" class="first-form-img5 first-form-img-side"></li>
        </ul>
    </div>
    <div class="first-form-left">
        <h4>今日推荐</h4>
        <table class="first-form-table">
            <%

                String tj = null;
                Vector<String> tjs = new Vector<>();
                try {
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
                    stmt = conn.createStatement();
                    sql = "select * from tjbooks";
                    rs = stmt.executeQuery(sql);
                    while (rs.next()){
                        tj = rs.getString(2);
                        tjs.add(tj);
                    }
                    for (int i = 0; i < 6; i++) {
                        int index = i + 1;
                        out.print("<tr>");
                        out.print("<td>" + index + "</td>");
                        out.print("<td>" + tjs.get(i) + "</td>");
                        out.print("</tr>");
                    }
                } catch (Exception e) {
                    throw new RuntimeException(e);
                } finally {
                    try {
                        if (rs != null) {
                            rs.close();
                        }
                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                }
            %>
        </table>
    </div>
    <div class="first-form-right">
        <h4>每日一句</h4>
        <div class="first-form-right-sen">
            <%

                String sen = null;
                Vector<String> sens = new Vector<>();
                try {
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8", "root", "0408");
                    stmt = conn.createStatement();
                    sql = "select * from mrsentence";
                    rs = stmt.executeQuery(sql);
                    while (rs.next()){
                        if (rs.getInt(1) == 1){
                            sen = rs.getString(2);
                            sens.add(sen);
                        }
                    }
                    out.print("<p>" + sens.get((int)(sens.size()*Math.random()) + 1) + "</p>");
                } catch (Exception e) {
                    throw new RuntimeException(e);
                } finally {
                    try {
                        if (rs != null) {
                            rs.close();
                        }
                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                }
            %>
        </div>
    </div>
</div>

</body>
<script>
    var index = 0;
    var imgEle = document.getElementsByClassName('first-form-img-side')
    var divprev = document.getElementById("first-form-prev");
    var divnext = document.getElementById("first-form-next");

    function autoChangeImg(){
        if (index < 4){
            index++
        }else{
            index = 0;
        }
        changeImg();
    }
    var changel = setInterval(autoChangeImg,3000);

    function changeImg(){
        for (var i = 0; i < 5; i++) {
            if (index === i){
                imgEle[i].style.display = "block";
            }else{
                imgEle[i].style.display = "none";
            }
        }
    }

    divprev.onclick = function (){
        clearInterval(changel);
        if (index > 0){
            index--
        }else{
            index = 4;
        }
        changeImg();
    }
    divnext.onclick = function (){
        clearInterval(changel);
        if (index < 4){
            index++
        }else{
            index = 0;
        }
        changeImg();
    }
    divprev.onmouseover = function (){
        clearInterval(changel);
    }
    divnext.onmouseover = function (){
        clearInterval(changel);
    }
    divprev.onmouseout = function() {
        changel = setInterval(autoChangeImg, 3000);
    }
    divnext.onmouseout = function() {
        changel = setInterval(autoChangeImg, 3000);
    }
</script>