package com.ssm.web;


import com.github.pagehelper.PageInfo;
import com.ssm.entity.TClothesType;
import com.ssm.service.ClothesTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class ClothesTypeController {
    @Resource
    private ClothesTypeService clothesTypeService;

    @RequestMapping("/clothesType")
    public String clothesType(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value =
            "pageSize", defaultValue = "10") int pageSize, TClothesType tClothesType, HttpServletRequest request,
                          HttpServletResponse response, Model model) {
        PageInfo<TClothesType> page = clothesTypeService.page(pageNum, pageSize, tClothesType);
        model.addAttribute("pageInfo", page);
        model.addAttribute("clothesType", tClothesType);
        return "modules/erm/clothesTypeList";
    }

    @RequestMapping("/clothesType/form")
    public String clothesTypeForm(@RequestParam(value = "id", required = false) Integer id, Model model) {

        if(id != null && id >0){
            TClothesType byId = clothesTypeService.getById(id);
            model.addAttribute("clothesType",byId);
        }
        return "modules/erm/clothesTypeForm";
    }

    @RequestMapping("/clothesType/save")
    public String save(TClothesType clothesType, RedirectAttributes redirectAttributes) {
        if (StringUtils.isEmpty(clothesType.getId())) {
            clothesTypeService.add(clothesType);
        } else {
            clothesTypeService.update(clothesType);
        }
        redirectAttributes.addFlashAttribute("msg", "保存数据成功！");
        return "redirect:/clothesType";
    }

    @RequestMapping("/clothesType/delete")
    public String delete(Integer id, RedirectAttributes redirectAttributes) {
        clothesTypeService.deleteById(id);
        redirectAttributes.addFlashAttribute("msg", "删除成功！");
        return "redirect:/clothesType";
    }
}
