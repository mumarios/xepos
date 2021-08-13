//
//  GoogleAddViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 06/07/2021.
//

import UIKit
import Alamofire
import GoogleMaps
import GooglePlaces
import MapKit

protocol GoogleAddViewControllerDelegate:AnyObject {
    func getaddress(data:Addresses?)
}

enum ScreenMode{
    case SoleBusiness
    case SoleHomeAddress
    case ComapnyHomeAddress
}


class GoogleAddViewController: UIViewController, UISearchResultsUpdating,MKMapViewDelegate {

    @IBOutlet weak var mkViiew: UIView!
    var loc = CLLocationCoordinate2D()
    var id = ""
    var parentVC = SoleTraderBusinessAddressViewController()
    var screenMode:ScreenMode = .ComapnyHomeAddress
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    var myAddress:Addresses?{
        didSet{
            self.setupUI()
        }
    }
    weak var delegate:GoogleAddViewControllerDelegate?
    
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//
//        if annotation is MKUserLocation {
//            return nil
//        }
//
//        let reuseId = "marker"
//        var pav: MKPinAnnotationView? = self.mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as! MKPinAnnotationView
//        if pav == nil {
//            pav = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
//            pav?.isDraggable = true
//            pav?.canShowCallout = true
//        } else {
//            pav?.annotation = annotation
//        }
//        
//        if let locc = pav?.annotation?.coordinate{
//        loc   = locc
//        }
//        return pav
//    }
    func setupUI(){
        if let data = self.myAddress{
            var txt = (data.district ?? "") + ", " + (data.country ?? "")
            txt = txt + ", " + (data.postalCode ?? "")
            self.searchField.text =  txt
            self.updateMap()
        }
    }
    func updateMap(){
        loc =  CLLocationCoordinate2D(latitude: self.myAddress?.latitude ?? 0.0, longitude:self.myAddress?.longitude ?? 0.0 )
        if let ann = mapView.annotations as? MKAnnotation{
        mapView.removeAnnotation(ann)
            
        }
        let pin = MKPointAnnotation()
        pin.coordinate = loc
        
        mapView.addAnnotation(pin)
        mapView.setRegion(
           MKCoordinateRegion(
           center: loc,
            span: MKCoordinateSpan(
                latitudeDelta: 0.1,
                longitudeDelta: 0.1
            )) ,
            animated: true)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    let searchVC = UISearchController(searchResultsController: ResultViewController())
    

    override func viewDidLoad() {
        super.viewDidLoad()
        postAdd()
        mapView.delegate = self
        
        switch self.screenMode{
        case .ComapnyHomeAddress:
            self.setupHeaderTexts(headerTitle: "Home Address", desc: "Your current address where you live", bottomDesc: "Have you lived at this address for more than 6 months?")
            
        case .SoleBusiness:
            self.setupHeaderTexts(headerTitle: "Business Address", desc: "Confirm your Business address", bottomDesc: "Kindly confirm is the business address is correct?")
            
        case .SoleHomeAddress: self.setupHeaderTexts(headerTitle: "Confirm Address", desc: "Confirm your Home Address", bottomDesc: "Kindly confirm is this Home address is correct")
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func setupHeaderTexts(headerTitle:String,desc:String,bottomDesc:String){
        self.headerTitle.text = headerTitle
        self.headerLabel.text = desc
        self.bottomLabel.text = bottomDesc
    }
    
    func postAdd() {
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    

    @IBAction func backAct(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func doneAct(_ sender: Any) {
        self.delegate?.getaddress(data: self.myAddress)
//        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func noBtnAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}

extension GoogleAddViewController : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let SVC =  UIStoryboard(name: "SignupUmar", bundle: nil).instantiateViewController(identifier: "ResultViewController")  as! ResultViewController
        SVC.delegate = self
        
        SVC.modalPresentationStyle = .fullScreen
        SVC.parentVC = self
        SVC.modalPresentationStyle = .overCurrentContext
        SVC.modalTransitionStyle = .crossDissolve
       self.present(SVC, animated: true, completion: nil)
    }
}

extension GoogleAddViewController :ResultViewControllerDelegate{
    func locationUpdated(data: Addresses) {
        self.myAddress = data
    }
    
}

