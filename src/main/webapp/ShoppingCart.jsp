<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.JavaWebApplication.Beans.MenuItem" %>
<%@ page import="java.util.List" %>
<%@ taglib
    prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" 
%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="images/ramen78.png"/>
<meta charset="UTF-8">
<title>Shopping Cart</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
	*{
	   font-family: 'Nunito', sans-serif;
	   margin:0; padding:0;
	   box-sizing: border-box;
	   outline: none; border:none;
	   text-decoration: none;
	   transition: all .2s linear;
	   text-transform: capitalize;
	}
    body {
        font-family: 'Open Sans', sans-serif;
        background-color: #F5F5F5; 
        color: #333; 
		font-size: 13px;
	}
	.table-responsive {
        margin: 30px 0;
    }
	.table-wrapper {
		min-width: 1000px;
        background: #fff;
        padding: 20px 25px;
		border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
	.table-title {        
		padding-bottom: 15px;
		background: #435d7d;
		color: #fff;
		padding: 16px 30px;
		margin: -20px -25px 10px;
		border-radius: 3px 3px 0 0;
    }
    .table-title h2 {
		margin: 5px 0 0;
		font-size: 24px;
	}
	.table-title .btn-group {
		float: right;
	}
	.table-title .btn {
		color: #fff;
		float: right;
		font-size: 13px;
		border: none;
		min-width: 50px;
		border-radius: 2px;
		border: none;
		outline: none !important;
		margin-left: 10px;
	}
	.table-title .btn i {
		float: left;
		font-size: 21px;
		margin-right: 5px;
	}
	.table-title .btn span {
		float: left;
		margin-top: 2px;
	}
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
		padding: 12px 15px;
		vertical-align: middle;
    }
	table.table tr th:first-child {
		width: 60px;
	}
	table.table tr th:last-child {
		width: 100px;
	}
    table.table-striped tbody tr:nth-of-type(odd) {
    	background-color: #fcfcfc;
	}
	table.table-striped.table-hover tbody tr:hover {
		background: #f5f5f5;
	}
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }	
    table.table td:last-child i {
		opacity: 0.9;
		font-size: 22px;
        margin: 0 5px;
    }
	table.table td a {
		font-weight: bold;
		color: #566787;
		display: inline-block;
		text-decoration: none;
		outline: none !important;
	}
	table.table td a:hover {
		color: #2196F3;
	}
	table.table td a.edit {
        color: #FFC107;
    }
    table.table td a.delete {
        color: #F44336;
    }
    table.table td i {
        font-size: 19px;
    }
	table.table .avatar {
		border-radius: 50%;
		vertical-align: middle;
		margin-right: 10px;
	}
    .pagination {
        float: right;
        margin: 0 0 5px;
    }
    .pagination li a {
        border: none;
        font-size: 13px;
        min-width: 30px;
        min-height: 30px;
        color: #999;
        margin: 0 2px;
        line-height: 30px;
        border-radius: 2px !important;
        text-align: center;
        padding: 0 6px;
    }
    .pagination li a:hover {
        color: #666;
    }	
    .pagination li.active a, .pagination li.active a.page-link {
        background: #03A9F4;
    }
    .pagination li.active a:hover {        
        background: #0397d6;
    }
	.pagination li.disabled i {
        color: #ccc;
    }
    .pagination li i {
        font-size: 16px;
        padding-top: 6px
    }
    .hint-text {
        float: left;
        margin-top: 10px;
        font-size: 13px;
    }    
	/* Custom checkbox */
	.custom-checkbox {
		position: relative;
	}
	.custom-checkbox input[type="checkbox"] {    
		opacity: 0;
		position: absolute;
		margin: 5px 0 0 3px;
		z-index: 9;
	}
	.custom-checkbox label:before{
		width: 18px;
		height: 18px;
	}
	.custom-checkbox label:before {
		content: '';
		margin-right: 10px;
		display: inline-block;
		vertical-align: text-top;
		background: white;
		border: 1px solid #bbb;
		border-radius: 2px;
		box-sizing: border-box;
		z-index: 2;
	}
	.custom-checkbox input[type="checkbox"]:checked + label:after {
		content: '';
		position: absolute;
		left: 6px;
		top: 3px;
		width: 6px;
		height: 11px;
		border: solid #000;
		border-width: 0 3px 3px 0;
		transform: inherit;
		z-index: 3;
		transform: rotateZ(45deg);
	}
	.custom-checkbox input[type="checkbox"]:checked + label:before {
		border-color: #03A9F4;
		background: #03A9F4;
	}
	.custom-checkbox input[type="checkbox"]:checked + label:after {
		border-color: #fff;
	}
	.custom-checkbox input[type="checkbox"]:disabled + label:before {
		color: #b8b8b8;
		cursor: auto;
		box-shadow: none;
		background: #ddd;
	}
	/* Modal styles */
	.modal .modal-dialog {
		max-width: 400px;
	}
	.modal .modal-header, .modal .modal-body, .modal .modal-footer {
		padding: 20px 30px;
	}
	.modal .modal-content {
		border-radius: 3px;
	}
	.modal .modal-footer {
		background: #ecf0f1;
		border-radius: 0 0 3px 3px;
	}
    .modal .modal-title {
        display: inline-block;
    }
	.modal .form-control {
		border-radius: 2px;
		box-shadow: none;
		border-color: #dddddd;
	}
	.modal textarea.form-control {
		resize: vertical;
	}
	.modal .btn {
		border-radius: 2px;
		min-width: 100px;
	}	
	.modal form label {
		font-weight: normal;
	}	
