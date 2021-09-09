package com.kinghand.controller;

import com.kinghand.domain.User;
import com.kinghand.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/showIndex")
    public String showIndex() {
        return "index";
    }

    @RequestMapping(value = "login1",method = RequestMethod.POST)
    public ModelAndView login1(HttpSession session, int id) {
        User user = userService.findById(id);
        ModelAndView modelAndView = new ModelAndView();
        String viewName = null;
        if (user != null) {
            if (user.getState().equals("1")) {
                if (user.getNumberOfPasswordError() < 2) {
                    viewName = "login2";
                    session.setAttribute("user", user);
                } else {
                    viewName = "redirect:/client/passwordError.jsp";
                }
            } else {
                viewName = "login1";
                modelAndView.addObject("iE", "您的账号未激活成功，请重新注册");
            }
        } else {
            viewName = "login1";
            modelAndView.addObject("cE", "您输入的卡号不存在，请重新输入");
        }

        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @RequestMapping("/login2")
    public ModelAndView login2(HttpSession session, String password) {
        ModelAndView modelAndView = new ModelAndView();
        String viewName = null;
        User user = (User) session.getAttribute("user");
        int numberOfPasswordError = user.getNumberOfPasswordError();
        if (password.equals(user.getPassword())) {
            user.setNumberOfPasswordError(0);
            viewName = "redirect:/client/choose.jsp";
        } else {
            if (numberOfPasswordError < 2) {
                viewName = "login2";
                modelAndView.addObject("pE", "您的密码错误请重新输入");
                user.setNumberOfPasswordError(numberOfPasswordError + 1);
            } else {
                viewName = "redirect:/client/passwordError.jsp";
            }
        }
        userService.updateNumberOfPasswordError(user);
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @RequestMapping("/cash")
    public ModelAndView cash(HttpSession session, int cash) {
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) session.getAttribute("user");
        String viewName = null;
        String cN = null;
        if (cash > 0 && cash <= 5000 && cash % 100 == 0) {
            user=userService.cash(cash, user);
            if (user!=null) {
                session.setAttribute("user", user);
                viewName = "redirect:/client/tradeSuc.jsp";
            } else {
                cN = "您的余额不足，请重新输入，或选择返回";
                viewName = "cash";
            }
        } else {
            cN = "您输入的金额不符合本机器要求，请重新输入，或选择返回";
            viewName = "cash";
        }
        modelAndView.addObject("cN", cN);
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
    @RequestMapping(value = "/check")
    public String check(HttpSession session, Model model, String url, @RequestParam(value = "cardNO",required = false)Integer cardNO, double deposit){
        User user= (User) session.getAttribute("user");
        if (url.equals("deposit.jsp")){
            if (deposit>0&&deposit<=5000&&deposit%100==0){
                model.addAttribute("cardNO", user.getId());
                model.addAttribute("method","deposit");
            }else {
                model.addAttribute("dN","您输入的金额不符合本机器要求，请重新输入，或选择返回");
                return "deposit";
            }
        }else {
            User user1=userService.findById(cardNO);
            if (cardNO!=user.getId()){
                if (user1!=null){
                    if (deposit>0){
                        if (user.getMoney()>=deposit){
                            session.setAttribute("user1", user1);
                            model.addAttribute("cardNO", cardNO);
                            model.addAttribute("method","transfer");
                        }else {
                            model.addAttribute("tDE","您的余额不足，请重新输入");
                            return "transfer";
                        }
                    }else {
                        model.addAttribute("tDE","转账金额必须大于0，请重新输入");
                        return "transfer";                    }
                }else {
                    model.addAttribute("tCE","您输入的卡号不存在，请重新输入");
                    return "transfer";
                }
            }else {
                model.addAttribute("tCE","您不能转账给您正在使用的该账户");
                return "transfer";
            }
        }
        model.addAttribute("deposit", deposit);
        return "check";
    }
    @RequestMapping("/deposit")
    public String deposit(HttpSession session,double deposit){
        User user= (User) session.getAttribute("user");
        user=userService.deposit(deposit,user);
        session.setAttribute("user",user);
        return "redirect:/client/tradeSuc.jsp";
    }
    @RequestMapping("transfer")
    public String transfer(HttpSession session, double deposit){
        User user= (User) session.getAttribute("user");
        User user1= (User) session.getAttribute("user1");
        user=userService.transfer(deposit,user,user1);
        session.setAttribute("user",user);
        session.removeAttribute("user1");
        return "redirect:/client/tradeSuc.jsp";
    }
}
