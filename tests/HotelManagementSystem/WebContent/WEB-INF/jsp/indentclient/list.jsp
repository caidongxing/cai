<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class='container-fluid'>
<div class='row-fluid' id='content-wrapper'>
     <div class='span12'>
       <div class='page-header'>
	        <h1 class='pull-left'>
             <i class='icon-list-alt'></i>
             <span>订单处理</span>
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
                        订单处理
                    </li>
                    <li class='separator'>
                        <i class='icon-angle-right'></i>
                    </li>
                    <li class='active'>订单客人列表</li>
                </ul>
            </div>
	   </div>
	   
	   <form id="form" class="form-horizontal">    
	   
	   <div class='toolheader'>
	     <div class="pull-left span10">
	      
           <div class='row-fluid'>
                <div class='span2'>
                <label class='span5' style="line-height: 30px">房号:</label>
                    <input class='span7' name="roomnumber" placeholder="房号" type="text" value="${detailParam.roomnumber}" />
                </div>
                <div class='span2'>
                <label class='span5' style="line-height: 30px">客名:</label>
                    <input class='span7' name="chinesename" placeholder="客名" type="text" value="${detailParam.chinesename}" />
                </div>
                <div class='span2'>
                <label class='span5' style="line-height: 30px">团会名:</label>
                 <input class='span7' name="teamname" placeholder="团会名" type="text" value="${detailParam.teamname}" />
                </div>
                <div class='span3'>
                <label class='span5' style="line-height: 30px">协议客户:</label>
                    <input class='span7' name="agreementclientname" placeholder="协议客户" type="text" value="${detailParam.agreementclientname}" />
                </div>
                
            </div>
            
          
	     </div>
	     <div class="pull-right">
	     <a class="btn btn-primary start" onclick="queryPage()"><i class="icon-search icon-white"></i><span>查询</span></a>
	     </div>
	   </div>
	   
	   <div class='row-fluid'>
	    <div class='responsive-table'>
          <div class='scrollable-area'>
           <table id="detailTbId" class='table table-bordered table-hover table-striped' style='width: 1600px;'>
            <thead>
             <tr>
              <th>选择</th>
              <th>操作</th>
              <th>标志</th>
              <th>状态</th>
              <th>订单号</th>
              <th>姓名</th>
              <th>到店日期</th>
              <th>离店日期</th>
              <th hidden>房间id</th>
              <th>房号</th>
              <th>等级</th>
              <th>房价</th>
              <th>房数</th>
              <th>人数</th>
              <th>性别</th>
              <th hidden>账号id</th>
              <th>余额</th>
              <th>押金</th>
              <th>团会</th>
              <th>协议客户</th>
              <th>备注</th>
             </tr>
            </thead>
            <tbody>
               <c:forEach items="${page.result}" var="item">
                <tr class="DetailMenu" data-row-id="${item.detailid}">
                 <td><input type="checkbox" name="ck" value="${item.detailid}"></td>
                 <td>
                 <div class="btn btn-primary btn-small has-tooltip" data-placement="top" title=""  data-original-title="客人信息"
                 onclick="optionByPath('${ctx}/indentClientController/clientinfoView.do?detailid=${item.detailid}' + '&roomreservationid=${item.roomreservationid}' + '&clientinfoid=${item.clientinfoid}')" >
                 <i class=" icon-user icon-white"></i>
                 </div>
                 <div class="btn btn-success btn-small has-tooltip" data-placement="right" title="" data-original-title="分配账号"
                 onclick="AllotAccount('${ctx}/indentClientController/allotaccountView.do?detailid=${item.detailid}' + '&roomreservationid=${item.roomreservationid}' + '&clientinfoid=${item.clientinfoid}')" >
                 <i class="icon-book icon-white"></i>
                 </div>
                 <div class="btn btn-info btn-small has-tooltip" data-placement="bottom" title=""  data-original-title="换房" onclick="changeRoomView(${item.detailid})" ><i class="icon-retweet icon-white"></i>
                 </div>
                 <div class="btn btn-warning btn-small has-tooltip" data-placement="right" title=""   data-original-title="收押金" onclick="CashPledge(${item.detailid})"  ><i class="icon-star-empty icon-white"></i>
                 </div>
                 <%-- <a class="btn btn-primary btn-small" onclick="optionByPath('${ctx}/indentClientController/clientinfoView.do?detailid=${item.detailid}' + '&roomreservationid=${item.roomreservationid}' + '&clientinfoid=${item.clientinfoid}')" ><i class=" icon-user icon-white"></i></a>
                 <a class="btn btn-success btn-small" onclick="AllotAccount('${ctx}/indentClientController/allotaccountView.do?detailid=${item.detailid}' + '&roomreservationid=${item.roomreservationid}' + '&clientinfoid=${item.clientinfoid}')" ><i class="icon-book icon-white"></i></a>
                 <a class="btn btn-info btn-small" onclick="changeRoomView(${item.detailid})" ><i class="icon-retweet icon-white"></i></a>
                 <a class="btn btn-warning btn-small" onclick="CashPledge(${item.detailid})" ><i class="icon-star-empty icon-white"></i></a>
                  --%>
                 </td>
                 <td>${item.detailid}</td>
                 <td>
                 <c:choose>
					<c:when test="${item.roomstatus == 1}"><span class="label label-warning">预订</span></c:when>
					<c:when test="${item.roomstatus == 2}"><span class="label label-success">现住</span></c:when>
					<c:when test="${item.roomstatus == 3}"><span class="label label-important">取消</span></c:when>
					<c:when test="${item.roomstatus == 4}"><span class="label label-important">离店</span></c:when>
					<c:when test="${item.roomstatus == 5}"><span class="label label-important">失约</span></c:when>
				 </c:choose></td>
				 <td>${item.reservationnumber}</td>
				 <td>${item.chinesename}</td>
				 <td><fmt:formatDate value="${item.arrivedate}" pattern="yyyy-MM-dd"/></td>
				 <td><fmt:formatDate value="${item.leavedate}" pattern="yyyy-MM-dd"/></td>
				 <td hidden>${item.roomsid}</td>
				 <td>${item.roommark}</td>
				 <td>${item.roomtypename}</td>
				 <td>${item.realprice}</td>
				 <td>${item.roomnumber}/${item.freebed}</td>
				 <td>${item.adult}/${item.children}</td>
				 <td><c:choose>
				   <c:when test="${item.sex == 1}"><span class="label label-warning">男</span></c:when>
				   <c:when test="${item.sex == 2}"><span class="label label-success">女</span></c:when>
				   <c:otherwise></c:otherwise>
				 </c:choose></td>
				 <td hidden>${item.accountid}</td>
				 <td>${item.accountbalance}</td>
				 <td>${item.cashpledge}</td>
				 <td>${item.teamname}</td>
				 <td>${item.agreementclientname}</td>
				 <td>${item.comment}</td>
                </tr>
               </c:forEach>  
            </tbody>
           </table>
           
           <tiles:insertDefinition name="pagesTemplate"/>
           
         </div>
        </div>
	   </div>
	   
	   </form>
	   
     </div>
     
