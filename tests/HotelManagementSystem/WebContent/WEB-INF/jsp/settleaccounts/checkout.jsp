<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class='container-fluid' id="DataDiv">
<div class='row-fluid' id='content-wrapper'>
     <div class='span12'>
       <div class='page-header'>
	        <h1 class='pull-left'>
             <i class='icon-list-alt'></i>
             <span>账务处理</span>
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
                        账务处理
                    </li>
                    <li class='separator'>
                        <i class='icon-angle-right'></i>
                    </li>
                    <li class='active'>结账退房</li>
                </ul>
            </div>
	   </div>
	   
	      
	   <form id="form" class="form-horizontal">
	   
	   <div class='toolheader'>
	     <div class="pull-left span10">
	      
           <div class='row-fluid'>
                <label class='span2' style="line-height: 30px;font-size: 25px;color: red;">结账退房</label>
                <div class='span4' style="text-align: right;">
                  <input class='span2' value="3" name="abolish" style="margin-bottom: 4px;width: 25px;" type="checkbox" ${params.abolish eq 3 ? "checked='checked'" :""}/><span>取消</span>
                  <input class='span2' value="1" name="reservation" style="margin-bottom: 4px;width: 25px;margin-left: 15px" type="checkbox" ${params.reservation eq 1 ? "checked='checked'" :""}/><span>预订</span>
                  <input class='span2' value="2" name="reside" style="margin-bottom: 4px;width: 25px;margin-left: 15px" type="checkbox" checked="checked"/><span>现住</span>
                  <input class='span2' value="4" name="leave" style="margin-bottom: 4px;width: 25px;margin-left: 15px" type="checkbox" ${params.leave eq 4 ? "checked='checked'" :""}/><span>离店</span>
                </div>
                
                <div class='span2'>
                <label class='span5' style="line-height: 30px">房号:</label>
                    <input class='span7' name="roomnumber" placeholder="房号" type="text" value="${params.roomnumber}" />
                </div>
                <div class='span2'>
                <label class='span5' style="line-height: 30px">团名:</label>
                    <input class='span7' name="teamname" placeholder="团名" type="text" value="${params.teamname}" />
                </div>
                <div class='span2'>
                <label class='span5' style="line-height: 30px">姓名:</label>
                    <input class='span7' name="name" placeholder="姓名" type="text" value="${params.name}" />
                </div>
                
            </div>
          
	     </div>
	     <div class="pull-right">
	     <a class="btn btn-primary start" onclick="queryPage()"><i class="icon-search icon-white"></i><span>查询</span></a>
	     <a class="btn btn-warning start" onclick="GoBackList('${ctx}/settleAccountsController/list.do')"><i class="icon-mail-reply icon-white"></i><span>返回</span></a>
	     
	     </div>
	     
	   </div>
	   </form>
	   
	   <form id="settleaccountsform" class="form-horizontal">
	   
	   <input type="hidden" name="detailid" id="detailid" />
	     
	   <div class='row-fluid'>
	     <div class='row-fluid span8'>
	       <div class="row-fluid">
	         <div class='span6'>
				<label class='span3' style="line-height: 30px">客人姓名:</label>
				<input class='span9' style="margin-left: -12px;width: 269px;" name="chinesename" id="chinesename"  type="text" readonly="readonly"/>
			 </div>
			 <div class='span6'>
				<label class='span3' style="line-height: 30px">证件号码:</label>
				<input class='span9' style="margin-left: -12px;width: 269px;" name="idnumber" id="idnumber"  type="text" readonly="readonly"/>
			 </div>
	       </div>
	       <div class="row-fluid">
	         <div class='span3'>
				<label class='span5' style="line-height: 30px">房号:</label>
				<input class='span7' name="roommark"  id="roommark" type="text" readonly="readonly"/>
			 </div>
			 <div class='span3'>
				<label class='span5' style="line-height: 30px">房价/天:</label>
				<input class='span7' name="realprice"  id="realprice" type="text" readonly="readonly"/>
			 </div>
			 <div class='span3'>
				<label class='span5' style="line-height: 30px">房间类型:</label>
				<input class='span7' name="roomtypename"  id="roomtypename" type="text" readonly="readonly"/>
			 </div>
			 <div class='span3'>
				<label class='span5' style="line-height: 30px">余额:</label>
				<input class='span7' name="accountbalance"  id="accountbalance" type="text" readonly="readonly"/>
			 </div>
			 
	       </div>
	       <div class="row-fluid">
	         <div class='span6'>
				<label class='span3' style="line-height: 30px">到店时间:</label>
				<input class='span9' style="margin-left: -12px;width: 269px;" name="arrivedate" id="arrivedate" type="text" readonly="readonly"/>
			 </div>
			 <div class='span6'>
				<label class='span3' style="line-height: 30px">离店时间:</label>
				<input class='span9' style="margin-left: -12px;width: 269px;" name="leavedate" id="leavedate" type="text" readonly="readonly"/>
			 </div>
	       </div>
	       <div class="row-fluid">
	         <div class='span3'>
				<label class='span5' style="line-height: 30px">支付方式:</label>
				<select class='span7' name="payway"  id="payway">
				  <option value="1">现金</option>
				  <option value="2">银行卡</option>
				  <option value="3">支票</option>
				</select>
			 </div>
	         <div class='span9'>
				<label class='span2' style="line-height: 30px;width: 64px;">备注:</label>
				<input class='span10' style="width: 449px;" name="comment" type="text" />
			 </div>
	       </div>
	       <div class="row-fluid" style="background-color: darkgrey;margin: 0px;">
	        <div class='span12'>
	        <label class="span2" style="line-height: 30px;width: 65px;">分组方式:</label>
	        <input type="radio" name="type" value="1" id="accountitems" checked="checked" style="width: 25px;height: 25px;margin-left: 20px;margin-bottom: 5px;"/>账项
	        <input type="radio" name="type" value="2" style="width: 25px;height: 25px;margin-left: 20px;margin-bottom: 5px;"/>明细账
	        <input type="radio" name="type" value="3" style="width: 25px;height: 25px;margin-left: 20px;margin-bottom: 5px;"/>账组
	        <input type="radio" name="type" value="4" style="width: 25px;height: 25px;margin-left: 20px;margin-bottom: 5px;"/>日期
	        <input type="radio" name="type" value="5" style="width: 25px;height: 25px;margin-left: 20px;margin-bottom: 5px;"/>转入账单
	        </div>
	       </div>
	       <div class='row-fluid'>
	         <div class='responsive-table'>
	           <div class='scrollable-area' style="height: 270px;overflow: scroll;">
	             <table class='table table-bordered table-hover table-striped' id="AccountbookitemsTb">
	               <thead>
	                <tr>
	                  <th><input type="checkbox" style="width: 25px;height: 15px;"/></th>
	                  <th>代码</th>
	                  <th>描述</th>
	                  <th>金额</th>
	                  <th>记录数</th>
	                </tr>
	               </thead>
	               <tbody></tbody>
	             </table>
	           </div>
	         </div>
	       </div>
	       <div class="row-fluid">
	         <div class='span3'>
				<label class='span5' style="line-height: 30px">消费合计:</label>
				<input class='span7' name="total"  id="total" type="text" readonly="readonly" request/>
			 </div>
	         <div class='span3'>
				<label class='span5' style="line-height: 30px">押金:</label>
				<input class='span7' name="cashpledge"  id="cashpledge" type="text" readonly="readonly" request/>
			 </div>
			 <div class='span3'>
				<label class='span5' style="line-height: 30px">应付/退:</label>
				<input class='span7' name="payable"  id="payable" type="text" readonly="readonly" request/>
			 </div>
			 <div class='pull-right'>
			  <a class="btn btn-success" onclick="SettleAccounts()"><i class="icon-credit-card"></i><span> 结账退房</span></a>
			 </div>
			 
	       </div>
	     </div>
	     <div class='row-fluid span4' >
	      <div class='row-fluid' style="background-color: #3a9aec;"><span style="color: aliceblue;font-size: 20px;">客人列表</span></div>
	      <div class='row-fluid'>
	         <div class='responsive-table'>
	           <div class='scrollable-area' style="height: 350px;overflow: scroll;">
	             <table class='table table-bordered table-hover table-striped' style='margin-bottom:0;'>
	               <thead>
	                <tr>
	                  <th hidden>detailid</th>
	                  <th hidden>accountid</th>
	                  <th>房号</th>
	                  <th>姓名</th>
	                  <th>余额</th>
	                  <th>状态</th>
	                  <th hidden>到店时间</th>
	                  <th hidden>离店时间</th>
	                  <th hidden>房价</th>
	                  <th hidden>房间类型</th>
	                  <th hidden>证件号码</th>
	                </tr>
	               </thead>
	               <tbody>
	                 <c:forEach items="${detail}" var="item">
	                   <tr onclick="selectClick(this)">
	                    <td hidden>${item.detailid}</td>
	                    <td hidden>${item.accountid}</td>
	                    <td>${item.roommark}</td>
	                    <td>${item.chinesename}</td>
	                    <td>${item.accountbalance}</td>
	                    <td>${item.roomstatus}</td>
	                    <td hidden><fmt:formatDate value="${item.arrivedate}" pattern="yyyy-MM-dd"/></td>
	                    <td hidden><fmt:formatDate value="${item.leavedate}" pattern="yyyy-MM-dd"/></td>
	                    <td hidden>${item.realprice}</td>
	                    <td hidden>${item.roomtypename}</td>
	                    <td hidden>${item.idnumber}</td>
	                   </tr>
	                 </c:forEach>
	               </tbody>
	             </table>
	           </div>
	         </div>
	       </div>
	       <div class='row-fluid'>
	         <div class='responsive-table'>
	             <table class='table table-bordered table-hover table-striped' style='margin-bottom:0;' id="AccountBookTb">
	               <thead>
	                <tr>
	                  <th hidden>signbillid</th>
	                  <th>代码</th>
	                  <th>账本描述</th>
	                  <th>限额</th>
	                  <th>转账关系</th>
	                  <th hidden>accountbookid</th>
	                </tr>
	               </thead>
	               <tbody></tbody>
	             </table>
	         </div>
	       </div>
	     </div>
	   </div>
	   </form>
     </div>
     
     
