package com.interview.trainner;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @GetMapping("/api/hello")dddd
    public String hello() {
        return "hello";
    }
}
