package Blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by CrazyCodess on 2016/6/29.
 */
@Controller
@RequestMapping("/")
public class IndexController {
    @RequestMapping(value = "/index" ,method= RequestMethod.GET)
    public String index(){
        return "MainPage/index";
    }

}
