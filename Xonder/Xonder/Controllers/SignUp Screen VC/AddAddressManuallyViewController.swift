//
//  AddAddressManuallyViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/24/21.
//

import UIKit

class AddAddressManuallyViewController: UIViewController {

    @IBOutlet weak var addressField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func continueBtnDidPressed(_ sender: Any) {
        if addressField.text?.count == 0{
            let alertPopup = UIAlertController(title: "Please enter your address", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return
        }
        
        SoleTraderBusiness.shared.personalAdd = addressField.text
        
        let storyboard = UIStoryboard(name: "SignupUmar", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SoleTraderPersonalInfoViewController") as! SoleTraderPersonalInfoViewController
            self.navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    @IBAction func backAct(_ sender: Any) {
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
extension AddAddressManuallyViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
