//
//  DetailViewController.swift
//  SquarePassionProject
//
//  Created by Kelly Lampotang on 8/17/17.
//  Copyright © 2017 Kelly Lampotang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var addressText = ""
    var nameText = ""
    var phoneText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = nameText
        addressLabel.text = addressText
        phoneLabel.text = phoneText
        nameLabel.adjustsFontSizeToFitWidth = true
        addressLabel.adjustsFontSizeToFitWidth = true
        phoneLabel.adjustsFontSizeToFitWidth = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func applyButtonPressed(_ sender: Any) {
        
    }

}
