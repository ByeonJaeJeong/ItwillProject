<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/jquery.ajax-cross-origin.min.js"></script>


<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("name");
	final String cdn="RGAPI-87462cac-c560-44da-9d3e-5a9844926922";
%>
<script type="text/javascript" language="javascript">
var SUMMONER_NAME= "<%=name%>";
var API_KEY= "<%=cdn%>";

alert("동작0");
$.ajax({


    url: 'https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/' + SUMMONER_NAME + '?api_key=' + API_KEY,
    type: 'GET',
    dataType: 'json',
    data: {
		
    },
    success: function (json) {
         var SUMMONER_NAME_NOSPACES = SUMMONER_NAME.replace(" ", "");

        SUMMONER_NAME_NOSPACES = SUMMONER_NAME_NOSPACES.toLowerCase().trim();

        summonerLevel = json[SUMMONER_NAME].summonerLevel;
        out.print(summonerLevel);
        summonerID = json[SUMMONER_NAME_NOSPACES].id; 
		
        document.getElementById("sLevel").innerHTML = summonerLevel;
        document.getElementById("sID").innerHTML = summonerID;  
		
        alert(summonerLevel);
       alert(summonerID);
        
    },
    error: function (XMLHttpRequest, textStatus, errorThrown) {
        alert("error getting Summoner data!");
    } 
});

</script>
</body>
</html>