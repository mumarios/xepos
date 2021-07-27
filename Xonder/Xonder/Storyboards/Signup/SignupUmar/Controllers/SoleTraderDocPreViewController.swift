//
//  SoleTraderDocPreViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 30/06/2021.
//

import UIKit

class SoleTraderDocPreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 
     @IBAction func conAct(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "SignupUmar", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SoleTraderDocumenttSelectionViewController") as! SoleTraderDocumenttSelectionViewController
            self.navigationController?.pushViewController(destinationVC, animated: true)
     }
     
    @IBAction func backAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
