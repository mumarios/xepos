//
//  DashboardSelectionViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 19/05/2021.
//

import UIKit

class DashboardSelectionViewController: UIViewController {
    
    var  parentVC: DashboardViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor  = .clear
        self.definesPresentationContext = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor  = .clear
        self.definesPresentationContext = true
    }
    @IBAction func personalAct(_ sender: Any) {
        parentVC.setPersonal()
        
    }
    @IBAction func businessAct(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        parentVC.setBusiness()
        self.dismiss(animated: true, completion: nil)
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
