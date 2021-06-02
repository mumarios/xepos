//
//  SignupGetStartedScreenViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/21/21.
//

import UIKit

class SignupGetStartedScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createBtnPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Signup", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SignupAddMobileViewController") as! SignupAddMobileViewController
            self.navigationController?.pushViewController(destinationVC, animated: true)
        
        //performSegue(withIdentifier: "toSignupMobileScreen", sender: self)
    }
    
    @IBAction func signInBtnDidPressed(_ sender: Any) {
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
