//
//  SignupBussinessSelectViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/24/21.
//

import UIKit

class SignupBussinessSelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func companyBtnDidPressed(_ sender: Any) {
        performSegue(withIdentifier: "toCountryPicker", sender: self)
    }
    
    @IBAction func freelanceBtnDidPressed(_ sender: Any) {
        performSegue(withIdentifier: "toCountryPicker", sender: self)
    }
    @IBAction func noBusinessBtnDidPressed(_ sender: Any) {
        performSegue(withIdentifier: "toCountryPicker", sender: self)
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
