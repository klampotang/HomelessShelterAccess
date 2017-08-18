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
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        //Check username
        //TODO
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
