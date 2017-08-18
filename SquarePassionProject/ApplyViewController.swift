//
//  ApplyViewController.swift
//  SquarePassionProject
//
//  Created by Kelly Lampotang on 8/16/17.
//  Copyright © 2017 Kelly Lampotang. All rights reserved.
//

import UIKit
import CoreLocation

class ApplyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
    var shelterNames: [String] = ["Odyssey Villas Intact Families", "The Salvation Army Metro Atlanta Red Shield Service", "Serenity House of Atlanta", "The Shepherd's Inn Downtown Atlanta Homeless Shelter", "Atlanta Union Mission", "Fuqua Hall Transitional Housing", "Gateway Center Atlanta"]
    var shelterAddress: [String] = ["625 Spencer Street NW, Atlanta, GA 30318", "469 Marietta Street, Atlanta, GA 30313", "Atlanta, GA, 30314", "165 Ivan Allen Blvd NW, Atlanta, GA 30313", "165 Alexander Street NW, Atlanta, GA 30301", "144 Mills Street, Atlanta, GA 30313", "275 Pryor St., SW, Atlanta, GA 30303"]
    var phoneNumbers: [String] = ["(404) 671-3570", "(404) 486-2700", "(844) 473-7364", "(404) 367-2493", "(404) 367-2493", "(404) 367-2492", "(404) 215-6600"]
    var latitudes: [Float] = [33.760070, 33.765630, 33.753997, 33.764896, 33.825702, 33.765150, 33.747618]
    var longitudes: [Float] = [-84.40763, -84.396639, -84.412014, -84.392461, -84.376420, -84.392273, -84.394529]

    var resultsReleasedAt : [Int] = [3, 2, 1, 3, 3, 4, 5]
    var selected : [Bool] = [false, false, false, false, false, false, false]
    var applied : [Bool] = [false, false, false, false, false, false, false]
    
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var appliedSuccessLabel: UILabel!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        appliedSuccessLabel.isHidden = true
        let defaults = UserDefaults.standard
        applied = defaults.array(forKey: "SavedApplied") as? [Bool] ?? [Bool]()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shelterNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShelterTableViewCell") as! ShelterTableViewCell
        cell.shelterNameLabel.text = shelterNames[indexPath.row]
        cell.distanceLabel.text = shelterAddress[indexPath.row]
        let defaults = UserDefaults.standard
        applied = defaults.array(forKey: "SavedApplied") as? [Bool] ?? [Bool]()
        if(applied[indexPath.row]) {
            cell.selectButton.setTitle("Applied", for: .normal)
            cell.selectButton.backgroundColor = UIColor.green
            cell.selectButton.isEnabled = false
        }
        return cell
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("Error while updating location " + error.localizedDescription)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
            
            if (error != nil) {
                print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                return
            }
            
            if (placemarks?.count)! > 0 {
                let pm = placemarks?[0]
                self.displayLocationInfo(pm)
            } else {
                print("Problem with the data received from geocoder")
            }
        })
    }
    
    func displayLocationInfo(_ placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            //let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            //let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            //let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            zipcodeLabel.text = "Your zip code is: " + postalCode!
        }
        
    }
    
    @IBAction func applyButtonClicked(_ sender: Any) {
        var i = 0
        
        for cell in tableView.visibleCells {
            let customCell = cell as! ShelterTableViewCell
            selected[i] = customCell.selectedOrNot
            if(selected[i] == true) {
                customCell.selectButton.setTitle("Applied", for: .normal)
                applied[i] = true
            }
            else {
                applied[i] = false
            }
            i += 1
        }
        i = 0
        tableView.reloadData()
        let defaults = UserDefaults.standard
        defaults.set(applied, forKey: "SavedApplied")
        defaults.synchronize()
        appliedSuccessLabel.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Make sure your segue name in storyboard is the same as this line
        if (segue.identifier == "detailView")
        {
            // Get reference to the destination view controller
            let vc = segue.destination as! DetailViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                // do the work here
                vc.addressText = shelterAddress[indexPath.section]
                vc.nameText = shelterNames[indexPath.section]
                vc.phoneText = phoneNumbers[indexPath.section]
                vc.latitude = CLLocationDegrees(latitudes[indexPath.section])
                vc.longitude = CLLocationDegrees(longitudes[indexPath.section])

            }
        }

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected[indexPath.row] = !selected[indexPath.row]
    }
    
}
