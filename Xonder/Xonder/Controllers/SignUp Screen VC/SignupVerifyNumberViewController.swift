//
//  SignupVerifyNumberViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/21/21.
//

import UIKit
import SVPinView


class SignupVerifyNumberViewController: UIViewController {
    
    
    @IBOutlet weak var verifyBtn: UIButton!
    @IBOutlet weak var hintField: UILabel!
    @IBOutlet weak var pinCodeView: SVPinView!
    var mobileNumber  =  String()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.verifyBtn.isEnabled = false
        self.hintField.text = "Please enter the 4 digit code sent to +44\(mobileNumber) through SMS"
        pinCodeView.pinLength = 4
        pinCodeView.secureCharacter = "\u{25CF}"
        pinCodeView.interSpace = 4
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
        
    }
    
    func isValid(Pin:  String) -> Bool{
        if Pin == "1111"{
            return true
        }
        return  false
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
//        performSegue(withIdentifier: "toSignupBussinesTypeScreen", sender: self)
        let storyboard = UIStoryboard(name: "Signup", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SignupBussinessSelectViewController") as! SignupBussinessSelectViewController
            self.navigationController?.pushViewController(destinationVC, animated: true)
        

    }

    @IBAction func resendCodeAction(_ sender: Any) {
    }
    @IBAction func backAction(_ sender: Any) {
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
