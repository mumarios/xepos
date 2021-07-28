//
//  FindCompanyViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 27/07/2021.
//

import UIKit

class FindCompanyViewController: UIViewController {
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var tblHeight: NSLayoutConstraint!
    
    var companies = [companyData]()
    private var textFieldValue = "" {
        didSet {
            debouncer.call()
        }
    }
    private var debouncer: Debouncer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        var height: CGFloat = 0
//        for cell in self.tblView.visibleCells {
//            height += cell.bounds.height
//        }
        
        SoleTraderBusiness.shared.isBusiness = true
        
        self.tblHeight.constant = 10
        self.view.layoutIfNeeded()
        debouncer = Debouncer.init(delay: 1.5, callback: debouncerApiCall)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAct(_ sender: Any) {
        
    }
    @IBAction func doneAct(_ sender: Any) {
    }
    
    @IBAction func textChanged(_ sender: Any) {
        textFieldValue = (sender as? UITextField)?.text ?? ""
    }
    
    
    private func debouncerApiCall() {
        print("debouncer api call")
        APIService.searchCompanies(name: searchField.text!) { (models, error) in
            if error == nil,models != nil,let companiesList = models{
                self.companies = companiesList
                self.tblView.reloadData()
                
          
            }
            
            
        }
    }
    
   

}

extension FindCompanyViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyDetailTableViewCell", for: indexPath) as? CompanyDetailTableViewCell{
            let data = companies[indexPath.row]
            cell.titleLbl.text = data.title
            
            if indexPath.row ==  companies.count - 1{
                var height: CGFloat = 0
                for cell in self.tblView.visibleCells {
                    height += cell.bounds.height
                }
                
                self.tblHeight.constant = height
                self.view.layoutIfNeeded()
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = companies[indexPath.row]
        
        
        
        let vc = UIStoryboard.init(name: "Company", bundle: Bundle.main).instantiateViewController(withIdentifier: "ComapanyDetailViewController") as? ComapanyDetailViewController
        vc?.companyNum = data.company_number ?? ""
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension FindCompanyViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      
        return true
    }
}

public class Debouncer: NSObject {
    public var callback: (() -> Void)
    public var delay: Double
    public weak var timer: Timer?
 
    public init(delay: Double, callback: @escaping (() -> Void)) {
        self.delay = delay
        self.callback = callback
    }
 
    public func call() {
        timer?.invalidate()
        let nextTimer = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(Debouncer.fireNow), userInfo: nil, repeats: false)
        timer = nextTimer
    }
 
    @objc func fireNow() {
        self.callback()
    }
}
