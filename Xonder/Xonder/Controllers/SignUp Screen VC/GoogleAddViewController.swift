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


class GoogleAddViewController: UIViewController, UISearchResultsUpdating,MKMapViewDelegate {

    @IBOutlet weak var mkViiew: UIView!
    var loc = CLLocationCoordinate2D()
    var id = ""
    var parentVC = SoleTraderBusinessAddressViewController()
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchField: UITextField!
    
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
    
    func updateMap(){
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
        
        // Do any additional setup after loading the view.
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
        parentVC.placeID = id
        parentVC.postAdd()
        self.navigationController?.popViewController(animated: true)
    }


}

extension GoogleAddViewController : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let SVC =  UIStoryboard(name: "SignupUmar", bundle: nil).instantiateViewController(identifier: "ResultViewController")  as! ResultViewController
       SVC.modalPresentationStyle = .fullScreen
       SVC.parentVC = self
        SVC.modalPresentationStyle = .overCurrentContext
        SVC.modalTransitionStyle = .crossDissolve
       self.present(SVC, animated: true, completion: nil)
    }
}
