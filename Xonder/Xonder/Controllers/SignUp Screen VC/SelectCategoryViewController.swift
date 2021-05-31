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
    let dropDownValues = ["Marketing", "Finance", "IT"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = "Marketing"
        dropDown.anchorView = dropDownView
        dropDown.dataSource = dropDownValues
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.titleLabel.text = dropDownValues[index]
        }

    }
    

    @IBAction func continueBtnDidPressed(_ sender: Any) {
        performSegue(withIdentifier: "toSelectSubcategoryVC", sender: self)
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
