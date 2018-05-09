package com.jetsblog.longin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jetsblog.user.dao.Article;
import com.jetsblog.user.dao.Page;
import com.jetsblog.user.service.ArticleService;

@Controller
public class IndexController {
	@Autowired
    public ArticleService articleService;
	@RequestMapping(value="/index")
    public ModelAndView index(Integer pageIndex,Integer pageSize){
		System.out.println("111111111111111111");
        ModelAndView modelAndView =new ModelAndView("index");
        Page page = new Page();
        if(pageSize==null) {
            page.setPageSize(0);
        }else {
        	page.setPageSize(pageSize);
        }
        if(pageIndex==null) {
            page.setPageNo(0);
        }else {
        	page.setPageNo(pageIndex);
        }
        page.setTotalCount(articleService.countAllNum());
        List<Article> articles=articleService.queryArticleByPage(page);
        if(articles.isEmpty()) {
            System.out.println("000000000000000"+articles.get(0).getId());
        	
        }
        modelAndView.addObject("articles",articles);
        modelAndView.addObject("page",page);
        //modelAndView.getModelMap().addAttribute("articles",articles);
        return modelAndView;
    }
}
