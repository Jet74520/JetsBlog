var userCount;//符合查找条件的用户总页数，分页参考  
var pageIndex = 0;//当前页，默认为0  
var pageSize = 8;//每页显示个数为8  
  
//按条件查找用户  
function searchUser(index,size) {  
    var findTerm = $("#serchTerm").val();  
    var provinceId = $('#province').val();  
    var cityId = $('#city').val();  
    $.ajax({  
        type : "POST",  
        url : "user/findContactsAjax",  
        cache : false,  
        data : {  
            provinceId : provinceId,  
            cityId : cityId,  
            pageIndex:index,  
            pageSize:size  
        },  
        async : true,  
        error : function() {  
            alert("网络异常！");  
        },  
        success : function(data) {  
        userCount=Math.ceil(data[0].userCount/8);
        	var page='<div id="userPage" align="center" ><font size="2">共'  
            +userCount+'页</font> <font size="2">第'  
            +(pageIndex+1)+'页</font> <a href="javascript:void" onclick="GoToFirstPage()" id="aFirstPage" >首页</a> '  
            +'<a href="javascript:void" onclick="GoToPrePage()" id="aPrePage"  >上一页</a>  '  
            +'<a href="javascript:void" onclick="GoToNextPage()" id="aNextPage" >下一页</a>  '  
            +'<a href="javascript:void" onclick="GoToEndPage()" id="aEndPage" >尾页</a>  ';  
            page+='</div>';  
            $("#serchResult").append(page);  
            document.getElementById("dltitle").innerHTML = "查找结果如下";   
        }  
    });  
}  
//首页  
function GoToFirstPage() {  
    pageIndex = 0;  
    searchUser( pageIndex, pageSize);  
}  
//前一页  
function GoToPrePage() {  
    pageIndex -= 1;  
    pageIndex = pageIndex >= 0 ? pageIndex : 0;  
    searchUser( pageIndex, pageSize);  
}  
//后一页  
function GoToNextPage() {  
    if (pageIndex + 1 < userCount) {  
        pageIndex += 1;  
    }  
        searchUser( pageIndex, pageSize);  
}  
//尾页  
function GoToEndPage() {  
    pageIndex = userCount - 1;  
    searchUser( pageIndex, pageSize);  
}