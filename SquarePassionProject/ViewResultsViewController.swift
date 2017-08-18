//
//  ViewResultsViewController.swift
//  SquarePassionProject
//
//  Created by Kelly Lampotang on 8/16/17.
//  Copyright © 2017 Kelly Lampotang. All rights reserved.
//

import UIKit

class ViewResultsViewController: UIViewController {

    @IBOutlet weak var result1: UILabel!
    @IBOutlet weak var result2: UILabel!
    @IBOutlet weak var tbdLabel: UILabel!
    @IBOutlet weak var waitlistLabel: UILabel!
    var resultsReleasedAt : [Int] = [3, 2, 1, 3, 3, 4, 5]
    var appliedShelters : [Bool]?
    var shelterNames: [String] = ["Odyssey Villas Intact Families", "The Salvation Army Metro Atlanta Red Shield Service", "Serenity House of Atlanta", "The Shepherd's Inn Downtown Atlanta Homeless Shelter", "Atlanta Union Mission", "Fuqua Hall Transitional Housing", "Gateway Center Atlanta"]
    var shelterAddress: [String] = ["625 Spencer Street NW, Atlanta, GA 30318", "469 Marietta Street, Atlanta, GA 30313", "Atlanta, GA, 30314", "165 Ivan Allen Blvd NW, Atlanta, GA 30313", "165 Alexander Street NW, Atlanta, GA 30301", "144 Mills Street, Atlanta, GA 30313", "275 Pryor St., SW, Atlanta, GA 30303"]
    var hour = 12
    override func viewDidLoad() {
        super.viewDidLoad()
        //Get applied array:
        let defaults = UserDefaults.standard
        appliedShelters = defaults.array(forKey: "SavedApplied") as? [Bool] ?? [Bool]()
        let date = Date()
        let calendar = Calendar.current
        
        hour = calendar.component(.hour, from: date)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func displayNotYetResults() {
        var arrayOfTBDShelters = [String]()
        for i in 0 ..< resultsReleasedAt.count {
            if(resultsReleasedAt[i] > hour && (appliedShelters?[i])!) {
                //Display this in the not yet released:
                arrayOfTBDShelters.append(shelterNames[i])
            }
        }
    }
}
