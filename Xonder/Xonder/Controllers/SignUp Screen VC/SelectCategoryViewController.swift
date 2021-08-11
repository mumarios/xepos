//
//  SelectCategoryViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/21/21.
//

import UIKit
import DropDown

class SelectCategoryViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dropDownView: UIView!
    
    let dropDown = DropDown()
    var dropDownValues = ["Marketing", "Finance", "IT"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
        titleLabel.text = "Marketing"
     

    }
    @IBAction func backActt(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func getData(){
        APIService.getCategories(){ (cat,err) in
            if err == nil{
                guard let categories = cat else {return}
                self.dropDownValues.removeAll()
                for value in categories{
                    self.dropDownValues.append(value.label ?? "")
                }
                self.titleLabel.text = self.dropDownValues.first
                SoleTraderBusiness.shared.category =  self.titleLabel.text?.replacingOccurrences(of: " ", with: "") //self.titleLabel.text
                self.dropDown.anchorView = self.dropDownView
                self.dropDown.dataSource = self.dropDownValues
                self.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    self.titleLabel.text = self.dropDownValues[index]
                    SoleTraderBusiness.shared.category = self.titleLabel.text?.replacingOccurrences(of: " ", with: "")
                }
                self.dropDown.reloadAllComponents()
            } else {
                print("fail to load values")
            }
        }
    }

    @IBAction func continueBtnDidPressed(_ sender: Any) {
        if SoleTraderBusiness.shared.isSole{
        let vc = UIStoryboard.init(name: "SignupUmar", bundle: Bundle.main).instantiateViewController(withIdentifier: "SoleTraderBusinessViewController") as? SoleTraderBusinessViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        } else {
            let vc = UIStoryboard.init(name: "Company", bundle: Bundle.main).instantiateViewController(withIdentifier: "FindCompanyViewController") as? FindCompanyViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
        //performSegue(withIdentifier: "toSelectSubcategoryVC", sender: self)
    }
    
    
    @IBAction func dropDownPressed(_ sender: Any) {
        dropDown.show()
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
