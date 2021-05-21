//
//  SignupMobileViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 07/04/2021.
//

import UIKit
//import ACFloatingTextfield_Objc
//import SKCountryPicker

class SignupMobileViewController: UIViewController {

//    @IBOutlet weak var mobileField: ACFloatingTextField!
//    @IBOutlet weak var codeField: ACFloatingTextField!
//
//    var userModel:GoogleAuthValues?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        mobileField.text = userModel.
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func showCountry(_ sender: Any) {
        presentCountryPickerScene(withSelectionControlEnabled: true)
    }
    
    @IBAction func continueAction(_ sender: Any) {
       
        performSegue(withIdentifier: "toSignupVerifyScreen", sender: self)

//        if mobileField.text!.isEmpty{
//            let alertPopup = UIAlertController(title: "Empty Field", message: "Please Check Fields", preferredStyle: .alert)
//            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
//                self.dismiss(animated: true)
//            }))
//            present(alertPopup, animated: true, completion: nil)
//
//        }
//        else{
//        let vc = UIStoryboard.init(name: "Signup", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignupOTPViewController") as? SignupOTPViewController
//
//        self.navigationController?.pushViewController(vc!, animated: true)
//        }
        
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
extension SignupMobileViewController{
    func presentCountryPickerScene(withSelectionControlEnabled selectionControlEnabled: Bool = true) {
//          switch selectionControlEnabled {
//          case true:
//              // Present country picker with `Section Control` enabled
//              let countryController = CountryPickerWithSectionViewController.presentController(on: self) { [weak self] (country: Country) in
//
//                  guard let self = self else { return }
//                self.codeField.text = country.dialingCode
////                  self.countryImageView.isHidden = false
////                  self.countryImageView.image = country.flag
////                  self.countryCodeButton.setTitle(country.dialingCode, for: .normal)
//              }
//
//            countryController.view.backgroundColor = .black
//              countryController.flagStyle = .circular
//              countryController.isCountryFlagHidden = false
//              countryController.isCountryDialHidden = true
//              countryController.favoriteCountriesLocaleIdentifiers = ["PK", "UK"]
//          case false:
//              // Present country picker without `Section Control` enabled
//              let countryController = CountryPickerController.presentController(on: self) { [weak self] (country: Country) in
//
//                  guard let self = self else { return }
//
////                  self.countryImageView.isHidden = false
////                  self.countryImageView.image = country.flag
////                  self.countryCodeButton.setTitle(country.dialingCode, for: .normal)
//              }
//
//              countryController.flagStyle = .corner
//              countryController.isCountryFlagHidden = true
//              countryController.isCountryDialHidden = false
//              countryController.favoriteCountriesLocaleIdentifiers = ["IN", "US"]
//          }
      }
}
