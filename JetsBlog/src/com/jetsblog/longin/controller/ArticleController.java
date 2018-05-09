package com.jetsblog.longin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jetsblog.user.dao.Article;
import com.jetsblog.user.service.ArticleService;

@Controller
public class ArticleController {

    @Autowired
    ArticleService articleService;
    //@Autowired
    //public CommentServiceImpl commentService;

    @RequestMapping("/articleDetail")
    public ModelAndView articleDetail(HttpServletRequest request){

        int id=Integer.parseInt(request.getParameter("id"));
        //List<Comment> comments=commentService.allComments(id,0,10);
        System.out.println(id+"qqqqqqqqqqqqqqq");
        Article article=articleService.selectById(id);
        Article lastArticle=articleService.selectLastArticle(id);
        Article nextArticle=articleService.selectNextArticle(id);

        Integer clickNum=article.getClick();
        article.setClick(clickNum+1);
        articleService.updateArticle(article);

        ModelAndView modelAndView=new ModelAndView("articleDetail");
        modelAndView.addObject("article",article);
        //modelAndView.addObject("comments",comments);
        //modelAndView.addObject("lastArticle",lastArticle);
        //modelAndView.addObject("nextArticle",nextArticle);
        return modelAndView;
    }
}
