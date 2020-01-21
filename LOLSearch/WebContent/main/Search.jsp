<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String userName=request.getParameter("userName");
%>
<script>
var userName="<%=userName%>";
var riot="https://kr.api.riotgames.com";
var api_key="RGAPI-339b40dd-915f-480b-a098-3710bea57b70";
var accountId="";
var id="";
$.ajax({
	    url:riot+"/lol/summoner/v4/summoners/by-name/"+userName+"?api_key="+api_key,
	 	type:"GET",
	 	dataType:"json",
	    success: function(json) {
	   		id=json.id;
	 		accountId=json.accountId;
	 		$("#id").html("id:"+json.id);
	 		$("#accountId").html("accountId:"+json.accountId);
	 		$("#puuid").html(json.puuid);
	 		$("#name").html("소환사명 :"+json.name);
	 		$("#profileIconId").html("<img src='http://ddragon.leagueoflegends.com/cdn/10.1.1/img/profileicon/"+json.profileIconId+".png'>");
	 		$("#revisionDate").html(json.revisionDate);
	 		$("#summonerLevel").html("소환사 레벨:"+json.summonerLevel);
	 		$.ajax({
	 		    url:riot+"/lol/league/v4/entries/by-summoner/"+id+"?api_key="+api_key,
	 		 	type:"GET",
	 		 	dataType:"json",
	 		    success: function(json) {
	 		    	/*  $('#tier').html("<img src='../WebContent/img/tier-img/"+json[0].tier+".png'>"); */ 
	 		    //	$("#tier").html("tier:"+json[0].tier);
	 		    	//$("#tier").html("<img src='WebContent/img/tier-img/GRANDMASTER.png'>");
	 		    	
	 		    }
	 		});
	    }
});
$('#Ex').html("<img src='../WebContent/img/tier-img/GRANDMASTER.png'>");
$('#Ex').html("<img src='../WebContent/img/bg.jpg'>");
</script>
<jsp:include page="../inc/header.jsp"/>
<div id="print">
<div id="id"></div>
<div id="accountId"></div>
<div id="puuid"></div>
<div id="name"></div>
<div id="profileIconId"></div>
<div id="revisionDate"></div>
<div id="summonerLevel"></div>
<div id="tier"></div>
<div id="Ex"></div>
</div>

<jsp:include page="../inc/footer.jsp"/>
</body>
</html>