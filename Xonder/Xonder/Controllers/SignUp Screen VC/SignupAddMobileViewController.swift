//
//  SignupAddMobileViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/24/21.
//

import UIKit

class SignupAddMobileViewController: UIViewController {

    @IBOutlet weak var numberField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func sendOtpProcess() {
        APIService.sendOtp(userObj: ["phone":"+44\(self.numberField.text!)"]){
            (result) in
            switch result{
            case .success(let msg):
                print(msg)
                let storyboard = UIStoryboard(name: "Signup", bundle: nil)
                    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SignupVerifyNumberViewController") as! SignupVerifyNumberViewController
                destinationVC.mobileNumber = self.numberField.text ?? ""
                    self.navigationController?.pushViewController(destinationVC, animated: true)
                break
            case .failure(let msg):
                let alertPopup = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
                alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                    self.dismiss(animated: true)
                }))
                self.present(alertPopup, animated: true, completion: nil)
//                remove code
//                let storyboard = UIStoryboard(name: "Signup", bundle: nil)
//                    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SignupVerifyNumberViewController") as! SignupVerifyNumberViewController
//                destinationVC.mobileNumber = self.numberField.text ?? ""
//                    self.navigationController?.pushViewController(destinationVC, animated: true)
                break
            }
            

            
        }
    }
    
    @IBAction func continueBtnDidPressed(_ sender: Any) {
        
        if numberField.text!.count < 9 {
            let alertPopup = UIAlertController(title: "Invalid Mobile Number", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.present(alertPopup, animated: true, completion: nil)
            return
        }
        sendOtpProcess()
  
        
        
//        performSegue(withIdentifier: "toSignupVerifyScreen", sender: self)
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
