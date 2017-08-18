//
//  SignupViewController.swift
//  SquarePassionProject
//
//  Created by Kelly Lampotang on 8/16/17.
//  Copyright © 2017 Kelly Lampotang. All rights reserved.
//

import UIKit

class SignUpViewController : UIViewController {
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var loginFacebookButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.orLabel.alpha = 0.0
        self.loginFacebookButton.alpha = 0.0
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        UIView.animate(withDuration: 2.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.orLabel.alpha = 1.0
            self.loginFacebookButton.alpha = 1.0
        }, completion: {
            (finished: Bool) -> Void in
            
            // Fade in
            UIView.animate(withDuration: 3.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.orLabel.alpha = 1.0
                self.loginFacebookButton.alpha = 1.0
            }, completion: nil)
        })

    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
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
    

}
