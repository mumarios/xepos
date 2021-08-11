//
//  SoleTraderCardViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 30/06/2021.
//

import UIKit

class SoleTraderCardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

     @IBAction func contAct(_ sender: Any) {
        if SoleTraderBusiness.shared.isBusiness{
            let storyboard = UIStoryboard(name: "SignupUmar", bundle: nil)
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "SoleTraderDocPreViewController") as! SoleTraderDocPreViewController
                self.navigationController?.pushViewController(destinationVC, animated: true)
        } else {
        let storyboard = UIStoryboard(name: "SignupUmar", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SoleTraderPersonalInfoConfirmationViewController") as! SoleTraderPersonalInfoConfirmationViewController
            self.navigationController?.pushViewController(destinationVC, animated: true)
        }
     }
     
    @IBAction func backAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