</div>
</div>
<script type="text/javascript">

$(function(){

  var items = $("input[name='type']");
  for(var i = 0;i < items.length;i++){
    items[i].onclick= function(){
      if(this.value == 1){
        var tr = $("#AccountBookTb tbody tr:first");
        if(tr[0].cells[0].innerText != "" && tr[0].cells[5].innerText != ""){
          $.post('${ctx}/settleAccountsController/findAccountbookitemsById.do?accountbookid='+ tr[0].cells[5].innerText +"&signbillid=" +tr[0].cells[0].innerText,
          function(result){
            var dt = eval(result);
            $("#AccountbookitemsTb tbody").empty();
            for (var k = 0; k < dt.length; k++) {
              var isproceeds;
              if(dt[k].isproceeds == 1){
                isproceeds = "<span class='label label-success'>已收</span>";
              }else{
                isproceeds = "<span class='label label-warning'>待收</span>";
              }
              $("#AccountbookitemsTb tbody").append("<tr'><td><input type='checkbox' style='width: 25px;height: 15px;'/></td>"
              +"<td>"+dt[k].accountitemsid+"</td>"
              +"<td>"+dt[k].itemsname+"</td>"
              +"<td>"+dt[k].expenditure+isproceeds+"</td>"
              +"<td>"+dt[k].record+"</td>"
              +"</td></tr>");
            }
          });
        }
      }else if(this.value == 2){
        var tr = $("#AccountBookTb tbody tr");
        var signbillId = [];
        for(var k = 0;k < tr.length;k++){
          signbillId.push(tr[k].cells[0].innerText);
        }
        $.post('${ctx}/settleAccountsController/findSignbillDetailById.do?signbillid='+ signbillId,
        function(result){
        var dt = eval(result);
        $("#AccountbookitemsTb tbody").empty();
        
        var Total = 0;
        for (var k = 0; k < dt.length; k++) {
           var isproceeds;
           if(dt[k].isproceeds == 1){
             isproceeds = "<span class='label label-success'>已收</span>";
           }else{
             isproceeds = "<span class='label label-warning'>待收</span>";
           }
           $("#AccountbookitemsTb tbody").append("<tr'><td><input type='checkbox' style='width: 25px;height: 15px;'/></td>"
	       +"<td>"+dt[k].accountitemsid+"</td>"
	       +"<td>"+dt[k].consumerdescribe+"</td>"
	       +"<td>"+dt[k].expenditure+isproceeds+"</td>"
	       +"<td>"+dt[k].quantity+"</td>"
	       +"</td></tr>");
	       if(dt[k].iscashpledge == 1){
	         $("#cashpledge").val(dt[k].expenditure);
	       }
	       if(dt[k].isproceeds != 1){
	         Total = Total+ dt[k].expenditure;
	       }
	      
         }
         $("#total").val(Total);
         
         //应付/退 = 消费合计 - 押金 - 账户余额
         $("#payable").val(Total - $("#cashpledge").val() - $("#accountbalance").val()); 
       });
      }
      
    }
  }

});

