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
    
    // Check if the user didn't logout, if not, go to homepage
//    override func viewDidAppear(_ animated: Bool){
//     super.viewDidAppear(animated)
//     if Auth.auth().currentUser != nil {
//       self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
//    }
//    }
//
    // View Did Load
    override func viewDidLoad() {
       super.viewDidLoad()

        
    }

    @IBAction func signInPressed(_ sender: UIButton) {
        
        if let email = usernameInput.text, let password = passwordInput.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                
                if (error == nil){
                    self.performSegue(withIdentifier: Constants.signInSegue, sender: self)
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                        
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                    self.viewDidLoad()
                        
                }
            }
        }
    }
    
    
}
