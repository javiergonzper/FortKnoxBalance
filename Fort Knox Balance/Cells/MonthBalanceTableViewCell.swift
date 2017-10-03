//
//  MonthBalanceTableViewCell.swift
//  Fort Knox Balance
//
//  Created by Javier Gonzalez Perez on 3/10/17.
//  Copyright © 2017 Treasire Inc. All rights reserved.
//

import UIKit

class MonthBalanceTableViewCell: UITableViewCell {
    
    @IBOutlet var balanceValueLabel: UILabel!
    @IBOutlet var monthDateLabel: UILabel!
    @IBOutlet var monthTextLabel: UILabel!

    @IBOutlet var monthDateView: UIView!
    @IBOutlet var monthView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        monthDateView.backgroundColor = Colors.monthDateViewColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
