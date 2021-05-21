//
//  LoginScreenViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/10/21.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func emailValidation(email:String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let trimmedString = email.trimmingCharacters(in: .whitespaces)
        let validateEmail = NSPredicate(format: "self Matches %@", emailRegex)
        let isValidateEmail = validateEmail.evaluate(with: trimmedString)
        return isValidateEmail
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        
        if emailValidation(email: emailTxtField.text!) == false {
            let alertPopup = UIAlertController(title: "Invalid Email Address", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            
            let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
                self.navigationController?.pushViewController(destinationVC, animated: true)
        //    performSegue(withIdentifier: "toOtpScreen", sender: self)
            return
        }

    }
    
//    @IBAction func btnSignupPressed(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
//            let destinationVC = storyboard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
//            self.navigationController?.pushViewController(destinationVC, animated: true)
//        
//    }

    @IBAction func signupBtnPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Signup", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SignupGetStartedScreenViewController") as! SignupGetStartedScreenViewController
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
