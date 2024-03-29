package com.store.domain;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Article {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private int stock;
    private double price;
    private String picture;

    private String description;
    @OneToMany(mappedBy = "article", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Color> colors;

    @OneToMany(mappedBy = "article", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Type> types;

    @OneToMany(mappedBy = "article", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Category> categories;


    public Article() {
    }

    public boolean hasStock(int amount) {
        return (this.getStock() > 0) && (amount <= this.getStock());
    }

    public void decreaseStock(int amount) {
        this.stock -= amount;
    }


    public void addColor(Color color) {
        colors.add(color);
        color.setArticle(this);
    }

    public void removeColor(Color color) {
        colors.remove(color);
        color.setArticle(null);
    }

    public void addCategory(Category category) {
        categories.add(category);
        category.setArticle(this);
    }

    public void removeCategory(Category category) {
        categories.remove(category);
        category.setArticle(null);
    }

    public void addColor(Type type) {
        types.add(type);
        type.setArticle(this);
    }

    public void removeColor(Type type) {
        types.remove(type);
        type.setArticle(null);
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Set<Color> getColors() {
        return colors;
    }

    public void setColors(Set<Color> colors) {
        this.colors = colors;
    }

    public Set<Type> getTypes() {
        return types;
    }

    public void setTypes(Set<Type> types) {
        this.types = types;
    }

    public Set<Category> getCategories() {
        return categories;
    }

    public void setCategories(Set<Category> categories) {
        this.categories = categories;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
