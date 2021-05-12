//
//  DashboardViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 12/05/2021.
//

import UIKit
class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let drawerViewController = self.storyboard!.instantiateViewController(withIdentifier: "TransactionViewController")
           self.addDrawerView(withViewController: TransactionViewController)
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

}
