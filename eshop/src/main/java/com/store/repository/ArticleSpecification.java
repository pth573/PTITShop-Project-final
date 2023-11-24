package com.store.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.store.domain.Article;
import com.store.domain.Category;
import com.store.domain.Color;
import com.store.domain.Type;
import org.springframework.data.jpa.domain.Specification;

public class ArticleSpecification {

    private ArticleSpecification() {
    }
    public static Specification<Article> filterBy(Integer priceLow, Integer priceHigh, List<String> colors,
                                                  List<String> categories, List<String> types, String search) {
        return new Specification<Article>() {
            @Override
            public Predicate toPredicate(Root<Article> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
                List<Predicate> predicates = new ArrayList<>();
                query.distinct(true);
                if (colors != null && !colors.isEmpty()) {
                    Join<Article, Color> joinSize = root.join("colors");
                    predicates.add(criteriaBuilder.and(joinSize.get("value").in(colors)));
                }
                if (categories != null && !categories.isEmpty()) {
                    Join<Article, Category> joinSize = root.join("categories");
                    predicates.add(criteriaBuilder.and(joinSize.get("name").in(categories)));
                }
                if (types != null && !types.isEmpty()) {
                    Join<Article, Type> joinSize = root.join("types");
                    predicates.add(criteriaBuilder.and(joinSize.get("name").in(types)));
                }

                if (search != null && !search.isEmpty()) {
                    predicates.add(criteriaBuilder.and(criteriaBuilder.like(root.get("title"), "%" + search + "%")));
                }
                if (priceLow != null && priceLow >= 0) {
                    predicates.add(criteriaBuilder.and(criteriaBuilder.greaterThanOrEqualTo(root.get("price"), priceLow)));
                }
                if (priceHigh != null && priceHigh >= 0) {
                    predicates.add(criteriaBuilder.and(criteriaBuilder.lessThanOrEqualTo(root.get("price"), priceHigh)));
                }
                return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };
    }
}
