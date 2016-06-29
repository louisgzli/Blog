package Blog.controller;

import Blog.Util.StatusMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by bliss on 2016/6/29.
 */
@Controller
@RequestMapping("/user")
public class User {
    /**
     * login 跳转页面
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(){
        return "login/login";
    }

    /**
     * 登陆页面参数接收
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "login",method =RequestMethod.POST)
    public StatusMessage login(Model model,String username,String password){

    }

}
