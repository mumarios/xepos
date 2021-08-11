//
//  ComapanyDetailViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 7/28/21.
//

import UIKit

class ComapanyDetailViewController: UIViewController {
    @IBOutlet weak var companyNo: UILabel!
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var addresslbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    var isCheck = false
    var vc = FindCompanyViewController()
    var companies: CompanyDetailsData?
    var companyNum = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetails()

        // Do any additional setup after loading the view.
    }
    func getDetails(){
        APIService.getCompaniesDetails(name: companyNum) { (models, error) in
            if error == nil,models != nil,let companiesList = models{
                self.companies = companiesList
                var addString = ""
                if let add = self.companies?.registered_office_address{
                    let line1 =  add.address_line_1 ?? ""
                    let line2 =  add.address_line_2 ?? ""
                    let loc  = add.locality ?? ""
                    let postal = add.postal_code ?? ""
                    let country = add.country ?? ""
                    SoleTraderBusiness.shared.city =  add.locality
                    SoleTraderBusiness.shared.tradingAdd = line1
                    SoleTraderBusiness.shared.tradingAdd2 = line2
                    SoleTraderBusiness.shared.loc = loc
                    SoleTraderBusiness.shared.postal = postal
                    SoleTraderBusiness.shared.country = country
                    
                    addString = "\(line1),\(line2),\(loc),\(postal),\(country)"
                }
                self.addresslbl.text = addString
                self.datelbl.text = self.companies?.incorporation_date ?? ""
                self.nameLbl.text = self.companies?.company_name ?? ""
                self.companyNo.text = self.companyNum
                self.tblView.reloadData()
                
          
            } else {
                self.vc.showError = true
                self.navigationController?.popViewController(animated: true)
            }
            
            
        }
    }
    @IBAction func backAct(_ sender: Any) {
        vc.showError = false
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func contAct(_ sender: Any) {
        if isCheck {
            SoleTraderBusiness.shared.businessName = self.nameLbl.text
            SoleTraderBusiness.shared.companyDate = self.datelbl.text
            SoleTraderBusiness.shared.companyNumber = self.companyNo.text
           
            let vc = UIStoryboard.init(name: "Company", bundle: Bundle.main).instantiateViewController(withIdentifier: "PeopleViewController") as? PeopleViewController
            vc?.peopleArray = self.companies?.officers_list
            self.navigationController?.pushViewController(vc!, animated: true)
            
            
        } else {
            let alertPopup = UIAlertController(title: "Please Confirm the details by tapping the checkbox", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
        }
    }
    @IBOutlet weak var checkBox: UIImageView!
    @IBAction func checkAct(_ sender: Any) {
        isCheck = !isCheck
        if isCheck {
            checkBox.image  = UIImage(named: "checkboxTick")
        } else {
            checkBox.image = UIImage(named: "checkboxBlank")
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

extension ComapanyDetailViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.companies?.officers_list?.count ?? 0 > 2 {
            return 2
        } else {
            return self.companies?.officers_list?.count ?? 0
        }
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleTableViewCell", for: indexPath ) as? PeopleTableViewCell{
            cell.nname.text = self.companies?.officers_list?[indexPath.row].name ?? ""
            cell.proffession.text = self.companies?.officers_list?[indexPath.row].officer_role ?? ""
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