</div>
</div>
<script type="text/javascript">

function queryPage() {
   $.ajax({
	    cache: true,
        type: "POST",
        url : '${ctx}/indentClientController/list.do',
        data:$('#form').serialize(),// 你的formid
        async: false,
		success : function(data) {
		  $('#content').empty();
		  $('#content').append(data);
		},
		error: function(request) {
          $('#content').empty();
		  $('#content').append(data);
        }
	});
}

//分配账号
function AllotAccount(path){
   var accountid = this.event.target.offsetParent.parentNode.cells[15].innerHTML;//offsetParent
   var status = this.event.target.offsetParent.parentNode.cells[3].innerText;//offsetParent
  if(status != "预订"){
    layer.msg("亲！只有预订状态的客人才能分配账号！", {icon: 6});
    return false;
  }
  if(accountid < 0 || accountid == ""){
  layer.confirm('温馨提示，是否为该客人分配账号？', {
     btn: ['确定','取消'] //按钮
   },function(index, layero){
     layer.close(index);//如果设定了yes回调，需进行手工关闭
     $.ajax({
	    type : "get",
		async : false,
		url : path,
		cache: false,
		timeout : 2000,
		contentType : "application/json;charset=utf-8;",
		success : function(data) {
		  $('#content').empty();
		  $('#content').append(data);
		},
		error: function(request) {
          $('#content').empty();
		  $('#content').append(data);
        }
	 });
   });
  }else{
    layer.msg("亲！该客人已经分配了账号！", {icon: 6});
  }
}

