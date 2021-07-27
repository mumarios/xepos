//
//  CompanyDetailTableViewCell.swift
//  Xonder
//
//  Created by Muhammad Umar on 27/07/2021.
//

import UIKit

class CompanyDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

