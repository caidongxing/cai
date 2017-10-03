<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class='container-fluid'>
<div class='row-fluid' id='content-wrapper'>
     <div class='span12'>
       <div class='page-header'>
	        <h1 class='pull-left'>
             <i class='icon-table'></i>
             <span>房态图</span>
            </h1>
            <div class="pull-right">
              <ul class='breadcrumb'>
                    <li>
                        <a href='${ctx}'><i class='icon-table'></i>
                        </a>
                    </li>
                    <li class='separator'>
                        <i class='icon-angle-right'></i>
                    </li>
                    <li>
                        房态管理
                    </li>
                    <li class='separator'>
                        <i class='icon-angle-right'></i>
                    </li>
                    <li class='active'>房态图</li>
                </ul>
            </div>
	       </div>
	       
	   <div class='toolheader'>
	     <div class="pull-left span8">
	      
	      <form id="form" class="form-horizontal">
           <div class='row-fluid'>
                <div class='span4'>
                <label class='span3' style="line-height: 30px">房间号:</label>
                    <input class='span9' name="roomnumber" placeholder="房间号" type="text" value="${roomnumber}" />
                </div>
                
                <div class='span4'>
                <label class='span3' style="line-height: 30px">楼号:</label>
                   <select class='span9' name="floorid" id="floorid"  onchange="selectById()">
                   <option value="0">---全部---</option>
                    <c:forEach items="${floors}" var="item">
					 <option value="${item.floorid}" ${item.floorid eq
									floorid ? "selected='selected'":""}>${item.floornumber}</option>
					</c:forEach>
				  </select>
                </div>
                <div class='span4'>
                <label class='span3' style="line-height: 30px">楼层:</label>
                   <select class='span9' name="floornumber" id="floornumber">
                    <option value="0">---全部---</option>
                    <option value="${floornumber}" ${empty floornumber ?  "" : "selected='selected'"}>${floornumber}楼</option>
				   </select>
                </div>
            </div>
            
          </form>
          
	     </div>
	     <div class="pull-right">
	     <button class="btn btn-primary start" onclick="Submit('${ctx}/roomStatusController/queryByParam.do')"><i class="icon-search icon-white"></i><span>查询</span></button>
	     <button class="btn btn-success start" onclick="OnloadContent('${ctx}/roomStatusController/addView.do')" ><i class="icon-plus icon-white"></i><span>新增</span></button>
	     <%-- <button class="btn btn-warning start" onclick="OnloadContent('${ctx}/roomStatusController/update.do')" ><i class="icon-edit icon-white"></i><span>修改</span></button>
	     <button class="btn btn-danger delete" onclick="OnloadContent('${ctx}/roomStatusController/delete.do')"><i class="icon-trash icon-white"></i><span>删除</span></button> --%>
	     </div>
	   </div>
	   
	  <div class='row-fluid' style="border-bottom: 2px dashed red;margin-top: -15px;margin-bottom: 13px">
      
       <div class='span12 '>
        
        <div class='span1'>
         <label style="line-height: 30px;text-align: center;font-size: 25px;font-weight: 900;    font-style: oblique">房态:</label>
        </div>
        
        <div class='span2'>
         <label class='span3' style="line-height: 30px">现住:</label>
         <button class="span6 btn btn-success" onclick="OnloadContent('${ctx}/roomStatusController/queryByStatus.do?roomstatus=1')"></button>
        </div>
        <div class='span2'>
          <label class='span3' style="line-height: 30px">空房:</label>
          <button class="span6 btn btn-primary" onclick="OnloadContent('${ctx}/roomStatusController/queryByStatus.do?roomstatus=2')"></button>
        </div>
        <div class='span2'>
         <label class='span4' style="line-height: 30px">维修房:</label>
          <button class="span6 btn btn-warning" onclick="OnloadContent('${ctx}/roomStatusController/queryByStatus.do?roomstatus=3')"></button>
        </div>
        <div class='span2'>
          <label class='span5' style="line-height: 30px">非出租房:</label>
          <button class="span6 btn btn-info" onclick="OnloadContent('${ctx}/roomStatusController/queryByStatus.do?roomstatus=4')"></button>
        </div>
        <div class='span2'>
          <label class='span3' style="line-height: 30px">锁房:</label>
          <button class="span6 btn btn-danger" onclick="OnloadContent('${ctx}/roomStatusController/queryByStatus.do?roomstatus=5')"></button>
        </div>
      </div>
    </div>
	   <div class='span12 '>
	    <c:forEach items="${floors}" var="Item" >
	    <div class='row-fluid'>
	      <div class='span12 '><span style="font-size: 24px;font-weight: 800;margin-left: 1%;color: darkviolet;">${Item.floorname}</span></div>
	      <c:forEach items="${rooms}" var="item">
	        <c:if test="${Item.floorid == item.floorid}">
	          <c:choose>
			  <c:when test="${item.roomstatus == 1}">
			  <div class="span2 price btn-success Menu" data-row-id="${item.roomsid}">
			   <label class='span12' style="line-height: 40px;font-size: 25px;">${item.roomnumber}</label>
			   <label class='span12' style="line-height: 30px">${item.roomtypename}</label>
			   
			   <div class="pull-right" style="margin-top: -80px;">
			   <a style="text-decoration: none;" onclick="tenementInfo(${item.roomsid},2)"><i class="icon-comment-alt"></i></a>
			   </div>
			  </div>
			  </c:when>
			  <c:when test="${item.roomstatus == 2}">
			  <div class="span2 price blue-background Menu" data-row-id="${item.roomsid}">
			   <label class='span12' style="line-height: 40px;font-size: 25px;">${item.roomnumber}</label>
			   <label class='span12' style="line-height: 30px">${item.roomtypename}</label>
			  </div>
			  </c:when>
			  <c:when test="${item.roomstatus == 3}">
			  <div class="span2 price btn-warning Menu" data-row-id="${item.roomsid}">
			   <label class='span12' style="line-height: 40px;font-size: 25px;">${item.roomnumber}</label>
			   <label class='span12' style="line-height: 30px">${item.roomtypename}</label>
			  </div>
			  </c:when>
			  <c:when test="${item.roomstatus == 4}">
			  <div class="span2 price purple-background Menu" data-row-id="${item.roomsid}">
			   <label class='span12' style="line-height: 40px;font-size: 25px;">${item.roomnumber}</label>
			   <label class='span12' style="line-height: 30px">${item.roomtypename}</label>
			  </div>
			  </c:when>
			  <c:when test="${item.roomstatus == 5}">
			  <div class="span2 price btn-danger Menu" data-row-id="${item.roomsid}">
			   <label class='span12' style="line-height: 40px;font-size: 25px;">${item.roomnumber}</label>
			   <label class='span12' style="line-height: 30px">${item.roomtypename}</label>
			  
			  <div class="pull-right" style="margin-top: -80px;">
			   <a style="text-decoration: none;" onclick="tenementInfo(${item.roomsid},1)"><i class="icon-comment-alt"></i></a>
			   </div>
			  </div>
			  </c:when>
			</c:choose>
	        </c:if>
	       <%--  <c:if test="${Item.floorid != item.floorid && Tag==1}">
	          <div class='span12 '></div>
	          <c:set var="Tag" value="0" />
	        </c:if> --%>
	      </c:forEach>
	      </div>
	      <c:set var="Tag" value="1" />
	    </c:forEach>
	   <%-- <c:forEach items="${rooms}" var="item">
			<c:choose>
			  <c:when test="${item.roomstatus == 1}">
			  <div class="span2 price btn-success Menu" data-row-id="${item.roomsid}">
			   <label class='span12' style="line-height: 40px;font-size: 25px;">${item.roomnumber}</label>
			   <label class='span12' style="line-height: 30px">${item.roomtypename}</label>
			   
			   <div class="pull-right" style="margin-top: -80px;">
			   <a style="text-decoration: none;" onclick="tenementInfo(${item.roomsid},2)"><i class="icon-comment-alt"></i></a>
			   </div>
			  </div>
			  </c:when>
			  <c:when test="${item.roomstatus == 2}">
			  <div class="span2 price blue-background Menu" data-row-id="${item.roomsid}">
			   <label class='span12' style="line-height: 40px;font-size: 25px;">${item.roomnumber}</label>
			   <label class='span12' style="line-height: 30px">${item.roomtypename}</label>
			  </div>
			  </c:when>
			  <c:when test="${item.roomstatus == 3}">
			  <div class="span2 price btn-warning Menu" data-row-id="${item.roomsid}">
			   <label class='span12' style="line-height: 40px;font-size: 25px;">${item.roomnumber}</label>
			   <label class='span12' style="line-height: 30px">${item.roomtypename}</label>
			  </div>
			  </c:when>
			  <c:when test="${item.roomstatus == 4}">
			  <div class="span2 price purple-background Menu" data-row-id="${item.roomsid}">
			   <label class='span12' style="line-height: 40px;font-size: 25px;">${item.roomnumber}</label>
			   <label class='span12' style="line-height: 30px">${item.roomtypename}</label>
			  </div>
			  </c:when>
			  <c:when test="${item.roomstatus == 5}">
			  <div class="span2 price btn-danger Menu" data-row-id="${item.roomsid}">
			   <label class='span12' style="line-height: 40px;font-size: 25px;">${item.roomnumber}</label>
			   <label class='span12' style="line-height: 30px">${item.roomtypename}</label>
			  
			  <div class="pull-right" style="margin-top: -80px;">
			   <a style="text-decoration: none;" onclick="tenementInfo(${item.roomsid},1)"><i class="icon-comment-alt"></i></a>
			   </div>
			  </div>
			  </c:when>
			</c:choose>
		</c:forEach> --%>
		</div>  
     </div>
