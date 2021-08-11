//
//  PeopleViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 28/07/2021.
//

import UIKit

class PeopleViewController: UIViewController {
    @IBOutlet weak var firstTabLbl: UILabel!
    @IBOutlet weak var postalLbl: UILabel!
    @IBOutlet weak var firstTabView: ShadowView!
    @IBOutlet weak var secondTabView: ShadowView!
    @IBOutlet weak var roleLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var addLbl: UILabel!
    @IBOutlet weak var ssecondTabLbl: UILabel!
    
    var peopleArray: [Officers_list]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        // Do any additional setup after loading the view.
    }
    
    func setData(){
        
        self.firstTabView.backgroundColor = UIColor(red: 0.37, green: 0.39, blue: 0.57, alpha: 1.00)
        self.firstTabLbl.textColor = .white
        self.firstTabLbl.text = peopleArray?.first?.name ??  ""
        if peopleArray?.count ?? 0  >  1{
            SoleTraderBusiness.shared.numberofUsers = 2
        self.ssecondTabLbl.text = peopleArray?[1].name ?? ""
        } else {
            SoleTraderBusiness.shared.numberofUsers = 1
            self.ssecondTabLbl.isHidden = true
        }
        self.addLbl.text = peopleArray?.first?.address?.address_line_1 ?? ""
        self.roleLbl.text = peopleArray?.first?.officer_role ?? ""
        self.postalLbl.text = peopleArray?.first?.address?.postal_code ?? ""
        self.countryLbl.text = peopleArray?.first?.address?.country ?? ""
        
        
    }
    
    @IBAction func backAct(_ sender: Any) {

        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func firstAct(_ sender: Any) {
        self.secondTabView.backgroundColor = .white
        self.ssecondTabLbl.textColor = .black
        self.firstTabView.backgroundColor = UIColor(red: 0.37, green: 0.39, blue: 0.57, alpha: 1.00)
        self.firstTabLbl.textColor = .white
        self.addLbl.text = peopleArray?.first?.address?.address_line_1 ?? ""
        self.roleLbl.text = peopleArray?.first?.officer_role ?? ""
        self.postalLbl.text = peopleArray?.first?.address?.postal_code ?? ""
        self.countryLbl.text = peopleArray?.first?.address?.country ?? ""
        
    }
    
    @IBAction func secondAct(_ sender: Any) {
        if peopleArray?.count ?? 0  >  1{
        self.firstTabView.backgroundColor = .white
        self.firstTabLbl.textColor = .black
        self.secondTabView.backgroundColor = UIColor(red: 0.37, green: 0.39, blue: 0.57, alpha: 1.00)
        self.ssecondTabLbl.textColor = .white
        self.addLbl.text = peopleArray?[1].address?.address_line_1 ?? ""
        self.roleLbl.text = peopleArray?[1].officer_role ?? ""
        self.postalLbl.text = peopleArray?[1].address?.postal_code ?? ""
        self.countryLbl.text = peopleArray?[1].address?.country ?? ""
        }
    }
    @IBAction func doneAct(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Company", bundle: Bundle.main).instantiateViewController(withIdentifier: "FirstUsereViewController") as? FirstUsereViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
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
