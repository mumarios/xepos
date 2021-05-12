//
//  MasterViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 11/05/2021.
//

import UIKit

class MasterViewController: UIViewController {
    
    //MARK:- IBOUTLETS
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var paymentsBtn: UIButton!
    @IBOutlet weak var spendingBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton! 
    @IBOutlet weak var cardBtn: UIButton!
    @IBOutlet weak var transactionBtn: UIButton!
    
    
    //MARK:-UIVIEW Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let dashboard = self.storyboard?.instantiateViewController(identifier: "DashboardViewController") as? DashboardViewController else {return}
        contentView.addSubview(dashboard.view)
        dashboard.didMove(toParent: self) 
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Actions
    @IBAction func showSettings(_ sender: Any) {
    }
    
    @IBAction func showPayments(_ sender: Any) {
    }
    
    @IBAction func showSpending(_ sender: Any) {
    }
    
    @IBAction func showHome(_ sender: Any) {
    }
    
    @IBAction func showCard(_ sender: Any) {
    }
    
    @IBAction func showTransactions(_ sender: Any) {
    }
    
}
