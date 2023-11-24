package com.store.service;

import java.util.List;

import com.store.domain.Order;
import com.store.domain.Shipping;
import com.store.domain.ShoppingCart;
import com.store.domain.User;

public interface OrderService {

	Order createOrder(ShoppingCart shoppingCart, Shipping shippingAddress, User user);
	
	List<Order> findByUser(User user);
	
	Order findOrderWithDetails(Long id);
}
