//
//  SoleTraderPersonalInfoConfirmationViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 04/06/2021.
//

import UIKit

class SoleTraderPersonalInfoConfirmationViewController: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var chkBoxIMG: UIImageView!
    @IBOutlet weak var contBtn: UIButton!
    var checkout = false
    
    let imgArr  = ["bag", "email", "calendar", "phone", "location"]
    
    let titleArr = ["Company Number: ", "Email Address: ", "DOB: ", "Telephone: ", "Personal Address: "]
    
    var valueArray: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCompany()
        if let tittle = SoleTraderBusiness.shared.title, let fName = SoleTraderBusiness.shared.FirstName, let LName = SoleTraderBusiness.shared.lastName{
        self.nameLbl.text = "\(tittle) \(fName) \(LName)"
        }
        // Do any additional setup after loading the view.
    }
    
    func searchCompany(){
        if let Cname = SoleTraderBusiness.shared.businessName{
        var semaphore = DispatchSemaphore (value: 0)

        let parameters = ""
        let postData =  parameters.data(using: .utf8)
            
            let url = "http://198.244.142.151/api/filters/search-companies?q=\(Cname)"

        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        request.httpMethod = "GET"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
          print(String(data: data, encoding: .utf8)!)
            let blogPost: CompanyModel = try! JSONDecoder().decode(CompanyModel.self, from: data)
            SoleTraderBusiness.shared.companyNumber  = blogPost.data?.first?.company_number
            SoleTraderBusiness.shared.companyDate  = blogPost.data?.first?.incorporation_date
            
            if let cNum = SoleTraderBusiness.shared.companyNumber{
                self.valueArray = [cNum, SoleTraderBusiness.shared.personalEmail  ?? "", SoleTraderBusiness.shared.dob ?? "", SoleTraderBusiness.shared.num ?? "", SoleTraderBusiness.shared.personalAdd ?? "" ]
            }
            self.tblView.reloadData()
            
          semaphore.signal()
        }
            

        task.resume()
        semaphore.wait()
        }

    }
    
    @IBAction func checkBtnAct(_ sender: Any) {
        checkout = !checkout
        
        if checkout{
            chkBoxIMG.image = UIImage(named: "checkboxTick")
        } else {
            chkBoxIMG.image = UIImage(named: "checkboxBlank")
        }
    }
    @IBAction func backAct(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func contAct(_ sender: Any) {
        if checkout{
            let storyboard = UIStoryboard(name: "Signup", bundle: nil)
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "CreatePasswordViewController") as! CreatePasswordViewController
                self.navigationController?.pushViewController(destinationVC, animated: true)
            
        } else {
            let alertPopup = UIAlertController(title: "Please select that all information is correct", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return
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

extension SoleTraderPersonalInfoConfirmationViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SoleTraderAddressTableViewCell", for: indexPath) as? SoleTraderAddressTableViewCell{
            if let value = valueArray?[indexPath.row]{
                cell.valueLbl.text = value
            }
            cell.imageView?.image = UIImage(named: imgArr[indexPath.row])
            cell.keyLbl.text = titleArr[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

