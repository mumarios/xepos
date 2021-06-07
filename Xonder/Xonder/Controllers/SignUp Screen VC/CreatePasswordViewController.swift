//
//  CreatePasswordViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/21/21.
//

import UIKit
import Alamofire

class CreatePasswordViewController: UIViewController {

    @IBOutlet weak var passwordTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func continueBtnDidPressed(_ sender: Any) {
        //performSegue(withIdentifier: "toAddMobileNumberVC", sender: self)
        
        if passwordTxtField.text?.count  ?? 0 < 8 {
            let alertPopup = UIAlertController(title: "Please Enter password atleast 8 characters long", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return
        }
        
        register()
        
        
    }
    
    func register(){
        guard let fName = SoleTraderBusiness.shared.FirstName else {return}
        guard let Lname = SoleTraderBusiness.shared.lastName else {return}
        guard let email = SoleTraderBusiness.shared.personalEmail else {return}
        guard let phone = SoleTraderBusiness.shared.num else {return}
        guard let cNum = SoleTraderBusiness.shared.companyNumber else {return}
        guard let postal = SoleTraderBusiness.shared.postal else {return}
        guard let dob = SoleTraderBusiness.shared.dob    else {return}
        guard let add = SoleTraderBusiness.shared.address    else {return}
        guard let city = SoleTraderBusiness.shared.city    else {return}
        guard let pAdd = SoleTraderBusiness.shared.personalAdd    else {return}
        guard let businessName = SoleTraderBusiness.shared.businessName    else {return}
         let companyDate = "2020-05-10T22:01:52.5183184+01:00"
        guard let pw = passwordTxtField.text else {return}
        
//        APIService.signup(userObj: ["firstName" : fName,  "lastName": Lname ,"email": email, "password": pw, "password_confirmation": pw, "device_name": "iOS", "dateOfBirth": dob, "have_you_lived_here_for_more_then_six_month": true, "terms_and_condition": true,  "business_name": businessName, "contactPhone":phone, "industryCode": "AccommodationAndFoodServices", "type": "LimitedCompany","incorporationDate": companyDate, "companyRegistrationNumber":cNum, "isRegulated": false, "tradingAddressLine1": add, "tradingAddressCountryCode": "GB", "tradingAddressPostCode": postal, "tradingAddressCity": city, "registeredAddressLine1":pAdd, "registeredAddressCountryCode": "GB"    ]) { (response) in
//            switch response{
//            case .success(let tokenStr):
//                print(tokenStr)
//                break
//            case .failure(let err):
//                print(err)
//                break
//            }
//        }
        
        
        
        let urlString = "http://198.244.142.151/api/user/sign-up"

        Alamofire.request(urlString, method: .post, parameters: ["firstName" : fName,  "lastName": Lname ,"email": email, "password": pw, "password_confirmation": pw, "device_name": "iOS", "dateOfBirth": dob, "have_you_lived_here_for_more_then_six_month": true, "terms_and_condition": true,  "business_name": businessName, "contactPhone":phone, "industryCode": "AccommodationAndFoodServices", "type": "LimitedCompany","incorporationDate": companyDate, "companyRegistrationNumber":cNum, "isRegulated": false, "tradingAddressLine1": add, "tradingAddressCountryCode": "GB", "tradingAddressPostCode": postal, "tradingAddressCity": city, "registeredAddressLine1":pAdd, "registeredAddressCountryCode": "GB", "registeredAddressPostCode": "B90 2EL", "registeredAddressCity": "London"],encoding: JSONEncoding.default, headers: ["Content-Type": "application/json", "Accept":"application/json" ]).responseJSON {
        response in
          switch response.result {
                        case .success:
                            print(response)
                            let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
                                let destinationVC = storyboard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
                                self.navigationController?.pushViewController(destinationVC, animated: true)

                            break
                        case .failure(let error):

                            print(error)
                        }
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
