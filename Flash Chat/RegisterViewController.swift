//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextfield.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ emailTextfield: UITextField) -> Bool {
       // Try to find next responder
       if let nextField = emailTextfield.superview?.viewWithTag(emailTextfield.tag + 1) {
          nextField.becomeFirstResponder()
       } else {
          // Not found, so remove keyboard.
          emailTextfield.resignFirstResponder()
       }
       // Do not add a line break
       return true
    }
  
    @IBAction func registerPressed(_ sender: AnyObject) {
                
        //TODO: Set up a new user on our Firbase database. Need Optional Bindings!
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
            (user, error) in
            if error != nil {
                print(error!)
            } else {
                print("Registration Successful.")
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        
    }
    
    
}
