//
//  CountryListViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 4/27/21.
//

import UIKit
import Alamofire

class CountryListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    var countryNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.myTableView.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }
    
    func getCountriesApi() {
        let request = Alamofire.request("http://198.244.142.151/api/get-all-countries")
        request.responseJSON { (data) in
            
            if let countries = data.result.value as? [String:Any]{
                if let dataArr = countries["data"] as? [[String:Any]]{
                    for data in dataArr{
                        if let name = data["name"] as? String{
                            print("Country name \(name)")
                            self.countryNames.append(name)
                        }
                        
                    }
                    self.myTableView.reloadData()
                    
                }
                
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CountryListTableViewCell
        cell?.countryNameLbl.text = self.countryNames[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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
