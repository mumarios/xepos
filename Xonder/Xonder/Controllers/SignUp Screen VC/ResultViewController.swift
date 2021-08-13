//
//  ResultViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 14/07/2021.
//

import UIKit
import Alamofire

protocol ResultViewControllerDelegate:AnyObject {
    func locationUpdated(data:Addresses)
}

class ResultViewController: UIViewController {

    @IBOutlet weak var seerhBar: UISearchBar!
    @IBOutlet weak var tblView: UITableView!
    var parentVC: UIViewController?
//    private var places: [Place] = []
    weak var delegate:ResultViewControllerDelegate?
    var addresses = [Addresses]()
    var postalCodeModel: PostalCodeAddressModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tblView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.seerhBar.becomeFirstResponder()
    }
    
//
//    APIService.searchCompanies(name: searchField.text!) { (models, error) in
//        if error == nil,models != nil,let companiesList = models{
//            self.companies = companiesList
//            self.tblView.reloadData()
    
    func getData(name:String) {
        APIService.getPostalCodeAddress(search: name) { [weak self] (addressModel, error) in
            guard let self = self else{return}
//            guard let model = addressModel else{return}
//            guard let addressList = model.addresses else{return}
//            if addressList.count > 0{
//                self.addresses = addressList
//            }
            guard let model = addressModel, let addressList = model.addresses,addressList.count > 0 else{
                self.addresses.removeAll()
                self.tblView.reloadData()
                return
            }
            self.postalCodeModel = model
            self.addresses = addressList
            self.tblView.reloadData()
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

extension ResultViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = addresses[indexPath.row].line_1
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var obj = self.addresses[indexPath.row]
        obj.postalCode = self.seerhBar.text ?? ""
        obj.latitude = self.postalCodeModel?.latitude ?? 0.0
        obj.longitude = self.postalCodeModel?.longitude ?? 0.0
        self.delegate?.locationUpdated(data: obj)
        self.dismiss(animated: true, completion: nil)
        
        

//        tableView.deselectRow(at: indexPath, animated: true)
//        if let vc = parentVC as?  GoogleAddViewController{
//
//            let place = self.places[indexPath.row]
//            GooglePlacesManager.shared.resolveLocation(for: place){ result in
//                switch result{
//                case .success(let loc):
//                    vc.loc = loc
//                    vc.id = place.idetifier
//                    vc.updateMap()
//                    self.dismiss(animated: true, completion: nil)
//                    break
//                case .failure(let err):
//                    print(err)
//                }
//            }
//        }
        
    }
}

extension ResultViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let query = seerhBar.text, !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        self.getData(name:query)
        
//        GooglePlacesManager.shared.findPlaces(query: query){resunt in
//            switch resunt{
//            case .success(let places):
//                print(places)
//                self.places = places
//                DispatchQueue.main.async {
//                    self.tblView.reloadData()
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
}