</div>
</div>
<script type="text/javascript">
 
 var rowId = 0 ;
 var menu = new BootstrapMenu('.Menu', {
  
  fetchElementData: function($rowElem) {
    rowId = $rowElem.data('rowId');
  },
  actions: [{
    name: '开房',
    iconClass: 'icon-home',
    onClick: function() {
      $.post('${ctx}/roomStatusController/selectByRoomsId.do?roomsid='+ rowId,
      function(result){
        var obj = eval("("+result+")");
        if(obj.roomstatus == 2){
          optionByPath("${ctx}/roomStatusController/openHouseView.do?roomsid=" + rowId);
        }else{
          layer.msg("亲！只有空房状态才能开房", {icon: 6});
        }
      });
      
    }
  }, {
    name: '修改',
    iconClass: 'icon-edit',
    onClick: function() {
      optionByPath("${ctx}/roomStatusController/updateView.do?roomsid=" + rowId);
    }
  },{
    name: '删除',
    iconClass: 'icon-trash',
    onClick: function() {
      optionByPath("${ctx}/roomStatusController/delete.do?roomsid=" + rowId);
    }
  }]
  
});


function selectById(){
  
     var floorid =  $("#floorid option:selected").val();
     $.ajax({
	    type : "get",
		async : false,
		url : '${ctx}/roomStatusController/selectById.do?id='+ floorid,
		cache: false,
		timeout : 2000,
		contentType : "application/json;charset=utf-8;",
		dataType : "json",
		success : function(data) {
		  $('#floornumber').empty();
		  $('#floornumber').append('<option value="0">---全部---</option>');
		  for(var i =1; i <= data['numberplies']; i++){
		    var C = i > 9 ? i : "0"+ i;
		    
		    $('#floornumber').append('<option value="'+ i +'">'+ C +'楼</option>');
		  }
		}
	});
   }
  
function tenementInfo(roomsid,roomstatus){
   var e = event || window.event;              
   var x = e.clientX + "px";
   var y = e.clientY + "px";
   $.post('${ctx}/roomStatusController/tenementInfoView.do?roomsid='+ roomsid + "&roomstatus=" + roomstatus,
   function(result){
     layer.open({
       type: 1,
       area: '40%',
       scrollbar: false,
       //offset: [x, y],
       shade: false,
       title: false, //不显示标题
       content: result, 
       cancel: function(){
         bool = true;
      }
    });
   });
     
}
</script>     