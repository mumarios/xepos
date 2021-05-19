//
//  SignupOTPViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 07/04/2021.
//

import UIKit
import SVPinView
class SignupOTPViewController: UIViewController {

    @IBOutlet weak var pinView: SVPinView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        pinView.pinLength = 6
        pinView.secureCharacter = "\u{25CF}"
        pinView.interSpace = 5
        pinView.textColor = UIColor.black
        pinView.shouldSecureText = true
        pinView.style = .box

        pinView.borderLineColor = UIColor.black
        pinView.activeBorderLineColor = UIColor.lightGray
        pinView.borderLineThickness = 1
        pinView.activeBorderLineThickness = 3

        pinView.font = UIFont.systemFont(ofSize: 15)
        pinView.keyboardType = .phonePad
        pinView.keyboardAppearance = .default
        pinView.pinInputAccessoryView = UIView()
    //    pinView.placeholder = "******"
        pinView.becomeFirstResponderAtIndex = 0
        
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func `continue`(_ sender: Any) {
        
//        let vc = UIStoryboard.init(name: "Signup", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignupAddressViewController") as? SignupAddressViewController
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func backk(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
