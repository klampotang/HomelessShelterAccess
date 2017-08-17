//
//  ContinueSignUpViewController.swift
//  SquarePassionProject
//
//  Created by Kelly Lampotang on 8/16/17.
//  Copyright © 2017 Kelly Lampotang. All rights reserved.
//

import UIKit

class ContinueSignUpViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var errorLabel: UILabel!
    
    var username : String?
    var password : String?
    var age : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func continueButtonPressed(_ sender: Any) {
        if(usernameTextField.text == "" ||
        passwordTextField.text == "" ||
        confirmPasswordTextField.text == "" ||
            ageTextField.text == "") {
            errorLabel.text = "Please fill out all fields"
            errorLabel.isHidden = false
        }
        if(passwordTextField.text == confirmPasswordTextField.text) {
            errorLabel.isHidden = true
            username = usernameTextField.text
            password = passwordTextField.text
            age = ageTextField.text
            performSegue(withIdentifier: "goToMain", sender: self)
        } else {
            errorLabel.text = "Passwords entered do not match"
            errorLabel.isHidden = false
        }
    }
    

}
