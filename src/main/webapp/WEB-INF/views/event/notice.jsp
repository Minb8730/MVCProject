<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<section id="bodyWrap">
	<div class="boardList">
	<c:if test="${not empty list }">
		<div class="content">
			<div class="listTitle">
				<span>글번호</span>
				<span>제목</span>
				<span>지점</span>
				<span>시작날짜</span>
				<span>종료날짜</span>
			</div>
			
			<c:forEach var="board" items="${list}">
				<div class="list" onclick="location.href='${cpath}/notice/${board.board_number}?search=${param.search }&keyword=${param.keyword }&cate=3&page=${param.page}'"
				style="cursor: pointer;">
					<span>${board.board_number}</span>
					<span>${board.board_title}</span>
					<span>${board.board_store }</span>
					<span>${board.board_bdate}</span>
					<span>${board.board_edate}</span>	
				</div>
			</c:forEach>
		</div>

		<div class="pages">
			<c:if test="${paging.prev }">
			   	<a href="${cpath }/notice/?search=${param.search }&keyword=${param.keyword }&cate=3&page=${paging.begin-1}">
			   	[이전]</a>
		   	</c:if>
			<c:forEach var="i" begin="${paging.begin }" end="${paging.end}">
				<a href="${cpath }/notice/?search=${param.search }&keyword=${param.keyword }&cate=3&page=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${paging.next }">
			   	<a href="${cpath }/notice/?search=${param.search }&keyword=${param.keyword }&cate=3&page=${paging.end-1}">
			   	[다음]</a>
		   	</c:if>
		</div>
	</c:if>

		<div class="searchWrap cf">
			<form id="searchB">
			<select name="search">
				<option value="board_title">제목</option>
				<option value="board_content">내용</option>
			</select>
			<input type="text" name="keyword">
			<input type="hidden" name="page" value="${param.page }">
			<input type="hidden" name="cate" value="3">
			<div class="btn4">검색</div>
			</form>
		</div>
	</div>
</section>

<script>
 const btn = document.querySelector('.btn4')
 const searchForm= document.getElementById('searchB')
 btn.onclick=function(event){
	 searchForm.submit();
 }
</script>
<%@include file="../footer.jsp"%>