//
//  DocumentReadmeViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 12/07/2021.
//

import UIKit

class DocumentReadmeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func gotitAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "SignupUmar", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "DocumentScanViewController") as! DocumentScanViewController
            self.navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
