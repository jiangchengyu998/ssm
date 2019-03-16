package com.ssm.web;


import com.github.pagehelper.PageInfo;
import com.ssm.entity.TApply;
import com.ssm.entity.TUser;
import com.ssm.service.ApplyService;
import com.ssm.service.UserService;
import com.ssm.utils.UserUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class ApplyController {


    @Resource
    private ApplyService applyService;
    @Resource
    private UserService userService;

    @RequestMapping("/apply")
    public String apply(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value =
            "pageSize", defaultValue = "10") int pageSize, TApply tApply, HttpServletRequest request,
                          HttpServletResponse response, Model model) {
        // 如果是普通用户，只是查出自己的衣物
        TUser currentUser = UserUtils.getCurrentUser(request);
        if(currentUser.getType().equals("1")){  // 管理员

        }else {// 普通用户
            tApply.setUserId(currentUser.getId());
        }
        PageInfo<TApply> page = applyService.page(pageNum, pageSize, tApply);
        model.addAttribute("pageInfo", page);
        return "modules/erm/applyList";
    }

    @RequestMapping("/apply/form")
    public String applyForm(@RequestParam(value = "id", required = false) Integer id, Model model) {

        if(id != null && id >0){
            TApply byId = applyService.getById(id);
            model.addAttribute("apply",byId);
        }
        PageInfo<TUser> pageInfo = userService.page(1, 0, null);
        model.addAttribute("users",pageInfo.getList());
        return "modules/erm/applyForm";
    }

    @RequestMapping("/apply/applyLogistics")
    public String applyLogistics(@RequestParam(value = "id", required = false) Integer id, Model model) {
       model.addAttribute("id",id);
        return "modules/erm/applyLogistics";
    }

    @RequestMapping(value = "/apply/save", method = RequestMethod.POST)
    public String save(TApply apply, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        if (StringUtils.isEmpty(apply.getId())) {
            TUser currentUser = UserUtils.getCurrentUser(request);
            apply.setUserId(currentUser.getId());
            applyService.add(apply);
        } else {
            applyService.update(apply);
        }
        redirectAttributes.addFlashAttribute("msg", "保存数据成功！");
        return "redirect:/apply";
    }

    @RequestMapping("/apply/delete")
    public String delete(Integer id, RedirectAttributes redirectAttributes) {
        applyService.deleteById(id);
        redirectAttributes.addFlashAttribute("msg", "删除成功！");
        return "redirect:/apply";
    }

    @RequestMapping("/apply/agree")
    public String agree(Integer id, Integer receive, RedirectAttributes redirectAttributes) {
        TApply tApply = new TApply();
        tApply.setId(id);
//        状态（0-用户申请，1-管理员同意（等待用户寄送衣服），2-用户已经寄出衣服，3-管理员收到衣服并且回执。）
        if(receive.equals(1)){
            tApply.setStatus("3");
        }else {
            tApply.setStatus("1");
        }
        applyService.update(tApply);
        redirectAttributes.addFlashAttribute("msg", "删除成功！");
        return "redirect:/apply";
    }
}
