<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript">
var SUMMONER_NAME="";
var API_KEY= "RGAPI-bc202277-ebd6-4f7c-80d5-1fdaf189bc82";
$.ajax({
    url: 'https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/' + SUMMONER_NAME + '?api_key=' + API_KEY,
    type: 'GET',
    dataType: 'json',
    data: {

    },
    success: function (json) {
        var SUMMONER_NAME_NOSPACES = SUMMONER_NAME.replace(" ", "");

        SUMMONER_NAME_NOSPACES = SUMMONER_NAME_NOSPACES.toLowerCase().trim();

        summonerLevel = json[SUMMONER_NAME_NOSPACES].summonerLevel;
        summonerID = json[SUMMONER_NAME_NOSPACES].id;

        document.getElementById("sLevel").innerHTML = summonerLevel;
        document.getElementById("sID").innerHTML = summonerID;

    },
    error: function (XMLHttpRequest, textStatus, errorThrown) {
        alert("error getting Summoner data!");
    }
});
</script> -->
</head>
<body>
<form action="riotPro.jsp">
<input type="text" name="name"> 
<input type="submit" value="검색"> 
</form>
</body>
</html>