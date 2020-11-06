package com.dev24.client.cart.dao;

import java.util.List;

import com.dev24.client.cart.vo.CartVO;

public interface CartDAO {
	public List<CartVO> cartList(CartVO cvo);
	public int cartUpdate(CartVO cvo);
	public int cartDelete(int crt_num);
}
