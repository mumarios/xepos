//
//  SignupVerifyNumberViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/21/21.
//

import UIKit
import SVPinView
import Foundation

class SignupVerifyNumberViewController: UIViewController {
    
    
    @IBOutlet weak var verifyBtn: UIButton!
    @IBOutlet weak var wrongCodee: UIButton!
    @IBOutlet weak var hintField: UILabel!
    @IBOutlet weak var pinCodeView: SVPinView!
    var mobileNumber  =  String()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.verifyBtn.isEnabled = false
        self.hintField.text = "Please enter the 6 digit code sent to +44\(mobileNumber) through SMS"
        pinCodeView.pinLength = 6
        pinCodeView.secureCharacter = "\u{25CF}"
        pinCodeView.interSpace = 3
        pinCodeView.textColor = UIColor.black
        pinCodeView.shouldSecureText = true
        pinCodeView.style = .box

        pinCodeView.borderLineColor = UIColor.black
        pinCodeView.activeBorderLineColor = UIColor.lightGray
        pinCodeView.borderLineThickness = 1
        pinCodeView.activeBorderLineThickness = 3

        pinCodeView.font = UIFont.systemFont(ofSize: 15)
        pinCodeView.keyboardType = .phonePad
        pinCodeView.keyboardAppearance = .default
        pinCodeView.pinInputAccessoryView = UIView()
    //    pinCodeView.placeholder = "******"
        pinCodeView.becomeFirstResponderAtIndex = 0
        pinCodeView.didFinishCallback = { [weak self] pin in
            self?.verifyBtn.isEnabled = ((self?.isValid(Pin: pin)) != nil)
        }

        // Do any additional setup after loading the view.
    }
    
    func verifyOtpProcess() {
        APIService.verifOtp(userObj: ["verification_code":"\(self.pinCodeView.getPin())", "phone": "+44\(self.mobileNumber)"]){
            result in
            
            switch result{
            case .success(let msg):
                print(msg)
                    let storyboard = UIStoryboard(name: "Signup", bundle: nil)
                        let destinationVC = storyboard.instantiateViewController(withIdentifier: "SignupBussinessSelectViewController") as! SignupBussinessSelectViewController
                        self.navigationController?.pushViewController(destinationVC, animated: true)
            case .failure(let msg):
                print(msg)
                //remove code
//                let storyboard = UIStoryboard(name: "Signup", bundle: nil)
//                    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SignupBussinessSelectViewController") as! SignupBussinessSelectViewController
//                    self.navigationController?.pushViewController(destinationVC, animated: true)
                
                
                self.wrongCodee.isHidden = false
            }
            
        }
        
     
    }
    
    
    
    func isValid(Pin:  String) -> Bool{
        if Pin == "1111"{
            return true
        }
        return  false
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        verifyOtpProcess()
//        performSegue(withIdentifier: "toSignupBussinesTypeScreen", sender: self)
        
        
//        let storyboard = UIStoryboard(name: "Signup", bundle: nil)
//            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SignupBussinessSelectViewController") as! SignupBussinessSelectViewController
//            self.navigationController?.pushViewController(destinationVC, animated: true)
//

    }

    @IBAction func resendCodeAction(_ sender: Any) {
        self.wrongCodee.isHidden = true
        sendOtpProcess()
    }
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func sendOtpProcess() {
        APIService.sendOtp(userObj: ["phone":"+44\(self.mobileNumber)"]){
            (success) in
            
 
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
