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
    var winningNumber1 = -1
    var waitlistNumber3 = -1
    var arrayOfTBDShelters = [String]()
    var arrayTBDIndices = [Int]()
    @IBOutlet weak var waitlistLabel: UILabel!
    var resultsReleasedAt : [Int] = [12, 2, 1, 3, 3, 4, 5]
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
        if(hour > 12) {
            hour = hour-12
        }
        randomlyChoose()
        displayChosen()
        displayWaitlist()
        displayNotYetResults()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func randomlyChoose() {
        winningNumber1 = generateRandomNumber(min: 0, max: 2)
        waitlistNumber3 = winningNumber1
        while(waitlistNumber3 == winningNumber1) {
            waitlistNumber3 = generateRandomNumber(min: 0, max: 2)
        }
        
    }
    func displayWaitlist() {
        var waitlistString = ""
        for i in 0 ..< shelterNames.count {
            if(i == waitlistNumber3) {
                waitlistString += shelterNames[i]
                let waitlistValue = ": (You are spot " + String(generateRandomNumber(min: 2, max: 40)) + " on the waitlist)"
                waitlistString += waitlistValue
            }
        }
        waitlistLabel.text = waitlistString
    }
    func displayChosen() {
        for i in 0 ..< shelterNames.count {
            if(i == winningNumber1) {
                result1.text = shelterNames[winningNumber1]
            }
        }
    }
    func generateRandomNumber(min: Int, max: Int) -> Int {
        let randomNum = Int(arc4random_uniform(UInt32(max) - UInt32(min)) + UInt32(min))
        return randomNum
    }
    func displayNotYetResults() {
        for i in 0 ..< resultsReleasedAt.count {
            if(resultsReleasedAt[i] > hour && (appliedShelters?[i])!) {
                //Display this in the not yet released:
                arrayTBDIndices.append(i)
                let timeAsString = String(resultsReleasedAt[i])
                arrayOfTBDShelters.append(shelterNames[i] + " available at " + timeAsString + ".")
            }
        }
        var tbdString = ""
        for val in arrayOfTBDShelters {
            tbdString += val
            tbdString += " "
        }
        tbdLabel.text = tbdString
        tbdLabel.adjustsFontSizeToFitWidth = true
    }
    func checkIfTBDNumber(number: Int) -> Bool {
        for val in arrayTBDIndices {
            if(number == val) {
                return true
            }
        }
        return false
    }
}
