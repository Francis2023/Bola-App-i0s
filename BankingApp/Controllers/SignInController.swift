//
//  ViewController.swift
//  BankingApp
//
//  Created by Francis Ngafua on 10/25/20.
//

import UIKit
import Firebase


class SignInController: UIViewController {
    
    // Define IBOutlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var contactUsButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    
    override func viewDidLoad() {
       super.viewDidLoad()
    
        titleLabel.text = Constants.appName
        
    }


}

