<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="jp.co.aforce.beans.Tweet" %>
<%@ page import="jp.co.aforce.dao.TweetDAO" %>
<%@ page import="java.util.List" %>

<%
    TweetDAO tweetDAO = new TweetDAO();
    List<Tweet> tweets = tweetDAO.getAllTweets();
    request.setAttribute("tweets", tweets);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ツイート一覧</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h1>ツイート一覧</h1>
        
        <%-- メッセージの表示 --%>
        <c:if test="${not empty message}">
            <p class="message">${message}</p>
        </c:if>
        
        <p><a href="new_tweet.jsp">新規投稿</a></p>

        <ul class="tweet-list">
            <c:forEach var="tweet" items="${tweets}">
                <li>
                    <div class="tweet-content">
                        <p>${tweet.content}</p>
                        <p class="tweet-info">投稿者: ${tweet.author} - 投稿日時: ${tweet.postedAt}</p>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</body>
</html>
