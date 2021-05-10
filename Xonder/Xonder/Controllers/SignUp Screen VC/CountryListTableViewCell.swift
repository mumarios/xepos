//
//  CountryListTableViewCell.swift
//  Xonder
//
//  Created by Daniyal Waseem on 4/27/21.
//

import UIKit

class CountryListTableViewCell: UITableViewCell {

    @IBOutlet weak var countryNameLbl: UILabel!
    
    @IBOutlet weak var countryImageLbl: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
