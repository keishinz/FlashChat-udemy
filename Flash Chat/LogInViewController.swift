//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase


class LogInViewController: UIViewController, UITextFieldDelegate {

    //Textfields pre-linked with IBOutlets
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

   
    @IBAction func logInPressed(_ sender: AnyObject) {
        
        //TODO: Log in the user. Need optional bindings.
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
            (user, error) in
            if error != nil {
                print(error!)
            } else {
                print("Login Successful.")
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        
        
    }
    


    
}  
