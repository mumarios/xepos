//
//  SoleTraderAddressTableViewCell.swift
//  Xonder
//
//  Created by Muhammad Umar on 04/06/2021.
//

import UIKit

class SoleTraderAddressTableViewCell: UITableViewCell {

    @IBOutlet weak var keyLbl: UILabel!
    @IBOutlet weak var valueLbl: UILabel!
    @IBOutlet weak var cellIMG: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
