package Blog.controller;

import Blog.Util.StatusMessage;
import Blog.dao.UserDao;
import Blog.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by bliss on 2016/6/29.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserDao userDao;
    /**
     * login 跳转页面
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(){
        return "register/login";
    }

    /**
     * 登陆页面参数接收
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/login",method =RequestMethod.POST)
    public StatusMessage login(String username,String password,HttpSession session){
        //判断是否有此用户
        StatusMessage statusMessage = new StatusMessage(0,"登陆成功");

        if( username ==null||username.length()==0)
        {
            statusMessage.setMessage("请填写用户名");
            statusMessage.setStatus(0);
            return statusMessage;
        }
        User user=userDao.getUserByName(username);
        if(password ==null||password.length()==0){
            statusMessage.setMessage("请填写密码");
            statusMessage.setStatus(0);
            return statusMessage;
        }
        else if(!password .equals(user.getPassword())){
            statusMessage.setMessage("密码错误");
            statusMessage.setStatus(0);
        }
        else {
            statusMessage.setMessage("登陆成功！");
            statusMessage.setStatus(1);
        }
        session.setAttribute("user",user);
        return statusMessage;
    }

    /**
     * 注册页面跳转
     * @return
     */
    @RequestMapping(value = "/register" , method = RequestMethod.GET)
    public String register(){
        return "register/register";
    }
    /**
     * 注册参数传入
     */
    @ResponseBody
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public StatusMessage register(Model model,
                                  String username, String password, String email, String sex, String interest, String city, HttpSession session){

        StatusMessage statusMessage = new StatusMessage(1,"注册成功");
        User user  = new User();
        if(username!=""){
            user.setUsername(username);
            statusMessage.setStatus(1);

        }
        else{
            //model.addAttribute("registerMessage","请设置用户名");
            statusMessage.setMessage("请设置用户名");
            statusMessage.setStatus(0);
            return statusMessage;
        }
        if(password!=""){
            user.setPassword(password);
            statusMessage.setStatus(1);
        }
        else{
            statusMessage.setMessage("请设置密码");
            statusMessage.setStatus(0);
            return statusMessage;
        }
        if(sex!=""){
            user.setSex(sex);
        }
        else{
            statusMessage.setMessage("请选择性别");
            statusMessage.setStatus(0);
            return statusMessage;
        }
        if(email!=""){
            user.setEmail(email);
            statusMessage.setStatus(1);
        }

        else{
            statusMessage.setMessage("请填写邮箱");
            statusMessage.setStatus(0);
            return statusMessage;
        }
        if(city!=""){
            user.setCity(city);
            statusMessage.setStatus(1);
        }

        else{
            statusMessage.setMessage("请填写城市");
            statusMessage.setStatus(0);
            return statusMessage;
        }
        if(interest!=""){
            user.setInterest(interest);
            statusMessage.setStatus(1);
        }

        else{
            statusMessage.setMessage("请填写兴趣");
            statusMessage.setStatus(0);
            return statusMessage;
        }
        session.setAttribute("user",user);
        userDao.save(user);
        model.addAttribute("registerMessage","注册成功");
        statusMessage.setStatus(1);
        return statusMessage;
    }

    @RequestMapping(value = "/logout" , method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "MainPage/index";
    }
}
