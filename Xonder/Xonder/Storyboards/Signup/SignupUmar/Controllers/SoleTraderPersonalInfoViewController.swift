//
//  SoleTraderPersonalInfoViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 04/06/2021.
//

import UIKit

class SoleTraderPersonalInfoViewController: UIViewController {

    @IBOutlet weak var dobField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createDatePicker()
    }
    


    @IBAction func contAct(_ sender: Any) {
//
//        if titleField.text?.count == 0 {
//            let alertPopup = UIAlertController(title: "Please Enter Title", message: "", preferredStyle: .alert)
//            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
//                self.dismiss(animated: true)
//            }))
//            self.navigationController?.present(alertPopup, animated: true, completion: nil)
//            return
//        } else if firstNameField.text?.count == 0 {
//            let alertPopup = UIAlertController(title: "Please Enter First Name", message: "", preferredStyle: .alert)
//            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
//                self.dismiss(animated: true)
//            }))
//            self.navigationController?.present(alertPopup, animated: true, completion: nil)
//            return
//        } else if lastNameField.text?.count == 0 {
//            let alertPopup = UIAlertController(title: "Please Enter Last Name", message: "", preferredStyle: .alert)
//            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
//                self.dismiss(animated: true)
//            }))
//            self.navigationController?.present(alertPopup, animated: true, completion: nil)
//            return
//        } else if dobField.text?.count == 0 {
//            let alertPopup = UIAlertController(title: "Please Enter Date of birth", message: "", preferredStyle: .alert)
//            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
//                self.dismiss(animated: true)
//            }))
//            self.navigationController?.present(alertPopup, animated: true, completion: nil)
//            return
//        }
        
        SoleTraderBusiness.shared.FirstName = firstNameField.text
        SoleTraderBusiness.shared.title = titleField.text
        SoleTraderBusiness.shared.lastName = lastNameField.text
        SoleTraderBusiness.shared.dob = dobField.text
        let storyboard = UIStoryboard(name: "SignupUmar", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SoleTraderBusinessAddressViewController") as! SoleTraderBusinessAddressViewController
        destinationVC.screenMode = .SoleHomeAddress
        self.present(destinationVC, animated: true, completion: nil)
//        self.navigationController?.pushViewController(destinationVC, animated: true)
//        let storyboard = UIStoryboard(name: "SignupUmar", bundle: nil)
//            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SoleTraderHomeAddViewController") as! SoleTraderHomeAddViewController
//            self.navigationController?.pushViewController(destinationVC, animated: true)
        
        
        
        
    }
    @IBAction func backAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func createDatePicker() {
        
        let toolbar  = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        dobField.inputAccessoryView = toolbar
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        dobField.inputView = datePicker
        
    }
    
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        dobField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
}
