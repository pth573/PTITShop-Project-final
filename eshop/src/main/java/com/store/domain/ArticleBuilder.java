package com.store.domain;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ArticleBuilder {
		
	private String title;
	private int stock;	
	private double price;
	private String picture;
	private List<String> colors;
	private List<String> categories;
	private List<String> types;
	
	public ArticleBuilder() {
	}
	
	public ArticleBuilder withTitle(String title) {
		this.title = title;
		return this;
	}
	
	public ArticleBuilder stockAvailable(int stock) {
		this.stock = stock;
		return this;
	}
	
	public ArticleBuilder withPrice(double price) {
		this.price = price;
		return this;
	}
	
	public ArticleBuilder imageLink(String picture) {
		this.picture = picture;
		return this;
	}
	
	public ArticleBuilder color(List<String> colors) {
		this.colors = colors;
		return this;
	}
	
	public ArticleBuilder ofCategories(List<String> categories) {
		this.categories = categories;
		return this;
	}
	
	public ArticleBuilder ofType(List<String> types) {
		this.types = types;
		return this;
	}
	
	public Article build() {
		Article article = new Article();
		article.setTitle(this.title);
		article.setPrice(this.price);
		article.setStock(this.stock);
		article.setPicture(this.picture);		
		
		if (this.colors != null && !this.colors.isEmpty()) {
			Set<Color> sizeElements = new HashSet<>();
			for (String val : this.colors) {
				sizeElements.add(new Color(val,article));
			}	
			article.setColors(sizeElements);
		}
		
		if (this.categories != null && !this.categories.isEmpty() ) {
			Set<Category> catElements = new HashSet<>();
			for (String val : this.categories) {
				catElements.add(new Category(val,article));
			}
			article.setCategories(catElements);
		}		
		if (this.types != null && !this.types.isEmpty() ) {
			Set<Type> typelements = new HashSet<>();
			for (String val : this.types) {
				typelements.add(new Type(val,article));
			}
			article.setTypes(typelements);
		}		
		
		
		return article;
	}
	
}