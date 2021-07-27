//
//  SoleTraderBusinessConformationViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 04/06/2021.
//

import UIKit

class SoleTraderBusinessConformationViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var chkBoxIMG: UIImageView!
    @IBOutlet weak var contBtn: UIButton!
    var checkout = false
    
    let imgArr  = ["bag", "star", "email", "home", "phone", "location", "postalCode", "countryIcon",  "cityIcon"]
    
    let titleArr = ["Business Name: ", "Purpose of Account: ", "Email Address: ", "Website: ", "Telephone: ", "Business Address: ", "Postal Code: ", "Country :", "City :"]
    
    let valueArray = [SoleTraderBusiness.shared.businessName, SoleTraderBusiness.shared.purpose ?? "", SoleTraderBusiness.shared.email ?? "",  SoleTraderBusiness.shared.web ?? "", SoleTraderBusiness.shared.num ?? "", SoleTraderBusiness.shared.address ?? "", SoleTraderBusiness.shared.postal ?? "", SoleTraderBusiness.shared.country ?? "", SoleTraderBusiness.shared.city ??  ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
            let storyboard = UIStoryboard(name: "SignupUmar", bundle: nil)
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "SoleTraderPersonalInfoViewController") as! SoleTraderPersonalInfoViewController
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

extension SoleTraderBusinessConformationViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SoleTraderAddressTableViewCell", for: indexPath) as? SoleTraderAddressTableViewCell{
            if let value = valueArray[indexPath.row]{
                cell.valueLbl.text = value
            }
            cell.imageView?.image = UIImage(named: imgArr[indexPath.row])
            cell.keyLbl.text = titleArr[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}
