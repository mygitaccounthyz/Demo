package com.midpac.data;

import com.midpac.data.service.GoodService;
import com.midpac.model.Good;
import com.midpac.utils.Pac;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class FuzzyQ {

    @Resource
    private GoodService goodService;

    @RequestMapping("/query")
    @ResponseBody
    public List query(String search, HttpSession session) throws Exception{

        List<Pac> list = (List<Pac>) session.getAttribute("list");

        if (list==null){
            list=new ArrayList<>();
            List<Good> allGoods = goodService.getAllGoods();
            if (allGoods==null||allGoods.isEmpty()){
                session.setAttribute("list",list);
                return list;
            }
            for (Good good : allGoods) {
                list.add(new Pac(good.getName(),good.getId()));
            }session.setAttribute("list",list);
        }
        if (list.isEmpty())return list;
        List<Pac> res =new ArrayList<>();

        int max =4;
        for (Pac pac : list) {
            if (pac.getGName().contains(search)){

                res.add(pac);
                max--;
                System.out.println("--"+max);
                if (max<1)break;
            }
        }
        System.out.println(max+"ret");
        return res;
    }

}
