package com.store.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.store.domain.Article;

public interface ArticleService {

	List<Article> findAllArticles();
	
	Page<Article> findArticlesByCriteria(Pageable pageable, Integer priceLow, Integer priceHigh, List<String> colors,
			List<String> categories, List<String> types, String search);
		
	List<Article> findFirstArticles();

	Article findArticleById(Long id);
	
	Article saveArticle(Article article);

	void deleteArticleById(Long id);
	
	List<String> getAllColors();

	List<String> getAllCategories();

	List<String> getAllTypes();

}
