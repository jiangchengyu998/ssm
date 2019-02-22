package com.ssm.web;


import com.github.pagehelper.PageInfo;
import com.ssm.entity.TClothes;
import com.ssm.service.ClothesService;
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
public class ClothesController {
    @Resource
    private ClothesService clothesService;

    @RequestMapping("/clothes")
    public String clothes(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value =
            "pageSize", defaultValue = "10") int pageSize, TClothes tClothes, HttpServletRequest request,
                          HttpServletResponse response, Model model) {
        PageInfo<TClothes> page = clothesService.page(pageNum, pageSize, tClothes);
        model.addAttribute("pageInfo", page);
        return "modules/erm/clothesList";
    }

    @RequestMapping("/clothes/form")
    public String clothesForm(@RequestParam(value = "id", required = false) Integer id, Model model) {

        if(id != null && id >0){
            TClothes byId = clothesService.getById(id);
            model.addAttribute("clothes",byId);
        }
        return "modules/erm/clothesForm";
    }

    @RequestMapping(value = "/clothes/save", method = RequestMethod.POST)
    public String save(TClothes clothes, RedirectAttributes redirectAttributes) {
        if (StringUtils.isEmpty(clothes.getId())) {
            clothesService.add(clothes);
        } else {
            clothesService.update(clothes);
        }
        redirectAttributes.addFlashAttribute("msg", "保存数据成功！");
        return "redirect:/clothes";
    }

    @RequestMapping("/clothes/delete")
    public String delete(Integer id, RedirectAttributes redirectAttributes) {
        clothesService.deleteById(id);
        redirectAttributes.addFlashAttribute("msg", "删除成功！");
        return "redirect:/clothes";
    }
}
