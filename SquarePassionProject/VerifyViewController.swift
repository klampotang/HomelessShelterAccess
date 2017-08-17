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
    }

    @IBAction func chooseCall(_ sender: Any) {
        
    }
    @IBAction func resetNumber(_ sender: Any) {
        performSegue(withIdentifier: "backToNumber", sender: self)
    }
}
