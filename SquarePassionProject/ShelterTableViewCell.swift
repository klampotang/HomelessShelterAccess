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
    
    var selectedOrNot = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        shelterNameLabel.adjustsFontSizeToFitWidth = true
        distanceLabel.adjustsFontSizeToFitWidth = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    @IBAction func selectButtonPressed(_ sender: Any) {
        if(!selectedOrNot) {
            selectButton.backgroundColor = UIColor.green
            selectButton.setTitle("Selected", for: .normal)
            selectedOrNot = true
        } else {
            selectButton.backgroundColor = UIColor.blue //TODO
            selectButton.setTitle("Select", for: .normal)
            selectedOrNot = false
        }
    }
    @IBAction func detailsButtonPressed(_ sender: Any) {
    }
}
