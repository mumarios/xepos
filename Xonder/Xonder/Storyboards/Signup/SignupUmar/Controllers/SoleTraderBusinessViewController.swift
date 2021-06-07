//
//  SoleTraderBusinessViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 04/06/2021.
//

import UIKit

class SoleTraderBusinessViewController: UIViewController {
    @IBOutlet weak var contBtn: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var accountLbl: UILabel!
    var accType = "Pay Wages"
    
    @IBOutlet weak var businessField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.accountLbl.text  = accType
    }
    
    @IBAction func showDropDown(_ sender: Any) {
        
        let SVC =  UIStoryboard(name: "SignupUmar", bundle: nil).instantiateViewController(identifier: "AccountTypePopViewController")  as! AccountTypePopViewController
       SVC.modalPresentationStyle = .fullScreen
        SVC.modalPresentationStyle = .overCurrentContext
        SVC.modalTransitionStyle = .crossDissolve
        SVC.parentVC = self
       self.present(SVC, animated: true, completion: nil)
        
    }
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func emailValidation(email:String) -> Bool {
      
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let trimmedString = email.trimmingCharacters(in: .whitespaces)
        let validateEmail = NSPredicate(format: "self Matches %@", emailRegex)
        let isValidateEmail = validateEmail.evaluate(with: trimmedString)
        return isValidateEmail
    }
    
    @IBAction func continueAction(_ sender: Any) {
        if businessField.text?.count == 0{
            let alertPopup = UIAlertController(title: "Please Enter Business name", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return
        }else if emailValidation(email: emailField.text!) == false {
            let alertPopup = UIAlertController(title: "Invalid Email Address", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return
        }
        SoleTraderBusiness.shared.businessName = businessField.text
        SoleTraderBusiness.shared.email = emailField.text
        SoleTraderBusiness.shared.purpose  = accountLbl.text
        let storyboard = UIStoryboard(name: "SignupUmar", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SoleTraderBusinessEmailViewController") as! SoleTraderBusinessEmailViewController
            self.navigationController?.pushViewController(destinationVC, animated: true)
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

extension  SoleTraderBusinessViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
