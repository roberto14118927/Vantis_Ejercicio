//
//  CellTableViewCell.swift
//  Vantis
//
//  Created by Roberto Eduardo Guzman Ruiz on 8/29/19.
//  Copyright © 2019 Roberto Eduardo Guzman Ruiz. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    
    @IBOutlet var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
