package com.ssm.web;

import com.github.pagehelper.PageInfo;
import com.ssm.entity.TUser;
import com.ssm.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;

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
}
