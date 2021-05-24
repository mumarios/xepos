//
//  SignupBusinessSelectionViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 07/04/2021.
//

import UIKit

class SignupBusinessSelectionViewController: UIViewController {
    
//    var userModel:GoogleAuthValues?
//    
//    var viewModel:SignupViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func companyAction(_ sender: Any) {
    
        
//        let vc = UIStoryboard.init(name: "Signup", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignupMobileViewController") as? SignupMobileViewController
//        self.navigationController?.pushViewController(vc!, animated: true)

//        let vc = UIStoryboard.init(name: "Signup", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignupMobileViewController") as? SignupMobileViewController
//        vc?.modalPresentationStyle = .fullScreen
//        self.present(vc!, animated: true)
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func freeLancerAction(_ sender: Any) {
        
//        let vc = UIStoryboard.init(name: "Signup", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignupMobileViewController") as? SignupMobileViewController
//        vc?.modalPresentationStyle = .fullScreen
//        self.present(vc!, animated: true)
//        self.navigationController?.pushViewController(vc!, animated: true)
        
        let vc = UIStoryboard.init(name: "Signup", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignupMobileViewController") as? SignupMobileViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
        
    }
    
    @IBAction func guestAction(_ sender: Any) {
        
        
        let vc = UIStoryboard.init(name: "Signup", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignupMobileViewController") as? SignupMobileViewController
        self.navigationController?.pushViewController(vc!, animated: true)

//        let vc = UIStoryboard.init(name: "Signup", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignupMobileViewController") as? SignupMobileViewController
//        vc?.modalPresentationStyle = .fullScreen
//        self.present(vc!, animated: true)
//        self.navigationController?.pushViewController(vc!, animated: true)
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
