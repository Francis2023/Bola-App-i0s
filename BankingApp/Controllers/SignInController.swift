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
    
    // Hide the navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    // View Did Load
    override func viewDidLoad() {
       super.viewDidLoad()
    
        titleLabel.text = Constants.appName
        
    }

    @IBAction func signInPressed(_ sender: UIButton) {
        
        if let email = usernameInput.text, let password = passwordInput.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
             // guard let strongSelf = self else { return }
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: Constants.signInSegue, sender: self)
                }
            }
        }
    }
    
    
}

