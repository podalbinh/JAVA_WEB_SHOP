package com.example.demo.services.Imp;

import com.example.demo.repositories.CartItemRepository;
import com.example.demo.repositories.UserRepository;
import com.example.demo.repositories.ProductRepository;
import com.example.demo.repositories.SizeRepository;
import com.example.demo.security.AuthService;
import com.example.demo.services.CartItemService;
import com.example.demo.entities.CartItem;
import com.example.demo.entities.Size;
import com.example.demo.models.CartItemDTO;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.http.HttpStatus;

import java.util.List;

@Service
public class CartItemServiceImp implements CartItemService {

    private final CartItemRepository cartItemRepository;
    private final UserRepository userRepository;
    private final ProductRepository productRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private AuthService authService;

    @Autowired
    private ProductServiceImp productService;

    @Autowired
    private SizeServiceImp sizeService;

    public CartItemServiceImp(final CartItemRepository cartItemRepository, final UserRepository userRepository,
            final ProductRepository productRepository, final SizeRepository sizeRepository) {
        this.cartItemRepository = cartItemRepository;
        this.userRepository = userRepository;
        this.productRepository = productRepository;
    }

    @Override
    public List<CartItem> findAllByUserId() {
        return cartItemRepository.findAllByUserId(authService.getCurrentUserId());
    }

    @Override
    public void deleteAllByUserId() {
        cartItemRepository.deleteAllByUserId(authService.getCurrentUserId());
    }

    @Override
    public CartItem get(final Long id) {
        return cartItemRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Can't find cartItem with id: " + id));
    }

    @Override
    @Transactional
    public CartItem create(CartItemDTO cartItemDTO) {
        CartItem cartItem = cartItemRepository.findByUserIdAndProductId(authService.getCurrentUserId(),
                cartItemDTO.getProductId());
        cartItem = new CartItem();
        cartItem.setQuantity(cartItemDTO.getQuantity());
        cartItem.setUser(authService.getCurrentUser());
        cartItem.setProduct(productService.get(cartItemDTO.getProductId()));
        cartItem.setSize(sizeService.get(cartItemDTO.getSize()));
        cartItemRepository.save(cartItem);
        return cartItem;
    }

    @Override
    public CartItem update(Long id, CartItemDTO cartItemDTO) {
        CartItem cartItem = cartItemRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND,
                        "Can't find cartItem with id: " + id + " to update", null));
        cartItem.setQuantity(cartItemDTO.getQuantity());
        cartItem.setSize(sizeService.get(cartItemDTO.getSize()));
        cartItemRepository.save(cartItem);
        return cartItem;
    }

    @Override
    public void delete(Long id) {
        cartItemRepository.deleteById(id);
    }

}