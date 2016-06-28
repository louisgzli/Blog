package Blog.controller;

import Blog.Util.StatusMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by CrazyCodess on 2016/6/28.
 */
@Controller
@RequestMapping("/")
public class login {


    @RequestMapping(value = "/login" , method = RequestMethod.GET)
    public String login(){
        return "login/login";
    }
    @ResponseBody
    @RequestMapping(value = "/login" ,method= RequestMethod.POST)
    public StatusMessage login(Model model,String username,String password){
        model.addAttribute("loginMsg","登陆成功！");
        StatusMessage statusMessage=new StatusMessage(0,"登陆成功！");
        statusMessage.setStatus(1);

        return statusMessage;
    }
}
