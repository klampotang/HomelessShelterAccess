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
        return cell
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: Error!) {
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
        appliedSuccessLabel.isHidden = false
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Make sure your segue name in storyboard is the same as this line
        if (segue.identifier == "detailView")
        {
            // Get reference to the destination view controller
            let vc = segue.destination as! DetailViewController
            //Pass stuff
            //TODO
        }

    }
    
}
