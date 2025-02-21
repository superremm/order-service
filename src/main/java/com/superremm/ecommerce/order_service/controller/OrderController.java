package com.superremm.ecommerce.order_service.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OrderController {

    @GetMapping("/helloService")
    public String helloService(){
        return "hello service order";
    }
    
}
