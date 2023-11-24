package com.store.repository;


import java.util.List;
import java.util.Optional;

import com.store.domain.Article;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

public interface ArticleRepository extends JpaRepository<Article, Long>, JpaSpecificationExecutor<Article> {

    @EntityGraph(attributePaths = {"colors", "categories", "types"})
    List<Article> findAllEagerBy();

    @EntityGraph(attributePaths = {"colors", "categories", "types"})
    Optional<Article> findById(Long id);

    @Query("SELECT DISTINCT s.value FROM Color s")
    List<String> findAllColors();

    @Query("SELECT DISTINCT c.name FROM Category c")
    List<String> findAllCategories();

    @Query("SELECT DISTINCT b.name FROM Type b")
    List<String> findAllTypes();

}
