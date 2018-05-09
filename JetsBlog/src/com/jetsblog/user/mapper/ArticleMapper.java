package com.jetsblog.user.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jetsblog.user.dao.Article;
import com.jetsblog.user.dao.Page;
@Repository
public interface ArticleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(Integer id);

    Article selectLastArticle(Integer id);

    Article selectNextArticle(Integer id);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKeyWithBLOBs(Article record);

    int updateByPrimaryKey(Article record);

    int countAllNum();


    List<Article> queryAll();

    List<Article> queryArticleByPage(Page page);
    
    List<Article> selectByWord(String word);
}
