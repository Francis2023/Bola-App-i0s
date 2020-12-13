//
//  SignUpController.swift
//  BankingApp
//
//  Created by Francis Ngafua on 12/12/20.
//

import UIKit
import Firebase

class SignUpController: UIViewController {
    
    
    @IBOutlet weak var fullNameInput: UITextField!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var phoneNumberInput: UITextField!
    @IBOutlet weak var emailAddressInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var merchantInput: UISwitch!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        // Create new user using Firebase email/password authenication
        if let email = emailAddressInput.text, let password = passwordInput.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                // Print error else create user's profile and go to the home page
                if let e = error {
                    print(e)
                } else {
                    
                    
                    self.performSegue(withIdentifier: <#T##String#>, sender: self)
                }
            }
        }
        
    }
    
   
    
    
    
}
