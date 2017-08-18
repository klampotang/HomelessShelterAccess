//
//  VerifyViewController.swift
//  SquarePassionProject
//
//  Created by Kelly Lampotang on 8/16/17.
//  Copyright © 2017 Kelly Lampotang. All rights reserved.
//

import UIKit

class VerifyViewController : UIViewController {
    @IBOutlet weak var enteredVerificationNumber: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessageLabel.isHidden = true
        // Do any additional setup after loading the view.
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickedVerify(_ sender: Any) {
        let enteredNumber = enteredVerificationNumber.text
        if (enteredNumber == "1276") {
            errorMessageLabel.text = "Success!"
            errorMessageLabel.isHidden = false
            performSegue(withIdentifier: "verifiedSuccess", sender: self)
        } else {
            errorMessageLabel.isHidden = false
        }
    }
    @IBAction func resendCode(_ sender: Any) {
        let twilioSID = "AC31323c9576c6980b49737681b9490847"
        let twilioSecret = "e1e48c719b8bbd106347517ac055dadc"
        let fromNumber = "3525759069"
        let toNumber = "3528712319"
        let message = "Your Verification number is 1276"
        
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

    @IBAction func chooseCall(_ sender: Any) {
        //TODO
    }
    @IBAction func resetNumber(_ sender: Any) {
        performSegue(withIdentifier: "backToNumber", sender: self)
    }
}
