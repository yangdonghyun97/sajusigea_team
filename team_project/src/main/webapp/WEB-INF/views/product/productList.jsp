<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String uploadFolder = "\\resources\\images";
ServletContext ctx = request.getServletContext();
String path = ctx.getRealPath(uploadFolder);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/mainstyle.css">
</head>
<body>
			<c:if test="${user.user_id != null }">
				<header>

					<div id="search">
						<li><input type="hidden" name="search_text"></li>
						<li><button class="search_btn" onclick="search_on()"></button></li>
					</div>

					<a href="main"><div id="logo"></div></a>

					<div id="login">
						${user.user_id }님 반갑습니다! <a href="/user/userLogout.do" class="lin">logout</a>||
						<a href="/user/user_MyPage" class="lin">mypage</a>|| <a
							href="/cart/cartlist.do?user_id=${user.user_id }" class="lin">cart</a>
						<a href="/board/boardlist.do">QnA</a>
						<a href="/payment/paymentList.do?user_id=${user.user_id }">주문목록</a>
					</div>
				</header>
			</c:if>


			<c:if test="${user.user_id == null }">
				<header>

					<div id="search">
						<li><input type="hidden" name="search_text"></li>
						<li><button class="search_btn" onclick="search_on()"></button></li>
					</div>

					<a href="main"><div id="logo"></div></a>

					<div id="login">
						<a href="/user/user_login" class="lin">login</a>|| <a
							href="/user/user_Regassent" class="lin">join</a>||
					</div>
				</header>
			</c:if>
	<div id="top_menu">
		<ul class="menu">
			<li><a href="/product/productTagvalList.do?tagval=1">사료/간식</a></li>
			<li><a href="/product/productTagvalList.do?tagval=2">영양제</a></li>
			<li><a href="/product/productTagvalList.do?tagval=3">장난감/훈련용품</a></li>
			<li><a href="/product/productTagvalList.do?tagval=4">하우스</a></li>
			<li><a href="/product/productTagvalList.do?tagval=5">미용/목용용품</a></li>
			<li><a href="/product/productTagvalList.do?tagval=6">위생/배변</a></li>
		</ul>
	</div>
<c:if test="${sessionScope.aid == null }">
<table border="1">
<thead>
<tr>

<th>상품번호</th>
<th>이미지</th>
<th>상품이름</th>
<th>상품가격</th>
<th>상품내용</th>
<th>상품수량</th>
</tr>
</thead>
<tbody id="tbody">

<c:forEach var="list" items="${list }">
<tr>
<td><a href="detail.do?product_no=${list.product_no }">${list.product_no }</a></td>
<td><img src="/resources/images/${list.product_img }" style="width: 50px; height: 50px;"></td>
<td>${list.product_name }</td>
<td>${list.product_price }</td>
<td>${list.product_content }</td>
<td>
	<input type="number" name="num" placeholder="0" style="width: 50px;" min="0" max="${list.product_quantity }">
</td>
<td><input type="button" id="btn" value="장바구니담기"></td>
</tr>
</c:forEach>

</tbody>

</table>
</c:if>
<c:if test="${sessionScope.aid != null }">
<table border="1">
<tr>
<th>상품번호</th>
<th>이미지</th>
<th>상품이름</th>
<th>상품가격</th>
<th>상품내용</th>
<th>상품수량</th>
</tr>
<c:forEach var="list" items="${list }">
<tr>
<td><a href="detail.do?product_no=${list.product_no }">${list.product_no }</a></td>
<td><img src="/resources/images/${list.product_img }" style="width: 50px; height: 50px;"></td>
<td>${list.product_name }</td>
<td>${list.product_price }</td>
<td>${list.product_content }</td>
<td>${list.product_quantity }</td>
</tr>
</c:forEach>
</table>
</c:if>
<script>
	//모두 선택하기
	const all = document.querySelector("#all");
	all.addEventListener("change", change);
	
	function change(){
		//alert(all.checked);
		const chks = document.querySelectorAll(".chk");
		for(let i = 0; i < chks.length; i++){
			chks[i].checked = all.checked;
		}
	}
	
	// 장바구니 담기(개별)
	const tbody = document.querySelector("#tbody");
	tbody.addEventListener("click", f);
	
	function f(e){
		//alert(e.target.value);
		if(e.target.value == "장바구니담기"){
			alert(e.target.parentElement.parentElement.children[4].innerText);
			//alert(e.target.parentElement.parentElement.firstElementChild.firstElementChild.value); // checkbox value값
			document.frm.submit();
		}
		
		
	}
	
	/*function count(type)  {
		  // 결과를 표시할 element
		  const resultElement = document.getElementById('result');
		  
		  // 현재 화면에 표시된 값
		  let number = resultElement.innerText;
		  
		  // 더하기/빼기
		  
		  if(type === 'plus') {
		    number = parseInt(number) + 1;
		  }else if(type === 'minus')  {
		    number = parseInt(number) - 1;
		  }
		  
		  // 결과 출력
		  resultElement.innerText = number;
		}*/
</script>
</body>
</html>