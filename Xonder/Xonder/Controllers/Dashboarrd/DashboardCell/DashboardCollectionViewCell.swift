//
//  DashboardCollectionViewCell.swift
//  Xonder
//
//  Created by Muhammad Umar on 19/05/2021.
//

import UIKit

class DashboardCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setLabel(lbl: String){
        personalLbl.text = lbl
    }
    var vc: DashboardViewController? = nil
    
    @IBOutlet weak var personalLbl: UILabel!
    @IBAction func personalAct(_ sender: Any) {
        
        vc?.showSelectionVC()
    }
}
