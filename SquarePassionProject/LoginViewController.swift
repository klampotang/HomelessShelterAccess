//
//  LoginViewController.swift
//  SquarePassionProject
//
//  Created by Kelly Lampotang on 8/16/17.
//  Copyright © 2017 Kelly Lampotang. All rights reserved.
//

import UIKit

class LoginViewController : UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    let defaults = UserDefaults.standard
    let welcomeStrings : [String] = ["Welcome!", "Let's find you a bed", "You've found your haven", "Let us help you", "Hope your day is going well!", "You look great today!"]
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.isHidden = true
        welcomeLabel.adjustsFontSizeToFitWidth = true

        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
        var welcomeTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(LoginViewController.welcomeFade), userInfo: nil, repeats: true)
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func welcomeFade() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.welcomeLabel.alpha = 1.0
        }, completion: {
            (finished: Bool) -> Void in
            
            self.welcomeLabel.text = self.welcomeStrings[self.count%self.welcomeStrings.count]
            self.count+=1
            // Fade in
            UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.welcomeLabel.alpha = 0.0
            }, completion: nil)
        })

    }
    
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        //Check username
        let usernametextfieldlowercase = usernameTextField.text?.lowercased()
        let usernameKey = usernametextfieldlowercase! + "Username"
        let passwordReal = defaults.string(forKey: usernameKey)
        if(passwordReal != passwordTextField.text) {
            messageLabel.text = "Incorrect login credentials"
            messageLabel.isHidden = false
        }
        else {
            messageLabel.text = "Success!"
            messageLabel.isHidden = false
            performSegue(withIdentifier: "loginSuccess", sender: self)
        }
    }
    

}
