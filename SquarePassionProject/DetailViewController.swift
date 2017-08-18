//
//  DetailViewController.swift
//  SquarePassionProject
//
//  Created by Kelly Lampotang on 8/17/17.
//  Copyright © 2017 Kelly Lampotang. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var addressText = ""
    var nameText = ""
    var phoneText = ""
    var latitude:CLLocationDegrees = 0
    var longitude:CLLocationDegrees = 0
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
    
    @IBAction func openInMapsButtonClicked(_ sender: Any) {
        openInMaps()
    }
    @IBAction func applyButtonPressed(_ sender: Any) {
        
    }
    @IBAction func callPhoneClicked(_ sender: Any) {
        print("Call clicked")
        let number = phoneText.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        print(number)
        UIApplication.shared.open(URL(string: "tel://" + number)!, options: [:], completionHandler: nil)
    }
    func openInMaps() {
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = nameText
        mapItem.openInMaps(launchOptions: options)
    }

}
