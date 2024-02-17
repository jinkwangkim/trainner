package com.interview.trainner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class HelloController {
    @GetMapping("/api/hello")
    public String hello() {
        return "hello";
    }

    @GetMapping("/")
    public String main() {
        return "main";
    }
}
