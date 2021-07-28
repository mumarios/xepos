//
//  PeopleTableViewCell.swift
//  Xonder
//
//  Created by Muhammad Umar on 28/07/2021.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var proffession: UILabel!
    @IBOutlet weak var nname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
