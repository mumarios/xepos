//
//  SelectMoneyViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/21/21.
//

import UIKit
import DropDown

class SelectMoneyViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var dropDownView: UIView!
    
    let dropDown = DropDown()
    let dropDownValues = ["1000", "1200 ", "1500"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelTitle.text = "1000"
        dropDown.anchorView = dropDownView
        dropDown.dataSource = dropDownValues
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.labelTitle.text = dropDownValues[index]
        }
        
    }
    
    @IBAction func continueBtnDidPressed(_ sender: Any) {
        performSegue(withIdentifier: "toSocialProfileLinkVC", sender: self)
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
