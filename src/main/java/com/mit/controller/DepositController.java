package com.mit.controller;

import java.sql.Timestamp;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mit.model.ContractDTO;
import com.mit.model.DepositDTO;
import com.mit.model.UserDTO;
import com.mit.service.ContractService;
import com.mit.service.DepositService;
import com.mit.service.UserService;

@RequestMapping("/deposit/")
@Controller
public class DepositController {

    private final DepositService DEPOSIT_SERVICE;
    private final UserService USER_SERVICE;
    private final ContractService CONTRACT_SERVICE;

    @Autowired
    public DepositController(DepositService depositService, UserService userService, ContractService contract_SERVICE) {
        this.DEPOSIT_SERVICE = depositService;
        this.USER_SERVICE = userService;
        this.CONTRACT_SERVICE = contract_SERVICE;
    }

    @RequestMapping("showdeposit")
    public String showDeposit(HttpSession session, Authentication authentication, HttpServletRequest request, Model model) {

        UserDTO logIn = (UserDTO) authentication.getPrincipal();
        int userId = logIn.getId();
        ContractDTO contractDTO = CONTRACT_SERVICE.selectContractByUserId(userId);
        if (contractDTO == null) {

         model.addAttribute("contractDTO", contractDTO);
      } else {
        String policyNumber = CONTRACT_SERVICE.selectByUserId(userId);
      /*
       * boolean hasContract = (contractDTO != null); //계약이 있으면 hasContract
       * 
       * if (contractDTO == null) { model.addAttribute("hasContract", hasContract);
       * System.out.println("hasContract 계약정보: " + hasContract); // contractDTO 값이 없을
       * 경우 메인 페이지로 리다이렉트 return "redirect:/"; // 메인 페이지 URL에 맞게 변경 }
       */
        
        int setAmount = CONTRACT_SERVICE.getSetAmountByPolicyNumber(policyNumber);
        String contractStatus = CONTRACT_SERVICE.getContractStatusByPolicyNumber(policyNumber);

        model.addAttribute("logInId", logIn.getId());     
        model.addAttribute("logInName", logIn.getName());
        model.addAttribute("policyNumber", policyNumber);
        model.addAttribute("contractStatus", contractStatus);
        model.addAttribute("setAmount", setAmount);
        model.addAttribute("contractDTO", contractDTO);
      /*
       * System.out.println("가져오니 회원 아이디 " + logIn.getId());
       * System.out.println("가져오니 증번:" + policyNumber);
       * System.out.println("가져오니 계약상태:" + contractStatus);
       * System.out.println("가져오니 계약한도:" + setAmount);
       */
      }
        return "contract/deposit";
    }
    
    @ResponseBody
    @RequestMapping("saveInputAmount")
    public String saveInputAmount(@RequestParam("inputAmount") int inputAmount, Authentication authentication,
            ServletRequest request) {
        System.out.println(123123);
        try {
            UserDTO loggedInUser = (UserDTO) authentication.getPrincipal();
            String policyNumber = CONTRACT_SERVICE.selectByUserId(loggedInUser.getId());
            boolean isKakaoPaymentSuccessful = true; // 카카오 결제가 성공한 것으로 가정합니다.

            if (isKakaoPaymentSuccessful) {

                DepositDTO depositDTO = new DepositDTO();
                depositDTO.setPolicyNumber(policyNumber);
                depositDTO.setInputAmount(inputAmount);
                depositDTO.setWriter(loggedInUser.getName());
                depositDTO.setEntryDate(new Timestamp(System.currentTimeMillis()));
                System.out.println(depositDTO.toString());

                DEPOSIT_SERVICE.insertDeposit(depositDTO);
            }
            return "contract/deposit";

        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
}