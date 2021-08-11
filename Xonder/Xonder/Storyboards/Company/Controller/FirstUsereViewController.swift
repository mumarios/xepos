//
//  FirstUsereViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 06/08/2021.
//

import UIKit

class FirstUsereViewController: UIViewController {
    @IBOutlet weak var titleLbl: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var dobLbl: UITextField!
    @IBOutlet weak var numberOfShares: UITextField!
    @IBOutlet weak var emailAdd: UITextField!
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        // Do any additional setup after loading the view.
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doneAct(_ sender: Any) {
        
        if titleLbl.text?.count == 0 {
            let alertPopup = UIAlertController(title: "Please Enter Title", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return
        } else if firstName.text?.count == 0 {
            let alertPopup = UIAlertController(title: "Please Enter First Name", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return
        } else if lastName.text?.count == 0 {
            let alertPopup = UIAlertController(title: "Please Enter Last Name", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return
        } else if dobLbl.text?.count == 0 {
            let alertPopup = UIAlertController(title: "Please Enter Date of birth", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return
        }else if emailAdd.text?.count == 0 {
            let alertPopup = UIAlertController(title: "Please Enter Email", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return
        }else if numberOfShares.text?.count == 0 {
            let alertPopup = UIAlertController(title: "Please Enter Number of shares", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return
        }
        
        SoleTraderBusiness.shared.firstUserFirstName = firstName.text ?? ""
        SoleTraderBusiness.shared.firstUsertitle = titleLbl.text ?? ""
        SoleTraderBusiness.shared.firstUserLastName = lastName.text ?? ""
        SoleTraderBusiness.shared.firstUserdob = dobLbl.text ?? ""
        SoleTraderBusiness.shared.firstUserShares = numberOfShares.text ?? ""
        SoleTraderBusiness.shared.firstUserEmail = emailAdd.text ?? ""
        
        let storyboard = UIStoryboard(name: "SignupUmar", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SoleTraderHomeAddViewController") as! SoleTraderHomeAddViewController
            self.navigationController?.pushViewController(destinationVC, animated: true)
        
        
        
        
    }
    
    func createDatePicker() {
        
        let toolbar  = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        dobLbl.inputAccessoryView = toolbar
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        dobLbl.inputView = datePicker
        
    }
    
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        dobLbl.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
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
