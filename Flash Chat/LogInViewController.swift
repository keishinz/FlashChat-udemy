//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase
import SVProgressHUD


class LogInViewController: UIViewController, UITextFieldDelegate {

    //Textfields pre-linked with IBOutlets
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
          performLogin()
       }
       // Do not add a line break
       return true
    }

    func performLogin() {
        SVProgressHUD.show()
        
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
            (user, error) in
            if error != nil {
                print(error!)
                SVProgressHUD.dismiss()
                //add warning popup
            } else {
                print("Login Successful.")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
    }
   
    @IBAction func logInPressed(_ sender: AnyObject) {
        //TODO: Log in the user. Need optional bindings.
        performLogin()
    }
    


    
}  
