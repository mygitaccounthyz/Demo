//package com.midpac.data;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//
//import java.io.File;
//
//@Controller
//public class Ti1 {
//
//    @RequestMapping("upload")
//    public String upload(@RequestParam(name = "img",required = false)MultipartFile file)throws Exception
//    {
//        String filname =file.getOriginalFilename();
//        String path ="E:\\ITLJ\\EE\\duplicate\\comb\\web\\jquery\\";
//        File newFile =new File(path+File.separator+filname);
//        file.transferTo(newFile);
//        return "../../index";
//    }
//}
