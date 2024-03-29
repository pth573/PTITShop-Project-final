package com.store.service.impl;

import java.util.Optional;

import com.store.domain.Article;
import com.store.domain.CartItem;
import com.store.domain.ShoppingCart;
import com.store.domain.User;
import com.store.repository.CartItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.store.service.ShoppingCartService;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {

    @Autowired
    private CartItemRepository cartItemRepository;

    @Override
    public ShoppingCart getShoppingCart(User user) {
        return new ShoppingCart(cartItemRepository.findAllByUserAndOrderIsNull(user));
    }

    @Override
    @Cacheable("itemcount")
    public int getItemsNumber(User user) {
        return cartItemRepository.countDistinctByUserAndOrderIsNull(user);
    }

    @Override
    public CartItem findCartItemById(Long cartItemId) {
        Optional<CartItem> opt = cartItemRepository.findById(cartItemId);
        return opt.get();
    }

    @Override
    @CacheEvict(value = "itemcount", allEntries = true)
    public CartItem addArticleToShoppingCart(Article article, User user, int qty, String color) {
        ShoppingCart shoppingCart = this.getShoppingCart(user);
        CartItem cartItem = shoppingCart.findCartItemByArticleAndColor(article.getId(), color);
        if (cartItem != null && cartItem.hasSameColorThan(color)) {
            cartItem.addQuantity(qty);
            cartItem.setColor(color);
            cartItem = cartItemRepository.save(cartItem);
        } else {
            cartItem = new CartItem();
            cartItem.setUser(user);
            cartItem.setArticle(article);
            cartItem.setQty(qty);
            cartItem.setColor(color);
            cartItem = cartItemRepository.save(cartItem);
        }
        return cartItem;
    }

    @Override
    @CacheEvict(value = "itemcount", allEntries = true)
    public void removeCartItem(CartItem cartItem) {
        cartItemRepository.deleteById(cartItem.getId());
    }

    @Override
    @CacheEvict(value = "itemcount", allEntries = true)
    public void updateCartItem(CartItem cartItem, Integer qty) {
        if (qty == null || qty <= 0) {
            this.removeCartItem(cartItem);
        } else if (cartItem.getArticle().hasStock(qty)) {
            cartItem.setQty(qty);
            cartItemRepository.save(cartItem);
        }
    }

    @Override
    @CacheEvict(value = "itemcount", allEntries = true)
    public void clearShoppingCart(User user) {
        cartItemRepository.deleteAllByUserAndOrderIsNull(user);
    }
}
