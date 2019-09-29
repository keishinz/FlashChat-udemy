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
        passwordTextfield.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool {
       // Try to find next responder
       if let nextField = textfield.superview?.viewWithTag(textfield.tag + 1) {
          nextField.becomeFirstResponder()
       } else {
          // Not found, so remove keyboard.
          textfield.resignFirstResponder()
          performRegister()
       }
       // Do not add a line break
       return true
    }
  
    func performRegister() {
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
    
    @IBAction func registerPressed(_ sender: AnyObject) {
        //TODO: Set up a new user on our Firbase database. Need Optional Bindings!
        performRegister()
    }
}