function queryPage() {
   $.ajax({
	    cache: true,
        type: "POST",
        url : '${ctx}/settleAccountsController/checkout.do',
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

//行选中事件
function selectClick(row){
  $("#roommark").val(row.cells[2].innerText);
  $("#chinesename").val(row.cells[3].innerText);
  $("#accountbalance").val(row.cells[4].innerText);
  $("#arrivedate").val(row.cells[6].innerText);
  $("#leavedate").val(row.cells[7].innerText);
  $("#realprice").val(row.cells[8].innerText);
  $("#roomtypename").val(row.cells[9].innerText);
  $("#idnumber").val(row.cells[10].innerText);
  
  //将订单明细ID放进隐藏域
  $("#detailid").val(row.cells[0].innerText);
  
  //清空
  $("#cashpledge").val("");
  $("#total").val("");
  $("#payable").val(""); 
  
  if(row.cells[5].innerText == 3){
    layer.msg("亲！该订单已取消，不能结账！", {icon: 5});
    return false;
  }
  if(row.cells[5].innerText == 4){
    layer.msg("亲！该客人已离店，不能结账！", {icon: 5});
    return false;
  }
  if(row.cells[5].innerText == 5){
    layer.msg("亲！该客人已失约，不能结账！", {icon: 5});
    return false;
  }
  if(row.cells[1].innerText != ""){
    $.post('${ctx}/settleAccountsController/findAccountBook.do?accountid='+ row.cells[1].innerText,
    function(result){
     var dt = eval(result);
     $("#AccountBookTb tbody").empty();
     for (var k = 0; k < dt.length; k++) {
        var options;
        switch (dt[k].transferaccountswayid) {
		case 1:
			options = "结账即转";
			break;
		case 2:
			options = "发生即转";
			break;
		case 3:
			options = "夜审即转";
			break;
		default:
		    options = "结账即转";
			break;
		}
        $("#AccountBookTb tbody").append("<tr onclick='selectAccountBookRow(this)'><td hidden>"+dt[k].signbillid+"</td>"
	     +"<td>"+dt[k].accountbookcode+"</td>"
	     +"<td>"+dt[k].accountbookname+"</td>"
	     +"<td>"+dt[k].quota+"</td>"
	     +"<td>"+options+"</td>"
	     +"<td hidden>"+dt[k].accountbookid+"</td>"
	     +"</td></tr>");
     }
     $("#arrivedate").val(row.cells[6].innerText);
     $("#leavedate").val(row.cells[7].innerText);
     
     //获取离店时间与当前日期比较大小
    var leavedate = new Date(row.cells[7].innerText).toLocaleDateString();
     var nowDate = new Date().toLocaleDateString();
     if(leavedate > nowDate){
       if (confirm("未到离店时间，是否提前结账退房？")) {
       }else{
          return false;
       }
     }
     $.post('${ctx}/settleAccountsController/expenseView.do?detailid='+row.cells[0].innerText +"&accountid="+row.cells[1].innerText,
     function(data){
       layer.open({
         type: 1,
         title: '收取房租',
         area: '50%',
         content: data,
         btn: ['确定', '关闭'],
         yes: function(index, layero){
           $("#expenseform").submit();
           if(validate){
            layer.close(index);//如果设定了yes回调，需进行手工关闭
           }
         }
       })
     });
   }); 
   
   
  }
  
  
}
function selectAccountBookRow(row){
  if(row.cells[0].innerText != "" && row.cells[5].innerText != ""){
    document.getElementById("accountitems").checked="checked";
    
    $.post('${ctx}/settleAccountsController/findAccountbookitemsById.do?accountbookid='+ row.cells[5].innerText +"&signbillid=" +row.cells[0].innerText,
    function(result){
     var dt = eval(result);
     $("#AccountbookitemsTb tbody").empty();
     for (var k = 0; k < dt.length; k++) {
        var isproceeds;
        if(dt[k].isproceeds == 1){
          isproceeds = "<span class='label label-success'>已收</span>";
        }else{
           isproceeds = "<span class='label label-warning'>待收</span>";
        }
        $("#AccountbookitemsTb tbody").append("<tr'><td><input type='checkbox' style='width: 25px;height: 15px;'/></td>"
	     +"<td>"+dt[k].accountitemsid+"</td>"
	     +"<td>"+dt[k].itemsname+"</td>"
	     +"<td>"+dt[k].expenditure+isproceeds+"</td>"
	     +"<td>"+dt[k].record+"</td>"
	     +"</td></tr>");
     }
    });
  }
}

//结账退房
function SettleAccounts(){
   if($("#chinesename").val() != ""){
     if($("#total").val() != "" && $("#total").val() > 0){
       $.ajax({
	    cache: true,
        type: "POST",
        url : '${ctx}/settleAccountsController/settleaccounts.do',
        data:$('#settleaccountsform').serialize(),// 你的formid
        async: false,
		success : function(data) {
		  layer.confirm('结账成功，是否打印结账凭证？', {
		  btn: ['确定','取消'] //按钮
		  },function(index, layero){
		     layer.close(index);//如果设定了yes回调，需进行手工关闭
		     PrintData();//打印结账凭证
		  },function(index, layero){
		    $('#content').empty();
		    $('#content').append(data);
		  })
		},
		error: function(request) {
          $('#content').empty();
		  $('#content').append(data);
        }
	  });
     }else{
       layer.msg("亲！请选择明细账进行结账！", {icon: 5});
     }
   }else{
     layer.msg("亲！请先选中一条客人信息！", {icon: 5});
   }
   
}

//打印
function PrintData(){
 var detailid = $("#detailid").val();
 if(detailid !="" && detailid > 0){
    var tr = $("#AccountBookTb tbody tr");
    var signbillId = [];
    for(var k = 0;k < tr.length;k++){
      signbillId.push(tr[k].cells[0].innerText);
    }
    
    $.post('${ctx}/settleAccountsController/print.do?signbillid='+ signbillId + "&detailid=" + detailid,
     function(result){
     //var oldstr = document.body.innerHTML; 
     document.body.innerHTML = result;
     window.print();
     //document.body.innerHTML = oldstr;
     document.location.reload();
    /*    $.post('${ctx}/settleAccountsController/checkout.do',
     function(data){
       alert();
       $('#content').empty();
	   $('#content').append(data);
	   
     }); */
     return false;
   
   });
 }else{
   layer.msg("亲！请先选中一条客人信息！", {icon: 5});
 }
  
}  
</script>     