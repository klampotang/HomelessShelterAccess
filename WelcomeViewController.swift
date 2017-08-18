//
//  WelcomeViewController.swift
//  SquarePassionProject
//
//  Created by Kelly Lampotang on 8/16/17.
//  Copyright © 2017 Kelly Lampotang. All rights reserved.
//
import UIKit

class WelcomeViewController : UIViewController {
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signupButton.layer.cornerRadius = 10
        signupButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
