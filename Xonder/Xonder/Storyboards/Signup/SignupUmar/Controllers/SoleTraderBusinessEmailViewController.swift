//
//  SoleTraderBusinessEmailViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 04/06/2021.
//

import UIKit

class SoleTraderBusinessEmailViewController: UIViewController {
    @IBOutlet weak var contBttn: UIButton!
    @IBOutlet weak var numberField: UITextField!
    
    @IBOutlet weak var urlField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(SoleTraderBusiness.shared.businessName)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func validateURL(url: String) -> Bool {
            let regex = "http[s]?://(([^/:.[:space:]]+(.[^/:.[:space:]]+)*)|([0-9](.[0-9]{3})))(:[0-9]+)?((/[^?#[:space:]]+)([^#[:space:]]+)?(#.+)?)?"
            let test = NSPredicate(format:"SELF MATCHES %@", regex)
            let result = test.evaluate(with: url)
            return result
     }
    
    @IBAction func contAction(_ sender: Any) {
     
        if urlField.text?.count == 0{
            let alertPopup = UIAlertController(title: "Please enter website url of your business", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return
        } else  if numberField.text!.count < 12 {
            let alertPopup = UIAlertController(title: "Invalid Mobile Number", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.present(alertPopup, animated: true, completion: nil)
            return
        }
        
        SoleTraderBusiness.shared.web  = urlField.text
        SoleTraderBusiness.shared.num = numberField.text
        let storyboard = UIStoryboard(name: "SignupUmar", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SoleTraderBusinessAddressViewController") as! SoleTraderBusinessAddressViewController
            self.navigationController?.pushViewController(destinationVC, animated: true)
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

extension SoleTraderBusinessEmailViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField ==  numberField{
            textField.text = "+44"
        }
    }
}
