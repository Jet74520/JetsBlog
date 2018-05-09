package com.jetsblog.user.service;
import java.util.List;

import com.jetsblog.user.dao.Article;
import com.jetsblog.user.dao.Page;

public interface ArticleService {

    Article selectById (Integer id);

    Article selectLastArticle (Integer id);

    Article selectNextArticle (Integer id);

    List<Article> queryAll();

    List<Article> queryArticleByPage(Page page);
    
    int countAllNum();

    boolean updateArticle(Article article);

    int deleteById(Integer id);

    int selectCount();

    List<Article> selectByWord(String word);

    boolean insert(Article article);
}