</style>


</head>
<body>
<input type="hidden" id="present" value="<%=request.getAttribute("present")%>">
<% String userID = (String) session.getAttribute("id");
   String MenuItem="";%>
<input type="hidden" id="search" value="<%=request.getAttribute("search")%>">
    <header>
        <jsp:include page="header2.jsp" />
    </header>
    
    <br><br><br><br><br><br><br>
    <div class="container">
   		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-xs-6">
							<h2>Manage <b>Shopping cart</b></h2>
						</div>
						<div class="col-xs-6">
							<a href="<c:url value='ListAllCartDetails'/>?userID=<%=session.getAttribute("id") %>" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>List All Items</span></a>	
							<a href="MenuItemSelection.jsp" class="btn btn-danger" ><i class="material-icons">&#xE15C;</i> <span>Go To Menu </span></a>						
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Menu Item Name</th>
							<th>Category</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Action</th>
						</tr>
					</thead>
			<tbody>
		<c:set var="totalPrice" value="0"/>
		<c:set var="ItemList" value=""/>
        <c:forEach var="CartList" items="${CartList}">
    	<c:set var="CartID" value="${CartList.getCardID()}"/>
        <c:set var="MenuItemID" value="${CartList.getMenuItemID()}"/>
        <c:set var="catagory" value="${CartList.getMenuItemCategory()}"/>
        <c:set var="Name" value="${CartList.getMenuItemName()}"/>
        <c:set var="price" value="${CartList.getMenuItemPrice()}"/>
        <c:set var="Quantity" value="${CartList.getQuantity()}"/> 
        <c:set var="price" value="${CartList.getMenuItemPrice() * CartList.getQuantity()}"/>
   	    <c:set var="totalPrice" value="${totalPrice + price}"/>  
   	    <c:set var="MenuItem" value="${MenuItem}${CartList.getMenuItemName()} ${CartList.getQuantity()} ${price}</br>"/>
            <tr>
                <td>${CartList.getMenuItemName()}</td>
                <td>${CartList.getMenuItemCategory()}</td>
                <td>${CartList.getMenuItemPrice()}</td>
                <td>${CartList.getQuantity()}</td>
                <td>
            <c:url value="UpdateQuantity.jsp" var="updateQuantity">
         	<c:param name="CartID" value="${CartID}"/>
         	<c:param name="Quantity" value="${Quantity}"/>
         	<c:param name="MenuItemID" value="${MenuItemID}"/>
         	<c:param name="MenuItemName" value="${Name}"/>
            </c:url>
            <c:url value="DeleteCartItem.jsp" var="deleteItemCart">
         	<c:param name="CartID" value="${CartID}"/>
         	<c:param name="Quantity" value="${Quantity}"/>
         	<c:param name="MenuItemID" value="${MenuItemID}"/>
         	<c:param name="MenuItemName" value="${Name}"/>
            </c:url>
                <a href="${updateQuantity}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit Quantity">&#xE254;</i></a>
                <a href="${deleteItemCart}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Remove">&times;</i></a></td>
			</tr>
	</c:forEach>
			</tbody>
				</table>
			
            <c:url value="Payment.jsp" var="Payment">
            <c:param name="CartList" value="${CartList}"/>
            <c:param name="CutomerID" value="${userID}"/>
            <c:param name="total" value="${totalPrice}"/>
            <c:param name="ItemList" value="${MenuItem}"/>
            </c:url>
            
				<h1 style="align: left;">Total Price: ${totalPrice}</h1>
				<a href="${Payment}" class="btn btn-success"><span>Check Out</span></a>
			</div>
		</div>        
    </div>
    
    
    
    
    <footer style="font-size:1.5rem;">
        <jsp:include page="footer.jsp" />
    </footer>
    <script type="text/javascript">
let update=document.getElementById("update").value;
if(update=="success"){
	swal("Item Updated Sucessfully","","success");
}
</script>
</body>
</html>