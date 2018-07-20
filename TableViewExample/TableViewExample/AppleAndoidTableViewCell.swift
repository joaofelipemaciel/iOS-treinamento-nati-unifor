//
//  AppleAndoidTableViewCell.swift
//  TableViewExample
//
//  Created by administrador on 13/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit

class AppleAndoidTableViewCell: UITableViewCell {

    @IBOutlet weak var apple: UIImageView!
    @IBOutlet weak var compareLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
