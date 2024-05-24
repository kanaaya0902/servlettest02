package jp.co.aforce.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jp.co.aforce.dao.TweetDAO;

@WebServlet("/new_tweet")
public class NewTweetServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String content = request.getParameter("content");
        String author = request.getParameter("author");
        String message = "";

        if (author.length() > 255) {
            message = "投稿者名は255文字以下で入力してください。";
        } else {
            TweetDAO tweetDAO = new TweetDAO();
            try {
                tweetDAO.addTweet(content, author);
                message = "ツイートの投稿に成功しました。";
            } catch (Exception e) {
                e.printStackTrace();
                message = "ツイートの投稿に失敗しました。";
            }
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("tweet_list.jsp").forward(request, response);
    }
}
