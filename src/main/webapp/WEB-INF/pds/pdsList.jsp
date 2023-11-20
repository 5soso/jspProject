<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>pdsList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
  	'use script';
  	
  	$(function(){
  		$(".pdsBtnClose").hide();
  	});
  	
  	// 게시글 분류 처리
  	function partCheck(){
  		let part = $("#part").val();
  		location.href = 'pdsList.pds?part='+part+'&pag=${pag}&pagSize=${pageSize}';
  	}
  	
  	//삭제버튼 
  	function pdsDeleteBtnCheck(idx) {
  			$("#demo"+idx).show();
  			$("#pdsBtnDelete"+idx).hide();
  			$("#pdsBtnClose"+idx).show();
  	}
  	
  	function pdsDeleteBtnClose(idx) {
  		$("#demo"+idx).hide();
  		$("#pdsBtnDelete"+idx).show();
			$("#pdsBtnClose"+idx).hide();
  	}
  	
  	//자료파일 삭제 처리
  	function pdsDeleteCheck(idx) {
  		let pwd = $("#pwdInput"+idx).val();
  		alert("1 입력하세요:" + pwd+ ":");
  		
  		if(pwd.trim()=="") {
  			alert("비밀번호를 입력하세요");
  			return false;
  		}
  		
  		let query = {
  				idx : idx,
  				pwd : pwd
  		}
  		
  		$.ajax({
  			url : "pdsDeleteOk.pds",
  			type : "post",
  			data : query,
  			success : function(res) {
  				if(res == "1") {
  					alert("선택하신 파일이 삭제되었습니다.");
  					location.reload();
  				}
  				else alert("삭제 실패~");
				},
				error : function() {
					alert("전송오류");
				}
			});
		}
  	
  	// 다운로드수 증가시키기
  	function downNumCheck(idx) {
  		$.ajax({
  			url : "pdsDownNumCheck.pds",
  			post : "post",
  			data : {idx : idx},
  			success : function() {
  				location.reload();
  			},
  			error: function() {
  				alert("전송오류");
  			}
  		});
  	}
  	
  	// 페이징처리
  	function pageSizeCheck(){
  		let pageSize = $("#pageSize").val();
  		location.href = "pdsList.pds?part=${part}&pag=${pag}&pageSize="+pageSize;
  	}
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">자 료 실 리 스 트(${part})</h2>
  <br/>
  <table class="table table-borderless m-0 p-0">
    <tr>
      <td style="width:20%" class="text-left">
      	<form name="partForm">
      	  <select name="part" id="part" onchange="partCheck()" class="form-control m-0 p-0">
      	    <option ${part=="전체" ? "selected" : ""}>전체</option>
      	    <option ${part=="학습" ? "selected" : ""}>학습</option>
      	    <option ${part=="여행" ? "selected" : ""}>여행</option>
      	    <option ${part=="음식" ? "selected" : ""}>음식</option>
      	    <option ${part=="기타" ? "selected" : ""}>기타</option>
      	  </select>
      	</form>
      </td>
      <td style="width:10%" class="text-left">
        <select name="pageSize" id="pageSize" onchange="pageSizeCheck()" class="form-control m-0 p-0">
          <option value="3" ${pageSize==3 ? "selected" : ""}>3건</option>
          <option value="5" ${pageSize==5 ? "selected" : ""}>5건</option>
          <option value="10" ${pageSize==10 ? "selected" : ""}>10건</option>
          <option value="15" ${pageSize==15 ? "selected" : ""}>15건</option>
          <option value="20" ${pageSize==20 ? "selected" : ""}>20건</option>
        </select>
      </td>
      <td class="text-right">
        <a href="pdsInput.pds?part=${part}" class="btn btn-success">자료올리기</a>
      </td>
    </tr>
  </table>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
    	<th>번호</th>
    	<th>자료제목</th>
    	<th>올린이</th>
    	<th>올린날짜</th>
    	<th>분류</th>
    	<th>파일명(크기)</th>
    	<th>다운수</th>
    	<th>비고</th>
    </tr>
   <%--  <c:set var="pdsCnt" value="${fn:length(vos)}" /> --%>
    <c:forEach var="vo" items="${vos}" varStatus="st">	
    	<tr>
      	<td>${curScrStartNo}</td>
      	<td class="text-left">
          ${vo.title}
          <c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
        </td>
      	<td>${vo.nickName}</td>
      	<td>
          <!-- 1일(24시간) 이내는 시간만 표시, 이후는 날짜와 시간을 표시 : 2023-11-16 10:35:25 -->
          <!-- 단(24시간안에 만족하는 자료), 날짜가 오늘날짜만 시간으로표시하고, 어제날짜는 날짜시간으로 표시하시오. -->
          <c:if test="${vo.hour_diff > 24}">${fn:substring(vo.fDate,0,10)}</c:if>
          <c:if test="${vo.hour_diff <= 24}">
            ${vo.date_diff == 0 ? fn:substring(vo.fDate,11,19) : fn:substring(vo.fDate,0,16)}
          </c:if>
        </td>
      	<td>${vo.part}</td>
      	<td>
      		<%-- ${vo.fName} --%>
      		<c:set var="fNames" value="${fn:split(vo.fName,'/')}" />
      		<c:set var="fSNames" value="${fn:split(vo.fSName,'/')}" />
      		<c:forEach var="fName" items="${fNames}" varStatus="st" > <!-- st.indexOf / st.count -->
      			<a href="${ctp}/images/pds/${fSNames[st.index]}" download="${fName}" onclick="downNumCheck(${vo.idx})" >${fName}</a><br/>
      		</c:forEach>
      		<br/>
      		(<fmt:formatNumber value="${vo.fSize/1024}" pattern="#,##0" /> KByte)
      	</td>
      	<td>${vo.downNum}</td>
      	<td>
      		<c:if test="${sLevel == 0 || sMid == vo.mid}">
      			<a href="javascript:pdsDeleteBtnCheck(${vo.idx})" class="btn btn-danger" id="pdsBtnDelete${vo.idx}">삭제</a>
      			<a href="javascript:pdsDeleteBtnClose(${vo.idx})" class="btn btn-danger pdsBtnClose" id="pdsBtnClose${vo.idx}">닫기</a>
    			</c:if>
    			
    		</td>
    	</tr>
    	<c:set var="curScrStartNo" value="${curScrStartNo - 1}" />
    	<tr><td colspan="8" class="m-0 p-0"></td></tr>
    	<tr>
    	  <td  colspan="8">
					<div id="demo${vo.idx}" class="text-center" style="display:none;">
						<span style="color:red;">비밀번호 입력</span> : <input type="password" name="pwdCheck" id="pwdInput${vo.idx}" required />
						<input type="button" value="확인" id="pwdCheck${vo.idx}" onclick="pdsDeleteCheck(${vo.idx})" class="btn btn-sm btn-secondary" />
					</div>
				</td>
			</tr>
    </c:forEach>
  </table>
</div>
<!-- 블록페이지 시작(1블록의 크기를 3개(3Page)로 한다. 한페이지 기본은 5개 -->
<br/>
<div class="text-center">
  <ul class="pagination justify-content-center">
    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="pdsList.pds?part=${part}&pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
  	<c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="pdsList.pds?part=${part}&pag=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}">이전블록</a></li></c:if>
  	<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
	    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="pdsList.pds?part=${part}&pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
	    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="pdsList.pds?part=${part}&pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
  	</c:forEach>
  	<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="pdsList.pds?part=${part}&pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
  	<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="pdsList.pds?part=${part}&pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
  </ul>
</div>
<!-- 블록페이지 끝 -->
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>