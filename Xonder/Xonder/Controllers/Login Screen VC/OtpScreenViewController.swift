//
//  OtpScreenViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/10/21.
//

import UIKit
import SVPinView

class OtpScreenViewController: UIViewController {
    
    @IBOutlet weak var pinCodeView: SVPinView!
    
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginBtn.isEnabled = false
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
            self?.loginBtn.isEnabled = ((self?.isValid(Pin: pin)) != nil)
        }
        // Do any additional setup after loading the view.
    }
    
    func isValid(Pin:  String) -> Bool{
        if Pin == "1111"{
            return true
        }
        return  false
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
//        performSegue(withIdentifier: "", sender: self)
         
  
      
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
            self.navigationController?.pushViewController(destinationVC, animated: true)

    }
    
    
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
