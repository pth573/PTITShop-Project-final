package com.store.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.store.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.domain.Article;
import com.store.domain.ArticleBuilder;
import com.store.domain.Type;
import com.store.domain.Category;
import com.store.domain.Color;

@Controller
@RequestMapping("/article")
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	
	@RequestMapping("/add")
	public String addArticle(Model model) {
		Article article = new Article();
		model.addAttribute("article", article);
		model.addAttribute("allColors", articleService.getAllColors());
		model.addAttribute("allTypes", articleService.getAllTypes());
		model.addAttribute("allCategories", articleService.getAllCategories());
		return "addArticle";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String addArticlePost(@ModelAttribute("article") Article article, HttpServletRequest request) {
		Article newArticle = new ArticleBuilder()
				.withTitle(article.getTitle())
				.stockAvailable(article.getStock())
				.withPrice(article.getPrice())
				.imageLink(article.getPicture())
				.color(Arrays.asList(request.getParameter("color").split("\\s*,\\s*")))
				.ofCategories(Arrays.asList(request.getParameter("category").split("\\s*,\\s*")))
				.ofType(Arrays.asList(request.getParameter("type").split("\\s*,\\s*")))
				.build();		
		articleService.saveArticle(newArticle);	
		return "redirect:article-list";
	}
	
	@RequestMapping("/article-list")
	public String articleList(Model model) {
		List<Article> articles = articleService.findAllArticles();
		model.addAttribute("articles", articles);
		return "articleList";
	}
	
	@RequestMapping("/edit")
	public String editArticle(@RequestParam("id") Long id, Model model) {
		Article article = articleService.findArticleById(id);
		String preselectedColors = "";
		for (Color color : article.getColors()) {
			preselectedColors += (color.getValue() + ",");
		}
		String preselectedTypes = "";
		for (Type type : article.getTypes()) {
			preselectedTypes += (type.getName() + ",");
		}
		String preselectedCategories = "";
		for (Category category : article.getCategories()) {
			preselectedCategories += (category.getName() + ",");
		}		
		model.addAttribute("article", article);
		model.addAttribute("preselectedColors", preselectedColors);
		model.addAttribute("preselectedTypes", preselectedTypes);
		model.addAttribute("preselectedCategories", preselectedCategories);
		model.addAttribute("allColors", articleService.getAllColors());
		model.addAttribute("allTypes", articleService.getAllTypes());
		model.addAttribute("allCategories", articleService.getAllCategories());
		return "editArticle";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String editArticlePost(@ModelAttribute("article") Article article, HttpServletRequest request) {		
		Article newArticle = new ArticleBuilder()
				.withTitle(article.getTitle())
				.stockAvailable(article.getStock())
				.withPrice(article.getPrice())
				.imageLink(article.getPicture())
				.color(Arrays.asList(request.getParameter("color").split("\\s*,\\s*")))
				.ofCategories(Arrays.asList(request.getParameter("category").split("\\s*,\\s*")))
				.ofType(Arrays.asList(request.getParameter("type").split("\\s*,\\s*")))
				.build();
		newArticle.setId(article.getId());
		articleService.saveArticle(newArticle);	
		return "redirect:article-list";
	}
	
	@RequestMapping("/delete")
	public String deleteArticle(@RequestParam("id") Long id) {
		articleService.deleteArticleById(id);
		return "redirect:article-list";
	}
	
}
