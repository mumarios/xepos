//
//  SoleTraderHomeAddViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 30/06/2021.
//

import UIKit

class SoleTraderHomeAddViewController: UIViewController {

    @IBOutlet weak var posCodeField: UITextField!
    @IBOutlet weak var add2Field: UITextField!
    @IBOutlet weak var add1Field: UITextField!
    @IBOutlet weak var cityField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let toolbar  = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        add2Field.inputAccessoryView = toolbar
        
        // Do any additional setup after loading the view.
    }
    
    @objc func donePressed() {
        self.view.endEditing(true)
    }
    
    func checkvalid() -> Bool{
        if posCodeField.text?.count == 0 {
            let alertPopup = UIAlertController(title: "Post Code", message: "Please Enter Postal Code", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return false
        }
        else if add1Field.text?.count == 0 {
            let alertPopup = UIAlertController(title: "Address", message: "Please Enter Address Line 1", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return false
        }else if cityField.text?.count == 0 {
            let alertPopup = UIAlertController(title: "City", message: "Please Enter City", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return false
        }
        return true
    }

    @IBAction func backAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func continueAct(_ sender: Any) {
        
        if checkvalid(){
            SoleTraderBusiness.shared.personalAdd = add1Field.text
            SoleTraderBusiness.shared.personalPost = posCodeField.text
            SoleTraderBusiness.shared.personalCity = cityField.text
            SoleTraderBusiness.shared.personalAdd2 = add2Field.text ?? ""
            let storyboard = UIStoryboard(name: "SignupUmar", bundle: nil)
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "SoleTraderCardViewController") as! SoleTraderCardViewController
                self.navigationController?.pushViewController(destinationVC, animated: true)
            
        }
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
