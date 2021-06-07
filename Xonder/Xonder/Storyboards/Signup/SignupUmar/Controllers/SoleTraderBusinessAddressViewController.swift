//
//  SoleTraderBusinessAddressViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 04/06/2021.
//

import UIKit

class SoleTraderBusinessAddressViewController: UIViewController {
    @IBOutlet weak var postalField: UITextField!
    @IBOutlet weak var contBttn: UIButton!
    
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func contAction(_ sender: Any) {
        
        if postalField.text?.count == 0{
            let alertPopup = UIAlertController(title: "Please Enter Postal Code", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return
        } else if addressField.text?.count == 0{
            let alertPopup = UIAlertController(title: "Please Enter Company Address", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return
        } else if cityField.text?.count == 0{
            let alertPopup = UIAlertController(title: "Please Enter City Name", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return
        }
        SoleTraderBusiness.shared.city = cityField.text
        SoleTraderBusiness.shared.country = "United Kingdom"
        SoleTraderBusiness.shared.postal  = postalField.text
        SoleTraderBusiness.shared.address  = addressField.text
        let storyboard = UIStoryboard(name: "SignupUmar", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SoleTraderBusinessConformationViewController") as! SoleTraderBusinessConformationViewController
            self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
}

extension SoleTraderBusinessAddressViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
