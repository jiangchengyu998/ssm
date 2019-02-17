package com.ssm.web;

import com.github.pagehelper.PageInfo;
import com.ssm.entity.TUser;
import com.ssm.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController {
    @Resource
    private UserService userService;

    @ResponseBody
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    PageInfo<TUser> page(int pageNum, int pageSize) {
        PageInfo<TUser> page = userService.page(pageNum, pageSize, null);
        return page;
    }

    /**
     * 跳转登录界面
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "login")
    public String login(RedirectAttributes redirectAttributes) {
        return "modules/sys/login";
    }

    /**
     * 登录操作
     */
    @RequestMapping(value = "doLogin")
    public String doLogin(TUser user,RedirectAttributes redirectAttributes,HttpServletRequest request) {
        String password = user.getPassword();
        String username = user.getUsername();
        if (StringUtils.isEmpty(username)) {
            redirectAttributes.addFlashAttribute("msg", "请输入用户名！");
            return "redirect:"+"/login";
        }
        if (StringUtils.isEmpty(password)) {
            redirectAttributes.addFlashAttribute("msg", "请输入密码！");
            redirectAttributes.addFlashAttribute("username", user.getUsername());
            return "redirect:"+"/login";
        }
        TUser login = userService.login(user);
        if (login!=null) {
            request.getSession().setAttribute("login", login);
//            request.getSession().setAttribute("productName", Global.getConfig("productName"));
            return "redirect:"+"/index";
        }else{
            redirectAttributes.addFlashAttribute("msg", "用户名或密码错误！");
            redirectAttributes.addFlashAttribute("username", user.getUsername());
            redirectAttributes.addFlashAttribute("password", user.getPassword());
            return "redirect:"+"/login";
        }
    }

    /**
     * 跳转首页
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "index")
    public String index(RedirectAttributes redirectAttributes) {
        return "modules/sys/index";
    }

    @RequestMapping(value = "userList")
    public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value = "pageSize", defaultValue = "10") int pageSize, TUser user, HttpServletRequest request, HttpServletResponse response, Model model) {
        /**
         * 查看所有的用户
         */
//        TUser login = (TUser) request.getSession().getAttribute("login");
        PageInfo<TUser> page = userService.page(pageNum, pageSize, user);
//        PageInfo<User> page = userService.findPage(user);
        model.addAttribute("pageInfo", page);
        return "modules/sys/userList";
    }

    /**
     * 跳转到添加页面/修改页面
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = "form")
    public String form(TUser user, Model model) {
        if(!StringUtils.isEmpty(user.getId())){
            model.addAttribute("user", userService.getById(user.getId()));
        } else {
            model.addAttribute("user", user);
        }
        return "modules/sys/userForm";
    }


    /**
     * 保存用户
     * @param user
     * @param model
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "user/save")
    public String save(TUser user, Model model, RedirectAttributes redirectAttributes) {
        if(StringUtils.isEmpty(user.getId())){
            userService.add(user);
        } else {
            userService.update(user);
        }
        redirectAttributes.addFlashAttribute("msg", "保存数据成功！");
        return "redirect:/userList";
    }
}
