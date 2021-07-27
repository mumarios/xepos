//
//  ResultViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 14/07/2021.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var seerhBar: UISearchBar!
    @IBOutlet weak var tblView: UITableView!
    var parentVC: UIViewController?
    private var places: [Place] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.seerhBar.becomeFirstResponder()
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
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = places[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let vc = parentVC as?  GoogleAddViewController{
            
            let place = self.places[indexPath.row]
            GooglePlacesManager.shared.resolveLocation(for: place){ result in
                switch result{
                case .success(let loc):
                    vc.loc = loc
                    vc.id = place.idetifier
                    vc.updateMap()
                    self.dismiss(animated: true, completion: nil)
                    break
                case .failure(let err):
                    print(err)
                }
            }
        }
        
    }
}

extension ResultViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let query = seerhBar.text, !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        GooglePlacesManager.shared.findPlaces(query: query){resunt in
            switch resunt{
            case .success(let places):
                print(places)
                self.places = places
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
