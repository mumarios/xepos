//
//  SelectNumberOfPaymentsViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/21/21.
//

import UIKit
import DropDown

class SelectNumberOfPaymentsViewController: UIViewController {

    @IBOutlet weak var dropDownView: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    
    let dropDown = DropDown()
    let dropDownValues = ["80 - 100", "100 - 120 ", "120 - 150"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelTitle.text = "50 - 80"
        dropDown.anchorView = dropDownView
        dropDown.dataSource = dropDownValues
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.labelTitle.text = dropDownValues[index]
        }
        
    }
    
    @IBAction func dropDownPressed(_ sender: Any) {
            dropDown.show()
    }
    @IBAction func continueBtnDidPressed(_ sender: Any) {
        performSegue(withIdentifier: "toMaxSinglePaymentVC", sender: self)
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
