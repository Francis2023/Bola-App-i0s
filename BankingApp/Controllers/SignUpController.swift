//
//  SignUpController.swift
//  BankingApp
//
//  Created by Francis Ngafua on 12/12/20.
//

import UIKit

import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

class SignUpController: UIViewController {
    
    
    @IBOutlet weak var fullnameInput: UITextField!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var phoneNumberInput: UITextField!
    @IBOutlet weak var emailAddressInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var merchantInput: UISwitch!
    @IBOutlet weak var signUpButton: UIButton!
    
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Start firestore set up
        let settings = FirestoreSettings()
        
        Firestore.firestore().settings = settings
        // end setup
        
        db = Firestore.firestore()
    }
    
    override func didReceiveMemoryWarning() {
             super.didReceiveMemoryWarning()
             // Dispose of any resources that can be recreated.
           }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        
        
            // Create new user using Firebase email/password authenication
        if let email = emailAddressInput.text, let password = passwordInput.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                // Print error else create user's profile and go to the home page
                if error != nil {
                    
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    self.clearTextField()
                    
                } else {
                        
                    self.createUser()
                    self.performSegue(withIdentifier: Constants.signUpSegue, sender: self)
                }
            }
        }
        
    }
    
    
    
    // MARK: Create user function
    
    func createUser() {
        
        let merchant = merchantInput.isOn
        
        if let name = fullnameInput.text,
        let username = usernameInput.text,
        let contact = phoneNumberInput.text,
        let email = emailAddressInput.text{
        
            // Add a new document with a generated ID
            var ref: DocumentReference? = nil
            ref = db.collection("users").addDocument(data: [
                "username": username,
                "name": name,
                "contact": contact,
                "email": email,
                "merchant": merchant
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
              }
        }
    }
    
    func clearTextField() {
        fullnameInput.text = ""
        usernameInput.text = ""
        phoneNumberInput.text = ""
        emailAddressInput.text = ""
        passwordInput.text = ""
        merchantInput.isOn = false
    }
    
    
}
