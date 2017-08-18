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
            let defaults = UserDefaults.standard
            let usernameKey = username! + "Username"
            //Save password
            defaults.set(password, forKey: usernameKey)
            defaults.synchronize()
            
            performSegue(withIdentifier: "goToMain", sender: self)
        } else {
            errorLabel.text = "Passwords entered do not match"
            errorLabel.isHidden = false
        }
    }
    

}