//收押金
function CashPledge(detailid){
  var accountid = this.event.target.offsetParent.parentNode.cells[15].innerHTML;//offsetParent
  //余额
  var accountbalance = this.event.target.offsetParent.parentNode.cells[16].innerHTML;
  var cashpledge = this.event.target.offsetParent.parentNode.cells[17].innerHTML;
  var status = this.event.target.offsetParent.parentNode.cells[3].innerText;//offsetParent
  if(status != "预订"){
    layer.msg("亲！只有预订状态的客人才能收取押金！", {icon: 6});
    return false;
  }
  if(cashpledge =="" || cashpledge == 0){
    if(accountid !="" && accountid >0){
      $.post('${ctx}/indentClientController/cashpledgeView.do?detailid='+detailid+"&accountid="+accountid,function(result){
      layer.open({
      type: 1,
      title: '收押金',
      area: '60%',
      content: result,
      btn: ['确定', '关闭'],
      yes: function(index, layero){
        if($("#payway").val() !=1){
          $("#cashpledgeform").submit();
          if(validate){
           layer.msg("成功收取押金！", {icon: 6});
           layer.close(index);//如果设定了yes回调，需进行手工关闭
          }
        }else{
        if(parseInt(accountbalance) > $("#expenditure").val()){
          $("#cashpledgeform").submit();
          if(validate){
           layer.msg("成功收取押金！", {icon: 6});
           layer.close(index);//如果设定了yes回调，需进行手工关闭
          }
        }else{
          layer.msg("余额不足，请换一种支付方式！", {icon: 5});
        }
       }
      },
      btn2: function(index, layero){ //按钮【按钮二】的回调
      } 
    });
  });
 }else{
    layer.msg("亲！该客人暂未分配账号！", {icon: 5});
 }
  }else{
    layer.msg("亲！该客人已收取押金！", {icon: 6});
  }
  
}


