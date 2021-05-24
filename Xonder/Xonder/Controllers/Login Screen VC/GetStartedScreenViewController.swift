//
//  GetStartedScreenViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/10/21.
//

import UIKit

class GetStartedScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func getStartedBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "toLoginScreen", sender: self)

        
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
