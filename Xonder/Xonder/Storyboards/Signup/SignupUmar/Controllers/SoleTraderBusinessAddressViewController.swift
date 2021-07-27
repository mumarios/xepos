//
//  SoleTraderBusinessAddressViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 04/06/2021.
//

import UIKit
import GooglePlaces
import Alamofire

class SoleTraderBusinessAddressViewController: UIViewController {
    @IBOutlet weak var postalField: UITextField!
    @IBOutlet weak var contBttn: UIButton!
    
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    var placeID = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func openPlaces(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SignupUmar", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "GoogleAddViewController") as! GoogleAddViewController
        destinationVC.parentVC = self
            self.navigationController?.pushViewController(destinationVC, animated: true)
        
//        let autocompleteController = GMSAutocompleteViewController()
//           autocompleteController.delegate = self
//        // Specify the place data types to return.
//
//
//        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) | UInt(GMSPlaceField.placeID.rawValue))
//
//           autocompleteController.placeFields = fields
//
//           // Specify a filter.
//           let filter = GMSAutocompleteFilter()
//        filter.type = .address
//           autocompleteController.autocompleteFilter = filter
//
//           // Display the autocomplete view controller.
//           present(autocompleteController, animated: true, completion: nil)
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
        SoleTraderBusiness.shared.address  = postalField.text
        SoleTraderBusiness.shared.postal  = addressField.text
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


extension SoleTraderBusinessAddressViewController: GMSAutocompleteViewControllerDelegate {

  // Handle the user's selection.
  func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
    print("Place name: \(place.name)")
    print("Place ID: \(place.placeID)")
    placeID = place.placeID ?? ""
    print("Place attributions: \(place.attributions)")
    dismiss(animated: true, completion: nil)
    postAdd()
  }
    
    func postAdd() {
        let request = Alamofire.request("https://maps.googleapis.com/maps/api/geocode/json?place_id=\(placeID)&key=AIzaSyCCic8SUA4IDFdmxGZ-REwQToMPbcE8xds")
        request.responseJSON { (data) in
            
            if let countries = data.result.value as? [String:Any]{
                if let dataArr = countries["results"] as? [[String:Any]]{
                    for data in dataArr{
                        if let name = data["formatted_address"] as? String{
                            print("Country name \(name)")
                            self.postalField.text = name
                        }
                        
                    }
                    
                }
                
            }
            
        }
    }

  func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
    // TODO: handle the error.
    print("Error: ", error.localizedDescription)
  }

  // User canceled the operation.
  func wasCancelled(_ viewController: GMSAutocompleteViewController) {
    dismiss(animated: true, completion: nil)
  }

  // Turn the network activity indicator on and off again.
  func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
  }

  func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
  }

}
