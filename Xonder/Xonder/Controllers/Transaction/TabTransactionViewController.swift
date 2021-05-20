//
//  TabTransactionViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 19/05/2021.
//

import UIKit

class TabTransactionViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var colView: UICollectionView!
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.rowHeight = UITableView.automaticDimension
        tblView.estimatedRowHeight = UITableView.automaticDimension
        topView.roundCorners([.topLeft, .topRight], radius: 12)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func homeAct(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: false)
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

extension  TabTransactionViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell", for: indexPath) as! TransactionTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Transaction", bundle: nil).instantiateViewController(identifier: "TransactionDetailViewController") as! TransactionDetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
