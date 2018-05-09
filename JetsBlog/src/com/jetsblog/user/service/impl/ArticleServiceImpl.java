package com.jetsblog.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jetsblog.user.dao.Article;
import com.jetsblog.user.dao.Page;
import com.jetsblog.user.mapper.ArticleMapper;
import com.jetsblog.user.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService{

    @Autowired
    public ArticleMapper articleMapper;

    public Article selectById(Integer id) {
        return articleMapper.selectByPrimaryKey(id);
    }

    public List<Article> queryAll() {
        return articleMapper.queryAll();
    }

    public int countAllNum() {
        return articleMapper.countAllNum();
    }

    public boolean updateArticle(Article article) {
        return articleMapper.updateByPrimaryKeySelective(article)>0;
    }

    public int deleteById(Integer id) {
        return articleMapper.deleteByPrimaryKey(id);
    }

    public int selectCount() {
        return articleMapper.countAllNum();
    }

    public List<Article> selectByWord(String word) {
        return articleMapper.selectByWord(word);
    }

    public boolean insert(Article article) {
        return articleMapper.insert(article)>0;
    }

    public Article selectLastArticle(Integer id) {
        return articleMapper.selectLastArticle(id);
    }

    public Article selectNextArticle(Integer id) {
        return articleMapper.selectNextArticle(id);
    }

	@Override
	public List<Article> queryArticleByPage(Page page) {
		// TODO Auto-generated method stub
		return articleMapper.queryArticleByPage(page);
	}
}
