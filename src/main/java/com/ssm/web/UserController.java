package com.ssm.web;

import com.github.pagehelper.PageInfo;
import com.ssm.entity.TUser;
import com.ssm.service.UserService;
import com.ssm.utils.UserUtils;
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
import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Resource
    private UserService userService;

    @ResponseBody
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    PageInfo<TUser> page(int pageNum, int pageSize) {
        PageInfo<TUser> page = userService.page(pageNum, pageSize, null);
        return page;
    }

    /**
     * 跳转登录界面
     *
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "login")
    public String login(RedirectAttributes redirectAttributes) {
        return "modules/sys/login";
    }

    @RequestMapping(value = "register")
    public String register(RedirectAttributes redirectAttributes) {
        return "modules/sys/register";
    }

    @RequestMapping(value = "doRegister")
    public String doRegister(TUser user,RedirectAttributes redirectAttributes,HttpServletRequest request,HttpSession session) {
        String password = user.getPassword();
        String phone = user.getPhone();
        String username = user.getUsername();
        if (StringUtils.isEmpty(username)) {
            redirectAttributes.addFlashAttribute("msg", "请输入用户名！");
            return "redirect:" + "/sys/user/register";
        }
        if (StringUtils.isEmpty(phone)) {
            redirectAttributes.addFlashAttribute("msg", "请输入电话号码！");
            redirectAttributes.addFlashAttribute("username", user.getUsername());
            return "redirect:"+"/sys/user/register";
        }
        String password1 = request.getParameter("password1");

        if (StringUtils.isEmpty(password1)) {
            redirectAttributes.addFlashAttribute("msg", "请输入确认密码！");
            redirectAttributes.addFlashAttribute("phone", user.getPhone());
            redirectAttributes.addFlashAttribute("password", user.getPassword());
            redirectAttributes.addFlashAttribute("username", user.getUsername());
            return "redirect:"+"/sys/user/register";
        }
        if (!password1.equals(password)) {
            redirectAttributes.addFlashAttribute("msg", "两次输入密码不正确！");
            redirectAttributes.addFlashAttribute("phone", user.getPhone());
            redirectAttributes.addFlashAttribute("password", user.getPassword());
            redirectAttributes.addFlashAttribute("password1", password1);
            redirectAttributes.addFlashAttribute("username", user.getUsername());
            return "redirect:"+"/sys/user/register";
        }
        // 获取验证码
        String imageCode = request.getParameter("yzm");
        if (StringUtils.isEmpty(imageCode)) {
            redirectAttributes.addFlashAttribute("imageCode", imageCode);
            redirectAttributes.addFlashAttribute("phone", user.getPhone());
            redirectAttributes.addFlashAttribute("password", user.getPassword());
            redirectAttributes.addFlashAttribute("password1", password1);
            redirectAttributes.addFlashAttribute("username", user.getUsername());
            redirectAttributes.addFlashAttribute("msg", "请输入验证码！");
            return "redirect:"+"/sys/user/register";
        }
        userService.add(user);
        redirectAttributes.addFlashAttribute("phone", user.getPhone());
        redirectAttributes.addFlashAttribute("password", user.getPassword());
        redirectAttributes.addFlashAttribute("msg", "注册成功！");
        return "redirect:"+"/login";
    }
    /**
     * 登录操作
     */
    @RequestMapping(value = "doLogin")
    public String doLogin(TUser user, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        String password = user.getPassword();
        String username = user.getUsername();
        if (StringUtils.isEmpty(username)) {
            redirectAttributes.addFlashAttribute("msg", "请输入用户名！");
            return "redirect:" + "/login";
        }
        if (StringUtils.isEmpty(password)) {
            redirectAttributes.addFlashAttribute("msg", "请输入密码！");
            redirectAttributes.addFlashAttribute("username", user.getUsername());
            return "redirect:" + "/login";
        }
        TUser login = userService.login(user);
        if (login != null) {
            request.getSession().setAttribute("login", login);
//            request.getSession().setAttribute("productName", Global.getConfig("productName"));
            return "redirect:" + "/index";
        } else {
            redirectAttributes.addFlashAttribute("msg", "用户名或密码错误！");
            redirectAttributes.addFlashAttribute("username", user.getUsername());
            redirectAttributes.addFlashAttribute("password", user.getPassword());
            return "redirect:" + "/login";
        }
    }

    /**
     * 跳转首页
     *
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "index")
    public String index(RedirectAttributes redirectAttributes) {
        return "modules/sys/index";
    }

    @RequestMapping(value = "userList")
    public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value =
            "pageSize", defaultValue = "10") int pageSize, TUser user, HttpServletRequest request,
                       HttpServletResponse response, Model model) {
        /**
         * 查看所有的用户
         */
        PageInfo<TUser> page = userService.page(pageNum, pageSize, user);
        model.addAttribute("pageInfo", page);
        return "modules/sys/userList";
    }

    /**
     * 跳转到添加页面/修改页面
     *
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = "form", method = RequestMethod.GET)
    public String form(TUser user, Model model) {
        if (!StringUtils.isEmpty(user.getId())) {
            model.addAttribute("user", userService.getById(user.getId()));
        } else {
            model.addAttribute("user", user);
        }
        return "modules/sys/userForm";
    }


    /**
     * 保存用户
     *
     * @param user
     * @param model
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "user/save")
    public String save(TUser user, Model model, RedirectAttributes redirectAttributes) {
        if (StringUtils.isEmpty(user.getId())) {
            userService.add(user);
        } else {
            userService.update(user);
        }
        redirectAttributes.addFlashAttribute("msg", "保存数据成功！");
        return "redirect:/userList";
    }


    /**
     * 跳转到个人信息界面
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/user/userInfo")
    public String userInfo(Model model, HttpServletRequest request) {
        TUser currentUser = UserUtils.getCurrentUser(request);
        model.addAttribute("user", userService.getById(currentUser.getId()));
        return "modules/sys/userInfo";
    }

    @RequestMapping(value = "/user/updateUserInfo")
    public String updateUserInfo(Model model,TUser user, HttpServletRequest request) {
        userService.update(user);
        TUser currentUser = UserUtils.getCurrentUser(request);
        model.addAttribute("user", userService.getById(currentUser.getId()));
        return "modules/sys/userInfo";
    }

    /**
     * 跳转到修改密码界面
     *
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "/user/repassword")
    public String repassword(RedirectAttributes redirectAttributes) {
        return "modules/sys/repassword";
    }

    /**
     * 修改密码
     *
     * @param oldPassword
     * @param newPassword
     * @param againPassword
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "/user/fixPassword")
    public String fixPassword(HttpServletRequest request, String oldPassword, String newPassword,
                              String againPassword, RedirectAttributes redirectAttributes) {
        boolean flag = true;
        TUser currentUser = UserUtils.getCurrentUser(request);
        if (StringUtils.isEmpty(oldPassword)) {
            redirectAttributes.addFlashAttribute("msg", "请输入旧密码！");
        } else if (StringUtils.isEmpty(newPassword)) {
            redirectAttributes.addFlashAttribute("msg", "请输入新密码！");
        } else if (StringUtils.isEmpty(againPassword)) {
            redirectAttributes.addFlashAttribute("msg", "请输入确认密码！");
        } else if (!currentUser.getPassword().equals(oldPassword)) {
            redirectAttributes.addFlashAttribute("msg", "旧密码验证不通过！");
        } else if (!newPassword.equals(againPassword)) {
            redirectAttributes.addFlashAttribute("msg", "确认密码不一致！");
        } else {
            currentUser.setPassword(newPassword);
            userService.update(currentUser);
            redirectAttributes.addFlashAttribute("msg", "修改成功！");
            flag = false;
        }
        //验证不通过设置回显信息
        if (flag) {
            redirectAttributes.addFlashAttribute("oldPassword", oldPassword);
            redirectAttributes.addFlashAttribute("newPassword", newPassword);
            redirectAttributes.addFlashAttribute("againPassword", againPassword);
        }
        return "redirect:" + "/user/repassword";
    }

    /**
     * 跳转登录界面
     *
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "/user/logout")
    public String logout(RedirectAttributes redirectAttributes, HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:" + "/login";
    }

    @RequestMapping(value = "/user/delete")
    public String delete(int id, RedirectAttributes redirectAttributes) {
        userService.deleteById(id);
        redirectAttributes.addFlashAttribute("msg", "删除记录成功！");
        return "redirect:" + "/userList";
    }

}