//换房
function changeRoomView(detailid){
    
	var status = this.event.target.offsetParent.parentNode.cells[3].innerText;//offsetParent
    var roommark = this.event.target.offsetParent.parentNode.cells[9].innerText;
    if(status == "预订" || status == "现住"){
	if(roommark != ""){
      $.post('${ctx}/indentClientController/changeRoomView.do?detailid='+ detailid,function(result){
      layer.open({
      type: 1,
      title: '换房',
      area: '60%',
      content: result,
      btn: ['确定', '关闭'],
      yes: function(index, layero){
        $("#ChangeRoomform").submit();
        if(validate){
         layer.msg("换房成功！", {icon: 6});
         layer.close(index);//如果设定了yes回调，需进行手工关闭
        }
      },
      btn2: function(index, layero){ //按钮【按钮二】的回调
      } 
    });
  });
    }else{
	layer.msg("亲！该客人还未分房，不能换房！", {icon: 6});
    }
    }else{
      layer.msg("亲！只有预订或现住状态才能换房！", {icon: 6});
    }
}



 var rowId = 0 ;
 var rowElem;
 var menu = new BootstrapMenu('.DetailMenu', {
  fetchElementData: function($rowElem) {
    rowId = $rowElem.data('rowId');
    rowElem = $rowElem;
  },
  actions: [
  {name: '分房',
    iconClass: 'icon-home',
    onClick: function() {
        var len = $("#detailTbId input[name='ck']:checked").length;
        if(len > 0){
          var check_val = [];
          var bool = false;
          $("#detailTbId input[name='ck']:checked").each(function(){
              var accountid = this.offsetParent.parentNode.cells[15].innerHTML;
              var status = this.offsetParent.parentNode.cells[3].innerText;
              var roommark = this.offsetParent.parentNode.cells[9].innerText;
              if(status != "预订"){
                 layer.msg("亲！只有预订状态才能分房，请重新选择！", {icon: 6});
                 bool = false;
                 return false;
              }
              if(roommark != ""){
                 layer.msg("亲！有已分房客人，请重新选择！", {icon: 6});
                 bool = false;
                 return false;
              }
              if(accountid !="" && accountid >0){
                check_val.push($(this).val());
                bool = true;
              }else{
                 layer.msg("亲！有未分账户的客人，请重新选择！", {icon: 5});
                 bool = false;
                 return false;
              }
              
          });
          if(bool == true){
            optionByPath("${ctx}/indentClientController/allotroomView.do?ckValue=" + check_val);
          }
          
        }else{
          layer.msg("亲！请选择已分账户的客人进行分房！", {icon: 6});
        }
    }
  },{
    name: '取消分房',
    iconClass: 'icon-remove',
    onClick: function() {
       var len = $("#detailTbId input[name='ck']:checked").length;
       if(len > 0){
         var check_val = [];
         var roomsid = [];
         var bool = false;
         $("#detailTbId input[name='ck']:checked").each(function(){
            var roomsId = this.offsetParent.parentNode.cells[8].innerText;
            var roommark = this.offsetParent.parentNode.cells[9].innerText;
            var status = this.offsetParent.parentNode.cells[3].innerText;
            if(status != "预订"){
              layer.msg("亲！只有预订状态才能取消分房，请重选！", {icon: 6});
              bool = false;
              return false;
            }
            if(roommark == ""){
              layer.msg("亲！有客人还未分房，不能取消分房，请重选！", {icon: 6});
              bool = false;
              return false;
            }else{
              check_val.push($(this).val());
              roomsid.push(roomsId);
              bool = true;
            }
         });
         
         if(bool == true){
           $.ajax({
             cache: true,
             type: "POST",
             url : '${ctx}/indentClientController/cancelAllotRoom.do?ckValue='+check_val+"&roomsid="+roomsid,
             async: false,
             success : function(data) {
               layer.msg("亲！取消分房成功！", {icon: 6});
               $('#content').empty();
               $('#content').append(data);
             },
             error: function(request) {
               $('#content').empty();
               $('#content').append(data);
             }
           });
         }
       }else{
          layer.msg("亲！还未选中已分房客人喔！", {icon: 6});
       }
    }
  },{
    name: '入住',
    iconClass: 'icon-key ',
    onClick: function() {
      var len = $("#detailTbId input[name='ck']:checked").length;
       if(len > 0){
         var check_val = [];
         var roomsid = [];
         var arriveDate = [];
         var bool = false;
         var nowDate = new Date();
         
         $("#detailTbId input[name='ck']:checked").each(function(){
            var roomsId = this.offsetParent.parentNode.cells[8].innerText;
            var roommark = this.offsetParent.parentNode.cells[9].innerText;
            var status = this.offsetParent.parentNode.cells[3].innerText;
            var DaoDianShiJian = this.offsetParent.parentNode.cells[6].innerText;
            
            if(status != "预订" || roommark == ""){
              layer.msg("亲！只有预订状态且已分配房间才能入住！", {icon: 6});
              bool = false;
              return false;
            }else{
              check_val.push($(this).val());
              roomsid.push(roomsId);
              arriveDate.push(DaoDianShiJian);
              bool = true;
            }
         });
         
         for(var i=0;i<arriveDate.length;i++){
           var arrivedate = new Date(arriveDate[i]);
           if(arrivedate > nowDate){
             if (confirm("有客人未到入住时间，是否提前？")) {
               bool = true;
               break;
             }else{
               return false;
             }
           }
         }
         if(bool == true){
              $.ajax({
                cache: true,
                type: "POST",
                url : '${ctx}/indentClientController/Reside.do?ckValue='+check_val+"&roomsid="+roomsid+"&arrivedate="+arriveDate,
                async: false,
                success : function(data) {
                  layer.msg("亲！入住成功！", {icon: 6});
                  $('#content').empty();
                  $('#content').append(data);
                },
                error: function(request) {
                  $('#content').empty();
                  $('#content').append(data);
                }
             });
         }
       }else{
          layer.msg("亲！还未选中已分房客人喔！", {icon: 6});
       }
    }
  }, {
    name: '取消入住',
    iconClass: 'icon-ban-circle ',
    onClick: function() {
      var len = $("#detailTbId input[name='ck']:checked").length;
       if(len > 0){
         var check_val = [];
         var roomsid = [];
         var bool = false;
         $("#detailTbId input[name='ck']:checked").each(function(){
            var roomsId = this.offsetParent.parentNode.cells[8].innerText;
            var roommark = this.offsetParent.parentNode.cells[9].innerText;
            var status = this.offsetParent.parentNode.cells[3].innerText;
            if(status != "现住" || roommark == ""){
              layer.msg("亲！只有现住状态且已分配房间才能取消入住！", {icon: 6});
              bool = false;
              return false;
            }else{
              check_val.push($(this).val());
              roomsid.push(roomsId);
              bool = true;
            }
         });
         if(bool == true){
           $.ajax({
             cache: true,
             type: "POST",
             url : '${ctx}/indentClientController/cancelReside.do?ckValue='+check_val+"&roomsid="+roomsid,
             async: false,
             success : function(data) {
               layer.msg("亲！已取消入住！", {icon: 6});
               $('#content').empty();
               $('#content').append(data);
             },
             error: function(request) {
               $('#content').empty();
               $('#content').append(data);
             }
           });
         }
       }else{
          layer.msg("亲！还未选中已分房客人喔！", {icon: 6});
       }
    }
  }]
  
});
</script>     