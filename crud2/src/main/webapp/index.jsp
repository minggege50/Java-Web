<%@ page language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>用户信息CRUD</title>
	<!-- 引入Bootstrap的CSS和JS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">  
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
		function deleteUser(uid,upage){
			if(confirm("你确定要删除么?")){
				location.href = "user?type=delete&id="+uid+"&page="+upage;
			}
		}
		
		function updateUser(uname,uage,uaddress,usex,uid){
			//负责将姓名,性别,年龄,住址放入到修改的模态框
			$("#uname").val(uname);
			$("#uage").val(uage);
			$("#uaddress").val(uaddress);
			$("#uid").val(uid);
			
			if("男"==usex){
				$("#usex1").attr("checked",true);
			}else{
				$("#usex2").attr("checked",true);
			}
			
			//JQuery弹出模态框
			$("#updateUser").modal("show");
			
		}
		
	</script>
</head>

<body>
	<c:if test="${empty USERLIST }">
		<c:redirect url="user" />
	</c:if>
	<!-- 
		class:样式,使用什么样子的
		data-toggle:点击时,做出什么操作,modal,弹出模态框
		data-target:指定哪个编号的模态框被弹出
	-->
	<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">注册新用户</button>
	<table class="table table-hover">
		<tr>
			<th>序号</th>
			<th>姓名</th>
			<th>性别</th>
			<th>年龄</th>
			<th>地址</th>
			<th>操作</th>
		</tr>
		<c:forEach var="ui" items="${USERLIST }" varStatus="j">
			<tr>
				<td>${j.count }</td>
				<td>${ui.userName }</td>
				<td>${ui.userSex }</td>
				<td>${ui.userAge }</td>
				<td>${ui.userAddress }</td>
				<td> 
					<a href="javascript:deleteUser(${ui.userId },${param.page })">删除</a>
					<a href="javascript:updateUser('${ui.userName }','${ui.userAge }','${ui.userAddress }','${ui.userSex }',${ui.userId})">修改</a>
				</td>
			</tr>
		</c:forEach>
		
		<tfoot>
			<tr>
				<th colspan="6">
					<ul class="pager">
					    <li><a href="user?page=${param.page-1 }">上一页</a></li>
					    <li><a href="user?page=${param.page+1 }">下一页</a></li>
					</ul>
				</th>
			</tr>
		</tfoot>
	</table>


	<!--添加 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	        	<form action="user?type=add" method="post"  class="form-horizontal" role="form">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">注册新用户</h4>
	            </div>
	            <div class="modal-body">
	            	
	            	<div class="form-group">
					   <label for="firstname" class="col-sm-2 control-label">姓名:</label>
					   <div class="col-sm-10">
					     <input type="text" class="form-control" placeholder="请输入名字" name="name" />
					   </div>
					</div>
	            	<div class="form-group">
					   <label for="firstname" class="col-sm-2 control-label">性别:</label>
					   <div class="col-sm-10">
					   		<label class="radio-inline">
						        <input type="radio" name="sex" value="男" checked/> 男
						    </label>
						    <label class="radio-inline">
						        <input type="radio" name="sex" value="女" /> 女
						    </label>
					   </div>
					</div>
	            	
	            	
	            	
	            	<br/>
	            	<div class="form-group">
					   <label for="firstname" class="col-sm-2 control-label">年龄:</label>
					   <div class="col-sm-10">
					     <input type="number" class="form-control" placeholder="请输入年龄" name="age" />
					   </div>
					</div>
	            	<div class="form-group">
					   <label for="firstname" class="col-sm-2 control-label">住址:</label>
					   <div class="col-sm-10">
					     <input type="text" class="form-control" placeholder="请输入住址" name="address" />
					   </div>
					</div>
	            </div>
	            <div class="modal-footer">
	                <input type="submit" class="btn btn-primary" value="注册新用户"/>
	            </div>
	            </form>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>


<!--修改 模态框（Modal） -->
	<div class="modal fade" id="updateUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	        	<form action="user" method="post"  class="form-horizontal" role="form">
	            <input type="hidden" name="id" value="" id="uid" />
	            <input type="hidden" name="type" value="update" />
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">修改用户</h4>
	            </div>
	            <div class="modal-body">
	            	
	            	<div class="form-group">
					   <label for="firstname" class="col-sm-2 control-label">姓名:</label>
					   <div class="col-sm-10">
					     <input type="text" class="form-control" placeholder="请输入名字" name="name" id="uname"/>
					   </div>
					</div>
	            	<div class="form-group">
					   <label for="firstname" class="col-sm-2 control-label">性别:</label>
					   <div class="col-sm-10">
					   		<label class="radio-inline">
						        <input type="radio" name="sex" id="usex1" value="男" checked/> 男
						    </label>
						    <label class="radio-inline">
						        <input type="radio" name="sex" id="usex2" value="女" /> 女
						    </label>
					   </div>
					</div>
	            	
	            	
	            	
	            	<br/>
	            	<div class="form-group">
					   <label for="firstname" class="col-sm-2 control-label">年龄:</label>
					   <div class="col-sm-10">
					     <input type="number" class="form-control" placeholder="请输入年龄" name="age" id="uage" />
					   </div>
					</div>
	            	<div class="form-group">
					   <label for="firstname" class="col-sm-2 control-label">住址:</label>
					   <div class="col-sm-10">
					     <input type="text" class="form-control" placeholder="请输入住址" name="address" id="uaddress"/>
					   </div>
					</div>
	            </div>
	            <div class="modal-footer">
	                <input type="submit" class="btn btn-primary" value="确认修改用户"/>
	            </div>
	            </form>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>



</body>
</html>
