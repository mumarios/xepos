//
//  AccountTypePopViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 04/06/2021.
//

import UIKit

class AccountTypePopViewController: UIViewController {
    
    @IBOutlet weak var tblViewHeight: NSLayoutConstraint!
    var array = ["Pay Wages", "Billing", "Others"]
     var parentVC: SoleTraderBusinessViewController?

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let height = 40 * array.count
        tblViewHeight.constant = CGFloat(height)
        self.view.layoutIfNeeded()
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

extension AccountTypePopViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AccountTypeTableViewCell", for: indexPath) as? AccountTypeTableViewCell{
            cell.titleLbl.text = array[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = parentVC{
            vc.accountLbl.text = array[indexPath.row]
            self.dismiss(animated: true, completion: nil)
        }
    }
}
