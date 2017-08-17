//
//  ShelterTableViewCell.swift
//  SquarePassionProject
//
//  Created by Kelly Lampotang on 8/17/17.
//  Copyright © 2017 Kelly Lampotang. All rights reserved.
//

import UIKit

class ShelterTableViewCell: UITableViewCell {

    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var shelterNameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func selectButtonPressed(_ sender: Any) {
    }
}
