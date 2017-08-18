//
//  ProfileViewController.swift
//  SquarePassionProject
//
//  Created by Kelly Lampotang on 8/18/17.
//  Copyright © 2017 Kelly Lampotang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func setZipCodePressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Change Zip Code", message: "Enter in a new zipcode", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: { (textField) -> Void in
            //zipCodeTextField = textField
            //zipCodeTextField?.delegate = self
            //zipCodeTextField?.placeholder = "Zip Code"
        })
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func changePasswordClicked(_ sender: Any) {
        let alertController = UIAlertController(title: "Change Password", message: "A Verification Code will be sent to you.", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
        let twilioSID = "AC31323c9576c6980b49737681b9490847"
        let twilioSecret = "e1e48c719b8bbd106347517ac055dadc"
        let fromNumber = "3525759069"
        let toNumber = "3528712319"
        let message = "Change your password here: http://goo.gl/18sj7"
        
        // Build the request
        let request = NSMutableURLRequest(url: NSURL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")! as URL)
        request.httpMethod = "POST"
        request.httpBody = "From=\(fromNumber)&To=\(toNumber)&Body=\(message)".data(using: String.Encoding.utf8)
        
        // Build the completion block and send the request
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            print("Finished")
            if let data = data, let responseDetails = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                // Success
                print("Response: \(responseDetails)")
            } else {
                // Failure
                print("Error: \(error)")
            }
        }).resume()

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
