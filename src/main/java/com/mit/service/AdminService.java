package com.mit.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Repository;
import org.springframework.http.MediaType;
import java.net.URLEncoder;


@Repository
public class AdminService {
    private final SqlSession SESSION;
    
    @Autowired
       public AdminService(SqlSession session) {
           this.SESSION = session;
       }

   //0818엑셀다운로드 추가 
   public boolean csvfileDownLoad(HttpServletRequest request, HttpServletResponse response, String downloadPath)throws IOException {
        //(1) 기본 ajax요청 시 응답
       String filenameReal = request.getParameter("FileName");
       System.out.println("다운로드할 파일 이름: " +filenameReal);
       if (filenameReal == null || filenameReal.equals("")) {
           return false;
       }

       String fileRoot = downloadPath ; 
        System.out.println("downloadPath : " + downloadPath); 

       //(2) ContentType설정
       response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
       response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode("productExcelForm.csv","UTF-8")+"\";");
       response.setHeader("Content-Transfer-Encoding", "binary");

       //(3) 파일읽어 응답하기
       byte[] fileByte = FileUtils.readFileToByteArray(new File(fileRoot+"productExcelForm.csv"));
       response.getOutputStream().write(fileByte);
       response.getOutputStream().flush();
       response.getOutputStream().close();
       return true;
      
   }

}


